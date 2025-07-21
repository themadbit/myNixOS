{ pkgs, lib, config, ... }:

{
  programs.fish = {
    enable = true;
  };
  users.defaultUserShell = pkgs.fish;
}