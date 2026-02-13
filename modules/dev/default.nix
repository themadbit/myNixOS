{
  pkgs,
  pkgs-teleport-16,
  ...
}:
{
  imports = [
    ./neovim.nix
    ./shell.nix
    ./docker.nix
    ./infra.nix
  ];

  environment.systemPackages = with pkgs; [
    # tools
    lazygit
    git
    tmux
    gh
    ripgrep
    zellij
    wl-clipboard

    # editors
    vscode
    code-cursor

    # languages
    nodejs_24
    gnumake42
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
    pre-commit
    grim
    flameshot

    # packages for astra - gnome performance monitor
    gnomeExtensions.system-monitor
    libgtop
    nethogs

    # applications
    element-desktop
    mattermost-desktop
    kitty
    slack
    spotify
    brave
    discord
    obsidian
    foliate

    # cloud
    azure-cli
    terraform
    ansible
    termius
    kubernetes
    kubernetes-helm
    eks-node-viewer
    k9s
    google-cloud-sdk
    awscli2
    vagrant
    dive

    # infrastructure - teleport v16 pinned from nixos-24.05
    pkgs-teleport-16.teleport_16
  ];
}
