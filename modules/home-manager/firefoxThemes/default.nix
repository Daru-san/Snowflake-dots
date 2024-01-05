{lib, pkgs, config, ...}:
with lib;
let
  cfg = config.programs.firefox.cssTheme;

  cssThemes = {
    firefox-one = [ ./firefox-one.nix ];
    fox11 = [ ./fox11.nix ];
    fireside = [ ./fireside.nix ];
    simplefox = [ ./simplefox.nix ];
    firefoxmodblur = [ ./firefoxModBlur.nix ];
  };
in {
  options.programs.firefox.cssTheme = {
    enable = mkEnableOption "firefox css theme";
    theme = mkOption {
      type = with types; nullOr (enum (lib.attrNames cssThemes));
      default = null;
      example = "simplefox";
      description = ''
        Choose a theme from my selection of themes from a handfull of github repos 
      '';
    };
    profileName = mkOption {
      type = with types; nullOr (enum (lib.attrNames config.firefox.profiles));
      default = null;
      example = "daru";
      description = ''
        This should be the name of the profile it is to install the themes into, make sure it exists.
      '';
    };
  };
  config = mkIf cfg.enable {
    imports = [ config.programs.firefox.cssTheme ]; 
  };
}
    
