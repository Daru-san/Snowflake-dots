{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  now-playing = with pkgs;
    writeShellScriptBin "now-playing" ''
      songstats=$(${lib.getExe pkgs.playerctl} metadata --format '󰎈 {{title}} - {{artist}} 󰎈')
      ${lib.getExe' pkgs.coreutils "echo"} "$songstats"
    '';
in {
  imports = [inputs.hyprlock.homeManagerModules.default];
  programs.hyprlock = {
    enable = true;
    general = {
      grace = 5;
      hide_cursor = true;
    };
    backgrounds = [
      {
        path = "${config.theme.wallpaper.image}";
        blur_size = 9;
        blur_passes = 2;
      }
    ];
    input-fields = [
      {
        size = {
          width = 220;
          height = 50;
        };
        outline_thickness = 3;
        dots_size = 0.33;
        dots_spacing = 0.15;
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.5)";
        font_color = "rgb(200, 200, 200)";
        fade_on_empty = false;
        placeholder_text = "<i>Input Password...</i>";
        hide_input = false;
        position = {
          x = 0;
          y = -130;
        };
        halign = "center";
        valign = "center";
      }
    ];
    labels = [
      {
        text = ''cmd[update:1000] ${lib.getExe' pkgs.coreutils "date"} +"%X"'';
        font_size = 72;
        font_family = "JetBrains Mono Nerd Font 10";
        position = {
          x = 0;
          y = 80;
        };
        halign = "center";
        valign = "center";
      }
      {
        text = ''cmd[update 1000] ${lib.getExe' pkgs.coreutils "date"} +"%A, %d %B %Y"'';
        font_size = 20;
        font_family = "JetBrains Mono Nerd Font 10";
        position = {
          x = 0;
          y = 60;
        };
        halign = "center";
        valign = "center";
      }
      {
        text = ''Welcome, $USER'';
        font_size = 16;
        font_family = "JetBrains Mono Nerd Font 10";
        position = {
          x = 0;
          y = -80;
        };
        halign = "center";
        valign = "center";
      }
      {
        text = ''cmd[update 1000] ${lib.getExe now-playing}'';
        font_size = 16;
        font_family = "JetBrains Mono Nerd Font 10";
        position = {
          x = 0;
          y = -30;
        };
        halign = "center";
        valign = "bottom";
      }
    ];
  };
}
