{fetchgit}:let
  src = pkgs.fetchgit {
    url = "https://github.com/bjesus/fireside";
    rev = "ae26321db68d2cefe44fd74a8678aa13b83d36f5";
    sha256 = "mwlw8PNurozOBvfG6D809fxQmqiutakWq89h4UGbcXo=";
  };
in {
  imports = [ ../default.nix ];

  home.file = with ".mozilla/firefox/${default.cfg.profile}/chrome/"; {
    "userChrome.css" = {
      source = "${src}/userChrome.css";
    };
    "tab-center-reborn.css" = {
      source = "${src}/tab-center-reborn.css";
    };
  };
  programs.firefox.profiles.${default.cfg.profile}.settings = {
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  };
}
