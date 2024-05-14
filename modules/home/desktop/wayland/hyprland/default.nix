{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  inherit (lib) mkIf;
  cfg = config.wayland;
in {
  imports = [
    ./ags
    ./config
    ./anyrun
  ];
  config = mkIf cfg.enable (mkIf (cfg.compositor == "hyprland") {
    services = let
      systemdTarget = "hyprland-session.target";
    in {
      wlsunset = {inherit systemdTarget;};
      kanshi = {inherit systemdTarget;};
      hyprpaper.enable = true;
    };
    programs = {
      kitty.enable = true;
      ags.enable = true;
      hyprlock.enable = true;
      anyrun.enable = true;
    };
    wayland.windowManager.hyprland = {
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      systemd = {
        enable = true;
        extraCommands = [
          "systemctl --user start easyeffects.service"
          "systemctl --user start app-org.keepassxc.KeePassXC@autostart.service"
          "systemctl --user start hypridle.service"
          "systemctl --user start swayosd.service"
          "systemctl --user start wlsunset.service"
          "systemctl --user start network-manager-applet.service"
          "systemctl --user start blueman-applet"
          "systemctl --user start lxpolkit"
          "systemctl --user start hyprpaper"
        ];
      };
      settings = {source = ["extra.conf"];};
    };
  });
}
