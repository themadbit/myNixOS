{ pkgs, lib, config, ... }:

{
  users.users.themadbit = {
    isNormalUser = true;
    description = "themadbit";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    #  thunderbird
    ];
  };
}