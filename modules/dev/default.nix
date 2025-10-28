{ config, pkgs, ... }:
{
  imports = [
    ./neovim.nix
    ./shell.nix
    ./docker.nix
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
    code-cursor

    # languages
    nodejs_24
    gcc
    hugo
    rustup
    go

    # python & packages
    python313
    python313Packages.tkinter
    python313Packages.pip
    basedpyright # basedpyright-langserver

    # utilities
    nixfmt-rfc-style
    unzip
    toybox
    wirelesstools
    openrgb
    btop
    devenv

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
    discord
    obsidian

    # cloud
    azure-cli
    terraform
    ansible
    termius
    kubernetes
  ];
}
