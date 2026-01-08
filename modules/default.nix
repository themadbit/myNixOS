{ ... }:
{
  imports = [
    ./hardware/nvidia.nix
    ./hardware/sound.nix
    ./hardware/virtualisation.nix
    ./hardware/power.nix
    ./dev/default.nix
    ./core/boot.nix
    ./core/users.nix
  ];
}
