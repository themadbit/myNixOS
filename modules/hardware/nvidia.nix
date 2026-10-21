{
  lib,
  config,
  pkgs,
  ...
}:

{

  hardware.nvidia = {

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

  };

  # Don't remove this. Graphics won't work!
  services.xserver.videoDrivers = lib.mkDefault [
    "nvidia"
    "modesetting"
  ];

  # Enable OpenGL support
  hardware.graphics = {
    enable = true; # Enable OpenGL support
    enable32Bit = true; # Enable 32-bit DRI support (for older games/apps)
  };

  #TODO: get a better place for this

  # AMD has better battery life with PPD over TLP:
  # https://community.frame.work/t/responded-amd-7040-sleep-states/38101/13
  services.power-profiles-daemon.enable = lib.mkDefault true;

}
