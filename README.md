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

You can use the following command to install the requirements on Arch Linux

```shell
pacman -S stow git zsh nvim alacritty ripgrep starship unzip
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

