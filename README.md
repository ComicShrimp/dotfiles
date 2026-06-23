# dotfiles

My personal dotfiles for NixOS configuration management.

## Installation

Clone this repo in the `$HOME` directory and run `stow` to symlink the dotfiles.

## NixOS Hosts

See [`hosts/README.md`](./hosts/README.md) for information on configuring and adding new NixOS hosts using the modularized configuration system.

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
