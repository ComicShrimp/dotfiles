# dotfiles

## Requirements

- Stow
- Git
- Zsh
- Nvim
  - ripgrep
- Alacritty
- Starship
- unzip
- Lazygit

You can use the following command to install the requirements

### Arch Linux

```shell
pacman -S stow git zsh nvim alacritty ripgrep starship unzip lazygit
```

### Homebrew

```shell
brew install stow git zsh nvim alacritty ripgrep starship unzip lazygit
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
