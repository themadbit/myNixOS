{ pkgs, lib, config, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      lg = "lazygit";
      mkcd = "mkdir -p \$1 && cd \$1";
      src = "cd /src";
    };
  };
  users.defaultUserShell = pkgs.fish;
}