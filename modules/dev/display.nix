{
  pkgs,
  ...
}:

{
  # Hyprland is the only session. The Hyprland config itself lives in dotfiles/hypr (symlinked to ~/.config/hypr)
  # so it can be edited and hot-reloaded without a rebuild.
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Sets up the PAM service hyprlock needs to unlock
  programs.hyprlock.enable = true;

  # Ships the hyprpolkitagent user unit; started from hyprland.lua
  systemd.packages = [ pkgs.hyprpolkitagent ];

  # Login: greetd + tuigreet, launching Hyprland via its watchdog launcher
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd start-hyprland";
      user = "greeter";
    };
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
  programs.seahorse.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  programs.dconf.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Power button: short press suspends instead of poweroff
  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
    HandlePowerKeyLongPress = "poweroff";
  };

  boot.blacklistedKernelModules = [ "tiny_power_button" ];

  # Electron/Chromium apps run natively on Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    # hypr ecosystem
    hypridle
    hyprpaper
    hyprpolkitagent

    # bar, launcher, notifications
    waybar
    fuzzel
    mako

    # screenshots & clipboard (grim is in dev/default.nix)
    slurp
    wl-clipboard
    cliphist

    # hardware keys & tray applets
    brightnessctl
    playerctl
    pavucontrol
    networkmanagerapplet

    # GTK apps that used to come with GNOME
    nautilus
    gnome-calculator
    loupe # image viewer
    file-roller
    adwaita-icon-theme
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono # icons for waybar
  ];
}
