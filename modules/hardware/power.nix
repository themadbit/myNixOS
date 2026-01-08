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
    # 1. Disable GNOME's aggressive default power manager
    services.power-profiles-daemon.enable = false;

    # 2. Configure TLP for AMD Ryzen
    services.tlp = {
      enable = true;
      settings = {
        # Use the amd-pstate-epp driver efficiently
        # Values: performance, balance_performance, balance_power, power
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        # Prevent the CPU from boosting to 100% on AC to keep fans quiet
        CPU_BOOST_ON_AC = 0;
        CPU_BOOST_ON_BAT = 0;

        # Set the scaling governor
        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      };
    };
  };
}
