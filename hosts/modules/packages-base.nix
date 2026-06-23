# Base system packages and utilities
# Essential tools for development, system management, and desktop use
{ config, pkgs, ... }:

{
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Make GTK use its simple IM implementation to enable compose/dead keys in ghostty
  environment.sessionVariables = {
    GTK_IM_MODULE = "simple";
  };

  # Base system packages
  environment.systemPackages = with pkgs; [
    # Text editors & tools
    vim
    neovim

    # Utilities
    wget
    git
    stow
    lazygit
    tmux
    ripgrep
    fzf
    bat
    delta
    eza

    # Shells & tools
    zsh
    starship
    zoxide

    # Development
    nodejs
    go

    # Fonts
    nerd-fonts.jetbrains-mono

    # Desktop & media
    ghostty
    plymouth
    google-chrome
    obsidian
    vlc
    btop

    # Audio & system
    asunder
    picard

    # Utilities
    podman
    podman-compose
    github-copilot-cli
  ];

  # Podman
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
    };
  };
}
