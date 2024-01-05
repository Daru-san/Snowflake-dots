{ fetchgit, ...}:let
  src = fetchgit {
    url = "https://github.com/datguypiko/Firefox-Mod-Blur";
    rev = "e4c5d1384c839635043242597b66d0af0b288d48";
    sha256 = "XQcgNwUqFmBumTYUfveIuPGAEAX91ah0MyGuhv/XAoU=";
  };
in {
  imports = [ ./default.nix ];

  home.file = with ".mozilla/firefox/${default.cfg.profile}/chrome/"; {
    "userChrome.css" = {
      source = "${src}/userChrome.css";
    };
    "userContent.css" = {
      source = "${src}/userContent.css";
    };
    "image" = {
      source = "${src}/image";
    };
    "old" = {
      source = "${src}/old";
    };
    "extras" = {
      source = "${src}/EXTRA MODS";
    };
  };
  programs.firefox.profiles.${default.cfg.profile}.settings = {
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  };
}
