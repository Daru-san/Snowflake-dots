# System fonts
{pkgs, ...}:{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "UbuntuMono" ]; })
  ];
}
