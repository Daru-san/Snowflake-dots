{
  description = "My chilly flake for my snowy NixOS configurations";

  inputs = {

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    #Add unstable packages
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-23.05";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #Nix-hardware
    hardware.url = "github:nixos/nixos-hardware";

    # Colors
    nix-colors.url = "github:misterio77/nix-colors";

    #NUR Packages
    nur.url = "github:nix-community/NUR";

    #Spicetify
    spicetify-nix.url = "github:the-argus/spicetify-nix/master";

    ##Hyprland##
    hyprland-contrib = {
      #Hyprland-contrib for hyprland specific packages
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Neovim nightly
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    #Prism launcher(Modded)
    prismlauncher.url = "github:Diegiwg/PrismLauncher-Cracked";

    #Firefox nightly
    firefox.url = "github:nix-community/flake-firefox-nightly";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    spicetify-nix,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # Supported systems for your flake packages, shell, etc.
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};
    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home-manager;

    # NixOS configuration
    nixosConfigurations = {
      
      #Configuration on my Acer laptop
      #'nixos-rebuild --flake .#AspireNix'
      AspireNix = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          # > My main nixos configuration file <
          ./nixos-configs/AspireLaptop/configuration.nix
        ];
      };
    };
    homeConfigurations = {

      #My home configuration
      #'home-manager switch --flake .#daru@AspireNix'
      "daru@AspireNix" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        # > My home configuration file <
        modules = [./home/daru/home.nix];
      };
    }
  };
}
