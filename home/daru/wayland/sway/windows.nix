{...}: {
  wayland.windowManager.sway.config = {
    assigns = {
      "F1" = [{class = "firefox-nighly";}];
      "F2" = [{class = "bridge";}];
      "F4" = [{class = "org.gnome.Nautilus";}];
      "F6" = [{class = "mpv";}];
      "F7" = [{class = "FreeTube";}];
      "F8" = [{title = "Comffy";}];
      # "F11" = [{class = "Waypaper"}]
    };

    # Floating windows
    floating = {
      border = 6;
      criteria = [
        {
          title = "Library";
          class = "^firefox-nightly$";
        }
        {title = "Easy Effects";}
        {title = "Bluetooth Devices";}
        {class = "com.github.hluk.copyq";}
        {title = "CopyQ";}
        {class = "copyq";}
        {class = "^pavucontrol$";}
        {class = "^org.kde.kdeconnect-indicator$";}
      ];
      titlebar = false;
    };
  };
}
