{pkgs, ...}:{

  # Enable flatpack
  services.flatpak.enable = true;

  programs = {
    # Enable gnome-disks
    gnome-disks.enable = true;

    # Enable KDE Connect 
    kdeconnect = {
      enable = true;
    };
  };

  # System packages
  environment.systemPackages = with pkgs; [
    ranger
    htop
    wget
    git
    nix-prefetch-git
    nix-prefetch-github
    gcc
    glib
    nodejs_20
    unzip
    clang
    zig
    iw
    clinfo
    glxinfo
    exfatprogs
    nurl
    nix-melt
    ncdu
    busybox
    usbutils
    nix-rebuild
  ];
}