{ lib,config, pkgs, ... }:

{
  
  hardware.nvidia =  {

    modesetting.enable = true;
    open = true; # Use the opensource drivers
    nvidiaSettings = true;
    dynamicBoost.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    # nvidiaPersistenced = true;

    # Disable PRIME since I don't have dual GPUs
    prime.offload.enable = false;
    prime.sync.enable = false;

    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "575.64";
      sha256_64bit = "sha256-6wG8/nOwbH0ktgg8J+ZBT2l5VC8G5lYBQhtkzMCtaLE=";
      sha256_aarch64 = "sha256-uHj8fB1sSJfX0NWZEE1eZN1LQQkf7J0jPV3EeQCSG10=";
      openSha256 = "sha256-y93FdR5TZuurDlxc/p5D5+a7OH93qU4hwQqMXorcs/g=";
      settingsSha256 = "sha256-3BvryH7p0ioweNN4S8oLDCTSS47fQPWVYwNq4AuWQgQ=";
      persistencedSha256 = "sha256-QkDNQKwCsakZOLcSie1NBiFCM5e5NFGiIKtPSFeWdXs=";
    };
  };

  # Enable OpenGL support
  hardware.graphics = {
    enable = true;      # Enable OpenGL support
    enable32Bit = true; # Enable 32-bit DRI support (for older games/apps)
  };

  #TODO: get a better place for this

  # AMD has better battery life with PPD over TLP:
  # https://community.frame.work/t/responded-amd-7040-sleep-states/38101/13
  services.power-profiles-daemon.enable = lib.mkDefault true;

  # Adds the missing asus functionality to Linux.
  # https://asus-linux.org/manual/asusctl-manual/
  services = {
    asusd = {
      enable = lib.mkDefault true;
      enableUserService = lib.mkDefault true;
    };
  };

  services.xserver.videoDrivers = lib.mkDefault [ "nvidia" ];
}