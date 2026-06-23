# Adding a New NixOS Host

This directory contains modularized NixOS configurations for different hosts.

## Structure

```
hosts/
├── modules/              # Reusable configuration modules
└── <hostname>/           # Host-specific directory
    ├── configuration.nix
    └── hardware-configuration.nix
```

## How to add a new host

Create a new directory with `configuration.nix` that imports the desired modules:

```nix
# hosts/my-host/configuration.nix
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/users.nix
    ../modules/packages-base.nix
    ../modules/packages-nvim.nix
    ../modules/desktop.nix
  ];

  networking.hostName = "my-host";
  # ... additional host-specific config
}
```

Mix and match modules from `../modules/` as needed:
- `users.nix` - User configuration
- `packages-base.nix` - Common packages and utilities
- `packages-nvim.nix` - Neovim development tools
- `desktop.nix` - Desktop environment setup
