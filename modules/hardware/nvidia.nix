{ config, pkgs, ... }:

{
  
  hardware.nvidia =  {

    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    dynamicBoost.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    #nvidiaPersistenced = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      nvidiaBusId = "PCI:1:0:0";
    };

    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "575.64";
      sha256_64bit = "sha256-6wG8/nOwbH0ktgg8J+ZBT2l5VC8G5lYBQhtkzMCtaLE=";
      sha256_aarch64 = "sha256-uHj8fB1sSJfX0NWZEE1eZN1LQQkf7J0jPV3EeQCSG10=";
      openSha256 = "sha256-y93FdR5TZuurDlxc/p5D5+a7OH93qU4hwQqMXorcs/g=";
      settingsSha256 = "sha256-3BvryH7p0ioweNN4S8oLDCTSS47fQPWVYwNq4AuWQgQ=";
      persistencedSha256 = "sha256-QkDNQKwCsakZOLcSie1NBiFCM5e5NFGiIKtPSFeWdXs=";
    };
  };
}