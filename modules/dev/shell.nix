{
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      # general aliases
      lg = "lazygit";
      src = "cd ~/src";
      sil = "cd ~/sil-src/";
      ngipkgs = "cd ~/src/ngipkgs/";
      nixpkgs = "cd ~/src/nixpkgs/";
      k8s = "sudo k3s kubectl";

      # git aliases
      grb = "git rebase";
      grba = "git rebase --abort";
      grbc = "git rebase --continue";

      gst = "git status";

      gco = "git checkout";
      gcb = "git checkout -b";
      gcm = "git commit -m";
      gca = "git commit --amend";
    };
  };
  users.defaultUserShell = pkgs.fish;
}
