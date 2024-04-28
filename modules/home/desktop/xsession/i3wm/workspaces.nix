{
  config,
  lib,
  ...
}: let
  inherit (lib) range concatLines;
  mod = config.wayland.windowManager.sway.config.modifier;
  workspaces =
    (map toString (range 0 9))
    ++ (map (n: "F${toString n}") (range 1 12));
in {
  xsession.windowManager.i3.extraConfig = let
    # set workspaces
    workspace = concatLines (map (
        n: "set $ws${n} ${n}"
      )
      workspaces);

    # Switch to workspace
    switchworkspace = concatLines (map
      (n: "bindsym ${mod}+${n} workspace $ws${n}")
      workspaces);

    # Move window to workspace
    moveworkspace = concatLines (map
      (n: "bindsym ${mod}+Shift+${n} move container to workspace $ws${n}")
      workspaces);
  in ''
    ${workspace}
    ${switchworkspace}
    ${moveworkspace}
  '';
}
