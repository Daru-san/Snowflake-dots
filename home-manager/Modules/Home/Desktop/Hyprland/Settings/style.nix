{...}:{
  wayland.windowManager.hyprland = {
    settings = {
      general =  {
        gaps_in = 1.7;
        gaps_out = 6;
        border_size = 2.4;
        cursor_inactive_timeout = 4;
        layout = "master";
        "col.active_border" = ${config.colorScheme.colors.base02};
        "col.inactive_border" = ${config.colorScheme.colors.base00};            
      };
      master = {
        new_is_master = false;
        mfact = 0.55;
        allow_small_split = true;
        no_gabs_when_only = true;
      };
      decoration = {
        rounding = 5;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          ignore_opacity = true;
        };       
        drop_shadow = true;
        shadow_range = 7;
        shadow_render_power = 6;
      };
      animations = {
        enabled = true;
        bezier = [
          "linear, 0.0, 0.0, 1.0, 1.0"
          "def, 0.05, 0.9, 0.1, 1.05"
          "myBezier, 0.1, 0.6, 0.1, 1.05"
          "easeOutBack, 0.34, 1.56, 0.64, 1"
          "easeInOutBack, 0.68, -0.6, 0.32, 1.6"
          "easeInExpo, 0.7, 0, 0.84, 0"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeInOutQuad, 0.45, 0, 0.55, 1"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
        ];
        animation = [
          "workspaces, 1, 8, myBezier, slidefadevert"
          "borderangle, 1, 100, linear, loop"
          "windowsOut, 1, 5, easeInOutBack, popin 80%"
          "windowsIn, 1 ,8, myBezier, popin 20%"
          "border ,1, 10, easeOutBack"
          "fade, 1, 7, myBezier"
        ];
      };
    };
  };
}