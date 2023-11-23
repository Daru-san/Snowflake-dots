{pkgs, ...}:{
  qt = {
    enable = true;

    #Make qt applications follow gtk theme 
    platformTheme = "gtk";

    #Set qt style to adwaita for a gtk feel
    style = {
      package = pkgs.adwaita-qt;
      name = "adwaita-dark";
    };
  };
}
