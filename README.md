# dotfiles

## Requirements

### Arch Linux

The install scripts expect that you already have Arch Linux installed with Gnome before running it and adding hyprland.

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
