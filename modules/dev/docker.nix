{ ... }:
{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    autoPrune = {
      enable = true;
    };
  };

  services.k3s = {
    enable = true;
    role = "server";
  };
}
