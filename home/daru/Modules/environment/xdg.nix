# Settings folders that will be present everytime the config is built
{config, ...}:{
  xdg.userDirs = {
    enable = true;

    # Make it auto create generate the directories if they don't exist
    createDirectories = true;

    # Default directories
    desktop = "${config.home.homeDirectory}/Desktop";
    music = "${config.home.homeDirectory}/Music";
    pictures = "${config.home.homeDirectory}/Pictures";
    videos = "${config.home.homeDirectory}/Videos";
    download = "${config.home.homeDirectory}/Downloads";
    templates = "${config.home.homeDirectory}/Templates";
    # Special directories
    extraConfig = {
      Emulation = "${config.home.homeDirectory}/Emulation";
      Anime = "${config.home.homeDirectory}/Anime";
      Projects = "${config.home.homeDirectory}/Projects";
      mango = "${config.home.homeDirectory}/.mango";
      Scripts = "${config.home.homeDirectory}/Scripts";
      Wallpapers = "${config.home.homeDirectory}/Wallpapers";
    };
  };
}
