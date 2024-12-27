{
  description = "Darwin System & Home Manager Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, nix-homebrew, ... }:
  let
    work = {
      name = "workMac";
      system = "aarch64-darwin";
      username = "alexandru.pascan";
      homeDirectory = "/Users/${work.username}";
      pkgs = nixpkgs.legacyPackages.${work.system};
    };
  in
  {
    darwinConfigurations.${work.name} = nix-darwin.lib.darwinSystem {
      inherit (work) system;
      modules = [ 
        nix-homebrew.darwinModules.nix-homebrew
        ./modules/darwin
        {
          _module.args = {
            inherit (work) username homeDirectory;
          };
        }
      ];
    };

    homeConfigurations.${work.username} = home-manager.lib.homeManagerConfiguration {
      inherit (work) pkgs;
      modules = [
        {
          home = {
            inherit (work) username homeDirectory;
          };
          _module.args = {
            inherit (work) username homeDirectory;
          };
        }
        ./modules/home-manager/workMac.nix
      ];
    };
  };
}