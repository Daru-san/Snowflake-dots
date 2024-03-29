{
  config,
  lib,
  ...
}: let
  cfg = config.wayland.kde;
in
  with lib; {
    options.wayland.kde = {enable = mkEnableOption "Enable KDE";};
    config = mkIf cfg.enable {
      programs.dconf.enable = true;
      services = {
        xserver = {
          enable = true;
          displayManager.sddm = {
            enable = mkDefault true;
            wayland.enable = true;
          };
        };
        desktopManager.plasma6.enable = true;
      };
    };
  }
