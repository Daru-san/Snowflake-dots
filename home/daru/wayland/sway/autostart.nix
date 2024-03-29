{
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.sway.config.startup = [
    {command = "systemctl --user start swaync.service";}
    {command = "${config.services.copyq.package}/bin/copyq";}
    {command = "${pkgs.autotiling-rs}/bin/autotiling-rs";}
    {
      command = "systemctl --user restart kanshi";
      always = true;
    }
    {
      command = "${pkgs.waypaper}/bin/waypaper --restore";
      always = true;
    }
    {command = "systemctl --user start swayidle";}
    {command = "${config.nur.repos.misterio.swayfader}/bin/swayfader";}
  ];
}
