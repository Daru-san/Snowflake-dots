{...}:{
  wayland.windowManager.hyprland = {
    settings = {
      input = {
        repeat_delay = 300;
        repeat_rate = 50;
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          tap-to-click = true;
          drag_lock = true;
        };
      };
      gestures = {
        workspace_swipe = true;
      };
      device = {
        "2.4g-mouse" = {
          scroll_method = "on_button_down";
          natural_scroll = 0;
          sensitivity = 0.1;
          accel_profile = "adaptive";
          scroll_button = "273";
        };
      };
    };
  };
}
