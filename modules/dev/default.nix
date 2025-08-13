{ config, pkgs, ... }:
{
  imports = [
    ./neovim.nix
    ./shell.nix
  ];

  environment.systemPackages = with pkgs; [
    # tools
    lazygit
    git
    tmux
    gh
    ripgrep

    # editors
    vscode

    # languages
    nodejs_24
    python3
    gcc
    hugo

    # utilities
    nixfmt-rfc-style
    unzip
    toybox
    wirelesstools
    openrgb

    # packages for astra - gnome performance monitor
    gnomeExtensions.system-monitor
    libgtop
    nethogs

    # applications
    kitty
    element-desktop
    slack
    spotify
    brave
    virt-manager
  ];
}
