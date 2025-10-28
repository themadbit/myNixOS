{ ... }:
{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };

  services.k3s = {
    enable = true;
    role = "server";
  };
}
