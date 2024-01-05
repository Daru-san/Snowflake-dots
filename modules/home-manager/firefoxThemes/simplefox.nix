{fireside}:let 
  src = pkgs.fetchgit {
    url = "https://github.com/BlueFalconHD/SimpleFox-Feather";
    rev = "84f395aa58b7489d841f78baf0688763ffa793fb";
    sha256 = "BzoXCxpG88wgHLxskqQUO08QT7mB2VOLWQz8eW1w5LA=";
  };
in {
  imports = [ ../default.nix ];
  home.file = {
    ".mozilla/firefox/${default.cfg.profile}/chrome" = {
      source = "${src}/chrome";
      recursive = true;
    };
  };
  programs.firefox.profiles.${default.cfg.profile}.settings = {
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    "layers.acceleration.force-enabled" = true;
    "gfx.webrender.all" = true;
    "svg.context-properties.content.enabled" = true;
  };
}
