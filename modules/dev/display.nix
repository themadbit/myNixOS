{
  pkgs,
  ...
}:

{
  # Hyprland session, selectable from GDM's gear menu alongside GNOME.
  # The Hyprland config itself lives in dotfiles/hypr (symlinked to ~/.config/hypr)
  # so it can be edited and hot-reloaded without a rebuild.
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Sets up the PAM service hyprlock needs to unlock
  programs.hyprlock.enable = true;

  # Ships the hyprpolkitagent user unit; started from hyprland.lua, so it never runs under GNOME
  systemd.packages = [ pkgs.hyprpolkitagent ];

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
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono # icons for waybar
  ];
}
