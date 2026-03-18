#!/usr/bin/env bash
# =============================================================================
#  setup-snapper-limine.sh
#
#  Post-install script for Arch Linux (archinstall + Limine + Btrfs).
#  Sets up:
#    - snapper                (snapshot manager)
#    - snap-pac               (auto snapshots on pacman transactions)
#    - limine-snapper-sync    (syncs snapshots into Limine boot menu)
#    - limine-mkinitcpio-hook (kernel hook for Limine + OverlayFS initramfs)
#
#  Run as a regular user — the script will ask for your sudo password once.
#  Exits cleanly if requirements are not met.
#
#  Requirements:
#    - UEFI system
#    - Btrfs root filesystem
#    - Limine bootloader installed
#    - yay installed
#    - @snapshots subvolume at top level (subvolid=5), mounted at /.snapshots
# =============================================================================
set -euo pipefail

# ── Colors ────────────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

info()    { echo -e "${CYAN}[INFO]${RESET}  $*"; }
success() { echo -e "${GREEN}[OK]${RESET}    $*"; }
warn()    { echo -e "${YELLOW}[WARN]${RESET}  $*"; }
step()    { echo -e "\n${BOLD}━━━ $* ━━━${RESET}"; }

# Prints an error and exits cleanly (no stacktrace)
fail() {
    echo -e "\n${RED}${BOLD}[REQUIREMENT NOT MET]${RESET} $*" >&2
    echo -e "${RED}Aborting. No changes were made.${RESET}\n" >&2
    exit 1
}

# ── Self-escalation — ask for sudo password once, then re-exec as root ────────
if [[ $EUID -ne 0 ]]; then
    exec sudo --preserve-env=HOME,USER REAL_USER="$USER" bash "$0" "$@"
fi

# REAL_USER is either passed via env (self-exec path) or SUDO_USER (manual sudo)
REAL_USER="${REAL_USER:-${SUDO_USER:-}}"

#  Preflight — all requirements checked up front, no changes made yet
# =============================================================================
step "Checking requirements"

ERRORS=0

check() {
    local label="$1"; shift
    if eval "$@" &>/dev/null; then
        echo -e "  ${GREEN}✔${RESET} $label"
    else
        echo -e "  ${RED}✘${RESET} $label"
        ERRORS=$(( ERRORS + 1 ))
    fi
}

check "UEFI system"                     "[[ -d /sys/firmware/efi ]]"
check "Root filesystem is Btrfs"        "[[ \"\$(findmnt -n -o FSTYPE /)\" == btrfs ]]"
check "limine is installed"             "command -v limine"
check "yay is installed"                "command -v yay"
check "/.snapshots is a mountpoint"     "mountpoint -q /.snapshots"
check "Snapper root config exists"      "snapper -c root list"

# Check that @snapshots exists at the Btrfs top level (subvolid=5)
BTRFS_DEV=$(findmnt -n -o SOURCE / 2>/dev/null || true)
SNAP_SUBVOL=""
if [[ -n "$BTRFS_DEV" ]]; then
    TMPBTRFS=$(mktemp -d)
    mount -o subvolid=5 "$BTRFS_DEV" "$TMPBTRFS" 2>/dev/null || true

    if btrfs subvolume list "$TMPBTRFS" 2>/dev/null \
            | awk '{print $7}' \
            | grep -qE '^@snapshots$'; then
        echo -e "  ${GREEN}✔${RESET} @snapshots subvolume exists at top level"
        SNAP_SUBVOL="/@snapshots"
    else
        echo -e "  ${RED}✘${RESET} @snapshots not found at Btrfs top level"
        echo -e "         ${YELLOW}Hint:${RESET} archinstall nests .snapshots inside @ by default."
        echo -e "         ${YELLOW}Hint:${RESET} Recreate it as a top-level subvolume — see README."
        ERRORS=$(( ERRORS + 1 ))
    fi

    umount "$TMPBTRFS" 2>/dev/null || true
    rmdir  "$TMPBTRFS" 2>/dev/null || true
else
    echo -e "  ${RED}✘${RESET} Could not detect Btrfs device"
    ERRORS=$(( ERRORS + 1 ))
fi

# Locate limine.conf
LIMINE_CONF=""
for candidate in /boot/limine.conf /boot/efi/limine.conf /efi/limine.conf; do
    if [[ -f "$candidate" ]]; then
        LIMINE_CONF="$candidate"
        break
    fi
done

if [[ -n "$LIMINE_CONF" ]]; then
    echo -e "  ${GREEN}✔${RESET} limine.conf found at $LIMINE_CONF"
else
    echo -e "  ${RED}✘${RESET} limine.conf not found (checked /boot, /boot/efi, /efi)"
    ERRORS=$(( ERRORS + 1 ))
fi

echo -e "  ${GREEN}✔${RESET} Invoking user  : $REAL_USER"
echo ""

[[ $ERRORS -eq 0 ]] || fail "$ERRORS requirement(s) not met. Fix the issues above and re-run."

# Print detected config for visibility
echo -e "${BOLD}Detected configuration:${RESET}"
echo "  Btrfs device    : $BTRFS_DEV"
echo "  Snapshots subvol: $SNAP_SUBVOL"
echo "  limine.conf     : $LIMINE_CONF"
echo "  Invoking user   : $REAL_USER"
echo ""

# =============================================================================
#  STEP 1 — Install packages
# =============================================================================
step "Installing packages"

info "Installing snap-pac from official repos..."
pacman -S --needed --noconfirm snap-pac

info "Installing limine-snapper-sync and limine-mkinitcpio-hook from AUR..."
sudo -u "$REAL_USER" yay -S --needed --noconfirm \
    limine-snapper-sync \
    limine-mkinitcpio-hook

success "All packages installed."

# =============================================================================
#  STEP 2 — Snapper configuration
# =============================================================================
step "Configuring Snapper"

# archinstall already ran snapper create-config — just verify it's there
snapper -c root list &>/dev/null || fail "Snapper 'root' config not found. Was it configured by archinstall?"

info "Tuning Snapper limits..."
snapper -c root set-config \
    ALLOW_USERS="$REAL_USER" \
    TIMELINE_CREATE=yes \
    TIMELINE_CLEANUP=yes \
    TIMELINE_LIMIT_HOURLY=5 \
    TIMELINE_LIMIT_DAILY=7 \
    TIMELINE_LIMIT_WEEKLY=0 \
    TIMELINE_LIMIT_MONTHLY=0 \
    TIMELINE_LIMIT_YEARLY=0 \
    NUMBER_LIMIT=10 \
    NUMBER_CLEANUP=yes

systemctl enable --now snapper-timeline.timer
systemctl enable --now snapper-cleanup.timer

success "Snapper configured."

# =============================================================================
#  STEP 3 — mkinitcpio: add overlayfs hook
# =============================================================================
step "Updating mkinitcpio.conf"

MKINITCPIO_CONF="/etc/mkinitcpio.conf"

if grep -qP 'HOOKS=.*\bsystemd\b' "$MKINITCPIO_CONF"; then
    OVERLAY_HOOK="sd-btrfs-overlayfs"
    info "Detected systemd initramfs → using: $OVERLAY_HOOK"
else
    OVERLAY_HOOK="btrfs-overlayfs"
    info "Detected busybox initramfs → using: $OVERLAY_HOOK"
fi

if grep -q "$OVERLAY_HOOK" "$MKINITCPIO_CONF"; then
    warn "$OVERLAY_HOOK already in mkinitcpio.conf, skipping."
else
    sed -i "s/\(HOOKS=.*filesystems[^)]*\))/\1 $OVERLAY_HOOK)/" "$MKINITCPIO_CONF"
    info "Added $OVERLAY_HOOK after 'filesystems'."
fi

info "Regenerating initramfs..."
if command -v limine-mkinitcpio &>/dev/null; then
    limine-mkinitcpio -P
else
    warn "limine-mkinitcpio not found, falling back to mkinitcpio -P"
    mkinitcpio -P
fi

success "mkinitcpio updated and initramfs regenerated."

# =============================================================================
#  STEP 4 — limine-snapper-sync configuration
# =============================================================================
step "Configuring limine-snapper-sync"

LSYNC_CONF="/etc/limine-snapper-sync.conf"

[[ -f "$LSYNC_CONF" ]] || fail "$LSYNC_CONF not found — was limine-snapper-sync installed correctly?"

sed -i 's/^#\?MAX_SNAPSHOT_ENTRIES=.*/MAX_SNAPSHOT_ENTRIES=10/'                   "$LSYNC_CONF"
sed -i 's/^#\?LIMIT_USAGE_PERCENT=.*/LIMIT_USAGE_PERCENT=80/'                     "$LSYNC_CONF"
sed -i "s|^#\?ROOT_SNAPSHOTS_PATH=.*|ROOT_SNAPSHOTS_PATH=\"$SNAP_SUBVOL\"|"       "$LSYNC_CONF"

info "Set ROOT_SNAPSHOTS_PATH=$SNAP_SUBVOL"
success "limine-snapper-sync configured."

# =============================================================================
#  STEP 5 — Add //Snapshots anchor to limine.conf
# =============================================================================
step "Updating $LIMINE_CONF"

if grep -q "//Snapshots" "$LIMINE_CONF"; then
    warn "//Snapshots already present in $LIMINE_CONF, skipping."
else
    echo ""                                                        >> "$LIMINE_CONF"
    echo "# Snapshot boot entries (managed by limine-snapper-sync)" >> "$LIMINE_CONF"
    echo "//Snapshots"                                             >> "$LIMINE_CONF"
    success "//Snapshots anchor added to $LIMINE_CONF"
fi

# =============================================================================
#  STEP 6 — Enable limine-snapper-sync service
# =============================================================================
step "Enabling limine-snapper-sync"

systemctl enable --now limine-snapper-sync.service
success "limine-snapper-sync.service enabled and started."

# =============================================================================
#  STEP 7 — Initial sync and baseline snapshot
# =============================================================================
step "Creating baseline snapshot"

snapper -c root create --description "Post-install baseline" --cleanup-algorithm number
success "Baseline snapshot created."

if command -v limine-snapper-sync &>/dev/null; then
    limine-snapper-sync
    success "Boot entries synced."
else
    warn "limine-snapper-sync not in PATH yet — run it manually after reboot."
fi

# =============================================================================
#  Done
# =============================================================================
echo ""
echo -e "${GREEN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN}${BOLD}  Setup complete!${RESET}"
echo -e "${GREEN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo "  Installed:"
echo "    ✔ snap-pac               (auto snapshots on pacman)"
echo "    ✔ limine-snapper-sync    (snapshots → Limine boot menu)"
echo "    ✔ limine-mkinitcpio-hook ($OVERLAY_HOOK in initramfs)"
echo ""
echo "  Already present (via archinstall):"
echo "    ✔ snapper                (snapshot manager)"
echo ""
echo "  Services enabled:"
echo "    ✔ snapper-timeline.timer"
echo "    ✔ snapper-cleanup.timer"
echo "    ✔ limine-snapper-sync.service"
echo ""
echo "  Useful commands:"
echo "    snapper -c root list            — list snapshots"
echo "    snapper -c root create -d 'msg' — create a snapshot manually"
echo "    limine-snapper-sync             — sync snapshots to boot menu"
echo "    limine-snapper-list             — list current boot entries"
echo ""
echo -e "  ${YELLOW}Reboot to see snapshot entries in Limine.${RESET}"
echo ""
