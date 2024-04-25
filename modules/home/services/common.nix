{
  services = {
    playerctl.enable = true;
    easyeffects.enable = true;
    kde-connect.enable = true;
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
    syncthing = {
      enable = true;
      tray.enable = true;
    };
    amberol = {
      enable = true;
      enableRecoloring = true;
      replaygain = "track";
    };
  };
}
