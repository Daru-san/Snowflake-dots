{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  cfg = config.os.system;
in
  with lib; {
    imports = [inputs.auto-cpufreq.nixosModules.default];
    options = {
      os.system = {
        optimizations = {
          laptop.enable = mkEnableOption "Tweaks for laptops to improve performance and battery life";
          ssd.enable = mkEnableOption "Enable ssd optimizations";
          intel.enable = mkEnableOption "Enable intel tweaks";
        };
      };
    };
    config = mkMerge [
      (mkIf cfg.optimizations.intel.enable {
        services.throttled.enable = true;
        services.thermald.enable = true;
        hardware.cpu.intel.updateMicrocode = mkDefault true;
      })
      (mkIf cfg.optimizations.ssd.enable {
        services.udev.extraRules = ''
          ACTION=="add|change", KERNEL=="[sv]d[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
        '';
        services.fstrim = {enable = true;};
      })
      (mkIf cfg.optimizations.laptop.enable {
        programs.auto-cpufreq = {
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
      })
    ];
  }