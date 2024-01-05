{pkgs, ...}:{
  imports = [
    ./Firefox/firefox.nix
  ];
  home.packages = with pkgs; [
    lynx #Terminal browser
    w3m #Also a terminal browser and terminal image viewer
  ];
}
