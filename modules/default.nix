{ ... }:
{
  imports =
    [
      ./hardware/nvidia.nix
      ./hardware/sound.nix
      ./dev/default.nix
      ./core/boot.nix
      ./core/users.nix
    ];
}