# Git config
{pkgs, outputs,...}:{
  imports = [
    outputs.homeManagerModules.gitui
  ];
  programs.git = {
    enable = true;
    userName = "Daru-san";
    userEmail = "mica.tui@proton.me";

    #Git highlighting
    difftastic.enable = true;

    #Git aliases
    aliases = {
      ci = "commit";
      co = "checkout";
      cl = "clone";
      st = "status";
      ad = "add";
      ps = "push";
      pl = "pull";
      re = "remote";
      br = "branch";
      fe = "fetch";
      cp = "cherry-pick";
      rs = "reset";
      df = "diff";
      ini = "init";
    };
  };
  home.packages = with pkgs; [
      #Git scripts to make editing from any directory easier
      (pkgs.writeShellScriptBin "git-push" ''
        cd ~/snowflake
        git push 
      '')
      (pkgs.writeShellScriptBin "git-ui" ''
        cd ~/snowflake/
        gitui
     '')
      (pkgs.writeShellScriptBin "git-r" ''
        cd ~/snowflake/ 
        ranger
     '')
      (pkgs.writeShellScriptBin "git-alias"''
        printf "These are the available git aliases:"
        printf "\nci = commit\nco = checkout\ncl = clone\nst = status\nad = add\nps = push\npl = pull\nre = remote\nbr = branch\nfe = fetch\ncp = cherry-pick\nrs = reset\ndf = diff\nini = init\n"
      '')
  ];
}
