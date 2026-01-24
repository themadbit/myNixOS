{
  ...
}:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.memtest86.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Limit the number of generations to keep.
  boot.loader.grub = {
    configurationLimit = 5;
  };
}
