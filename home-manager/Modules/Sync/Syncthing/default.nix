{pkgs, ...}:{
  services = {
    syncthing = {
      enable = true;
      tray = {
        enable = true;
        package = pkgs.syncthingtray;
      };
    };
  };
}
