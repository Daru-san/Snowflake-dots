{config, ...}: {
  # Enable and configure zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    # Auto cd into directories
    autocd = true;

    # Abbreviations
    zsh-abbr = {
      enable = true;
      abbreviations = {
        gcl = "git clone";
        gbr = "git branch";
        gre = "git remote";
        gst = "git status";
        gps = "git push";
        gpl = "git pull";
        gft = "git fetch";
        grt = "git-root";
        cgrt = "cd-gitroot";
        c = "clear";
        r = "reset";
        nhp = "nohup";
        dtc = "detach";
        hycl = "hyprctl";
        hyprv = "hyprctl version";
        hypr = "Hyprland";
        hyprld = "hyprctl reload";
        rf = "rm -rf";
        tp = "trashy put";
        tls = "trashy list";
        trs = "trashy-restore";
        tra = "trashy restore --all";
        te = "trashy-empty";
        tea = "trashy empty --all";
        yz = "yazi";
        ntc = "nitch";
        lzg = "lazygit";
        g = "git";
        nv = "nvim";
        nl = "nurl";
        npg = "nix-prefetch-git";
        npgh = "nix-prefetch-github";
        npu = "nix-prefetch-url";
      };
    };

    # Put zsh configs in .config/zsh
    dotDir = ".config/zsh";

    # History file
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreSpace = true;
      ignoreAllDups = true;
      expireDuplicatesFirst = true;
    };

    # Enable autosuggestions
    autosuggestion.enable = true;

    # History substring searching
    historySubstringSearch.enable = true;

    # Plugins managed by antidote
    antidote = {
      enable = true;
      useFriendlyNames = true;

      # Custom plugins
      plugins =
        [
          # Plugins fetched from github
          "jimhester/per-directory-history"
          "chisui/zsh-nix-shell"
          "hlissner/zsh-autopair"
          "mollifier/cd-gitroot"
          "Atlas34/fzf-plugin"
          "jeffreytse/zsh-vi-mode"
          "z-shell/F-Sy-H"
          "romkatv/zsh-bench kind:path"
        ]
        ++ (let
          # Plugins from the oh-my-zsh repo
          o = regex: "ohmyzsh/ohmyzsh path:plugins/${regex}";
        in [(o "sudo") (o "extract") (o "cp") (o "adb kind:fpath")]);
    };

    # Configuration and custom modules from Prezto
    prezto = {
      enable = true;
      caseSensitive = true;
      pmodules = [
        "rsync"
        "archive"
        "command-not-found"
        "completion"
        "directory"
        "git"
        "utility"
      ];
      extraFunctions = [
        "zcalc"
      ];
    };
  };
}
