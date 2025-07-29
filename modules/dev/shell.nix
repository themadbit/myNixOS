{ pkgs, lib, config, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      # general aliases
      lg = "lazygit";
      mkcd = "mkdir -p \$1 && cd \$1";
      src = "cd /src";

      # git aliases
      grb = "git rebase";
      grba = "git rebase --abort";
      grbc = "git rebase --continue";

      gst = "git status";
    };
  };
  users.defaultUserShell = pkgs.fish;
}