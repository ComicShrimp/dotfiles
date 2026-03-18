# dotfiles

## Requirements

### Arch Linux

This repo assumes you will install Arch Linux using `archinstall` and set the partition layout manually, since is needed to set the correct subvolumes for system snapshots.

## Disk Layout

For `snapper` config with `limine` and `btrfs` you need the following subvolumes and disk layout:

### Btrfs Subvolume Layout

| Subvolume | Mount point |
|-----------|-------------|
| `@` | `/` |
| `@home` | `/home` |
| `@snapshots` | `/.snapshots` |
| `@log` | `/var/log` |
| `@pkg` | `/var/cache/pacman/pkg` |
| `@tmp` | `/tmp` |

### Boot Partition

| Partition | Filesystem | Size | Mount point |
|-----------|------------|------|-------------|
| EFI | FAT32 | 512MB | `/boot/efi` |

## Snapper

Should select `snapper` as snapshot tool in `archinstall`.

## Instalation

Clone this repo in the `home` (`$HOME`) directory and run the following command to install the dotfiles.

```shell
stow .
```

After this, run the install script for your respective system:

MacOs:

```shell
sh install_mac.sh
```

Linux:

```shell
sh install_linux.sh
```

## Set Zsh as default shell

```shell
chsh -s $(which zsh)
```

---

### Sources/Inspirations

- Code folding for Nvim: https://essais.co/better-folding-in-neovim/
- Lots of snippets and configs: http://www.lazyvim.org/
- Arch config: https://github.com/basecamp/omarchy
- Sketchybar + aerospace: https://github.com/slashspace/dotfiles
- Sketchybar + aerospace: https://github.com/miksoyer/nix-darwin
- Nvim config: https://tduyng.com/series/neovim/
