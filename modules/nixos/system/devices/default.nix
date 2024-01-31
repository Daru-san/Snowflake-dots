{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:let
  cfg = config.os.system;
in 
with lib;
{
  imports = [inputs.auto-cpufreq.nixosModules.default];
  options = {
    os.system = {
      laptop = {
        optimizations = {
          tlp.enable = mkOption {
            default = false;
            type = with types; bool;
          };
          powerTweaks.enable = mkOption {
            default = false;
            type = with types; bool;
          };
        };
      };
      general = {
        ssd.enable = mkOption {
          default = false;
          type = with types; bool;
        };
        throttled.enable = mkOption {
          default = false;
          type = with types; bool;
        };
      };
    };
  };
  config = {
    services.throttled.enable = mkIf cfg.general.throttled.enable true;

    services.tlp.enable = mkIf cfg.laptop.optimizations.tlp.enable true;

    services.udev.extraRules = mkIf cfg.general.ssd.enable ''
      ACTION=="add|change", KERNEL=="[sv]d[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
    '';
    services.fstrim = mkIf cfg.general.ssd.enable {
      enable = true;
	  };
    
    programs.auto-cpufreq = mkIf cfg.laptop.optimizations.powerTweaks.enable {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          turbo = "auto";
        };
        battery = {
          governor = "powersave";
          turbo = "auto";
        };
      };
	  };
  };
}