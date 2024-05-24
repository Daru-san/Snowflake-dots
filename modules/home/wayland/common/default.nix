{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.wayland;
in {
  options.wayland.enable = mkEnableOption "Enable wayland using Hyprland";
  imports = [
    ./ags
    ./kanshi
    ./anyrun
    ./hypridle
    ./swaync
    ./swayosd
    ./waybar
    ./kitty
    ./wlogout
    ./wlsunset
  ];
  config = mkIf cfg.enable {
    services = {
      kanshi.enable = true;
      hypridle.enable = true;
      swaync.enable = true;
      swayosd.enable = true;
      wlsunset.enable = true;
    };
    programs = {
      ags.enable = true;
      wlogout.enable = true;
      waybar.enable = true;
    };
    home.packages = [pkgs.wl-clipboard-rs];
  };
}