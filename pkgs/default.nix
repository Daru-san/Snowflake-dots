# Custom packages
pkgs: let
  pkgs = import <nixpkgs> {};
in 
{
  # Pokeshell from acxz/pokeshell 
  pokeshell = pkgs.callPackage ./pokeshell.nix { };

  # Bridge app for minecraft modding
  bridge-core = pkgs.callPackage ./bridge.nix { };
}
