{pkgs, ...}:{
  imports = [
    ./mpv/default.nix
  ];
  home.packages = with pkgs.unstable; [
    vlc
  ];
}
