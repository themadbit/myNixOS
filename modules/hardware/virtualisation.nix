{
  pkgs,
  ...
}:
{
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    onShutdown = "shutdown";
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = false;
    };
  };

  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableKvm = true;
      enableExtensionPack = true;
      addNetworkInterface = true;
    };
    guest = {
      enable = true;
      clipboard = true;
      dragAndDrop = true;
      verbose = true;
    };
  };
}
