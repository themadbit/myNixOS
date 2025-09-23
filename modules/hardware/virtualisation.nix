{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.hardware.disableKvm = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Whether to disable KVM kernel modules (useful for VirtualBox compatibility)";
  };

  config = lib.mkMerge [
    (lib.mkIf config.hardware.disableKvm {
      boot.blacklistedKernelModules = [
        "kvm"
        "kvm_amd"
        "kvm_intel"
      ];
    })

    {
      virtualisation.virtualbox = {
        host = {
          enable = true;
          enableExtensionPack = true;
          addNetworkInterface = false;
        };
        guest = {
          enable = true;
          clipboard = true;
          dragAndDrop = true;
          verbose = true;
        };
      };

      users.extraGroups.vboxusers.members = [ "themadbit" ];
    }
  ];
}
