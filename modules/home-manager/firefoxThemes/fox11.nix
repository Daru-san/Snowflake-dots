{fetchgit}:let
  src = pkgs.fetchgit {
    url = "https://github.com/Neikon/Fox11";
    rev = "9b683d2cea6cd828c6410ff497ed54a746571194"; 
    sha256 = "oJlEh/6zmnafDTXSPMsl9F9EYdT0qEdQ26D3kwUSNwg=";
  };
in {
  imports = [ ../default.nix ];

  home.file = with ".mozilla/firefox/${default.cfg.profile}/chrome/"{
    "userChrome.css" = {
      source = "${src}/userChrome.css";
    };
    "components" = {
      source = "${src}/components"
    };
  };

  programs.firefox.profiles.${default.cfg.profile}.settings = {
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  };
}
