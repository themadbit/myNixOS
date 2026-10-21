{
  pkgs,
  pkgs-teleport-16,
  pkgs-unstable,
  ...
}:
{
  imports = [
    ./neovim.nix
    ./shell.nix
    ./docker.nix
    ./infra.nix
    ./ollama.nix
    ./display.nix
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
    bash

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
    deno

    # python & packages
    uv
    ruff
    python313
    python313Packages.duckdb
    python313Packages.pandas
    python313Packages.pip
    python3Packages.pylibmc
    basedpyright # basedpyright-langserver

    # utilities
    nixfmt
    unzip
    toybox
    wirelesstools
    openrgb
    btop
    devenv
    pre-commit
    grim
    flameshot
    libmemcached
    gradia
    pkg-config
    jq
    ntfs3g
    glow

    # packages for astra - gnome performance monitor
    gnomeExtensions.system-monitor
    gnome-tweaks
    libgtop
    nethogs

    # applications
    insomnia
    element-desktop
    mattermost-desktop
    kitty
    slack
    spotify
    brave
    discord
    obsidian
    foliate

    #k8s

    kubernetes
    kubernetes-helm
    eks-node-viewer
    k9s

    # cloud
    azure-cli
    terraform
    ansible
    termius
    google-cloud-sdk
    awscli2
    vagrant
    dive
    podman
    podman-compose
    render-cli

    # ai
    pkgs-unstable.claude-code
    pkgs-unstable.opencode
    github-copilot-cli

    # infrastructure - teleport v16 pinned from nixos-24.05
    pkgs-teleport-16.teleport_16
  ];
}
