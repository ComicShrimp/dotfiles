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
- Tmux
- fzf
- NerdFont fira code
- fd

You can use the following command to install the requirements

### Arch Linux

```shell
pacman -S stow git zsh neovim alacritty ripgrep starship unzip lazygit tmux fzf ttf-firacode-nerd fd
```

### Homebrew

```shell
brew install stow git zsh nvim alacritty ripgrep starship unzip lazygit tmux fzf fd
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

---

### Sources/Inspirations

- Code folding for Nvim: https://essais.co/better-folding-in-neovim/
- Lots of snippets and configs: http://www.lazyvim.org/
