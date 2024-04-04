{pkgs, ...}: {
  boot = {
    consoleLogLevel = 0;
    kernelParams = ["quiet"];
    kernelPackages = pkgs.linuxPackages_cachyos;
    loader.efi.canTouchEfiVariables = true;
    initrd.verbose = false;
    loader.grub = {
      enable = true;
      configurationLimit = 3;
      default = "saved";
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      timeoutStyle = "menu";
      theme = pkgs.sleek-grub-theme.override {
        withStyle = "dark";
        withBanner = "Hello, Daru";
      };
    };
    plymouth = rec {
      enable = true;
      theme = "blockchain";
      themePackages = [
        (pkgs.adi1090x-plymouth-themes.override {
          selected_themes = [theme];
        })
      ];
    };
    initrd.systemd.enable = true;
  };
}