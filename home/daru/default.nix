{
  outputs,
  inputs,
  ...
}: {
  imports =
    [./home.nix]
    ++ [./themes/default.nix ./wayland/default.nix ./programs/default.nix]
    ++ (with outputs.homeManagerModules; [
      editor
      programs
      xdg
      wayland
      shell
      themes
      languages
      services
    ])
    ++ (with inputs; [
      hyprland.homeManagerModules.default
    ]);
}
