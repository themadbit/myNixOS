{
  lib,
  config,
  ...
}:
{
  options.powerManagement.enableSava = lib.mkOption {
    type = lib.types.bool;
    default = false;
  description = "Whether to enable host to be running like a server (no power saving features).";
  };

  config = lib.mkIf config.powerManagement.enableSava {
    services.logind = {
      settings.Login = {
        HandleLidSwitch = "suspend";
        KillUserProcesses = false;
        HandleLidSwitchExternalPower = "ignore";
        HandleLidSwitchDocked = "ignore";
      };
    };
  };
}
