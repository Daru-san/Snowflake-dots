{
  programs = {
    # Unified theming for bash and zsh
    oh-my-posh = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ./oh-my-posh-theme.json));
    };

    # Coloured ls with cool features
    eza = {
      enable = true;
      git = true;
      icons = true;
      extraOptions = ["--group-directories-first"];
      enableZshIntegration = true;
      enableBashIntegration = true;
    };

    # cd on steriods
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };

    # Searching through directories with ease
    broot = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      settings.modal = true;
    };

    # Find files fuzzily
    fzf = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };
}
