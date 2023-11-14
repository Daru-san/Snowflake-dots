#mpv configuration
{config, pkgs, ...}:{
  programs.mpv = {
    enable = true;
    package = pkgs.unstable.mpv;
    bindings = {
    };

    #mpv configs
    config = {

      #Enable hardware-acceleration
      hwdec = "auto-safe";
    };

    #mpv scripts
    scripts = with pkgs.mpvScripts; [
      sponsorblock
      convert
      uosc
      quality-menu
      mpris
      autocrop
      thumbfast
    ];
  };
}
