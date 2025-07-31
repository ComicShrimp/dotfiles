# dotfiles

## Requirements

General Packages:

- Stow
- Git
- Zsh
- Nvim
  - ripgrep
- Ghostty
- Starship
- unzip
- Lazygit
- Tmux
- fzf
- fd
- git-delta

You can use the following command to install the requirements

### Arch Linux

```shell
pacman -S stow git zsh neovim ghostty ripgrep starship unzip lazygit tmux fzf fd git-delta
```

### Homebrew

```shell
brew install stow git zsh nvim alacritty ripgrep starship unzip lazygit tmux fzf fd git-delta
```

## Instalation

Clone this repo in the `home` (`$HOME`) directory and run the following command to install the dotfiles.

```shell
stow .
```

## Set Zsh as default shell

```shell
chsh -s $(which zsh)
```

## Hyprland Packages

Specific packages for Hyprland install

```sh
pacman -S hyprland rofi-wayland dunst hyprpolkitagent waybar brightnessctl hyprpaper pavucontrol
```

---

### Sources/Inspirations

- Code folding for Nvim: https://essais.co/better-folding-in-neovim/
- Lots of snippets and configs: http://www.lazyvim.org/
