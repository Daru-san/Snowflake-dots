# # My home configuration file ##
{
  home = {
    username = "daru";
    homeDirectory = "/home/daru";
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";

  # Home option pages
  manual = {
    json = {enable = true;};
    html = {enable = true;};
  };
}
