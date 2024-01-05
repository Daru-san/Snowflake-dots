{ fetchgit }:let
  src = pkgs.fetchgit {
    url = "https://github.com/Godiesc/firefox-one";
    rev = "974fee10ce0ebc9b4025b90bb18d05d74c46230f";
    sha256 = "t9j9p2nalanN1OdJCjuuFZfIQwKRS6FTD5HaGEcAlmA=";
  };
in {

  imports = [ ./default.nix ];

  home.file = {
    ".mozilla/firefox/${default.cfg.profile}/chrome" = {
      source = "${src}/chrome";
    };
  };
  programs.firefox.profiles.${default.cfg.profile}.settings = {
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    "svg.context-properties.content.enabled" = true; 
    "layout.css.color-mix.enabled" = true;
    "browser.tabs.delayHidingAudioPlayingIconMS" = 0;
    "layout.css.backdrop-filter.enabled" = true;
    "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" = false;

    "privacy.userContext.enabled" = true;
    "privacy.userContext.ui.enabled" = true;
    "privacy.userContext.longPressBehavior" = 2;
  };
}
