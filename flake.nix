{
  description = "Darwin System & Home Manager Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
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
  outputs = { self, nixpkgs, darwin, home-manager, nix-homebrew, ... }:
  let
    system = "aarch64-darwin";
    username = "alexandru.pascan";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    # Darwin System Configuration
    darwinConfigurations."workMac" = darwin.lib.darwinSystem {
      inherit system;
      modules = [ 
        nix-homebrew.darwinModules.nix-homebrew
        ./modules/darwin
        {
          _module.args = {
            inherit username;
          };
        }
      ];
    };
    # Home Manager Configuration
    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./modules/home-manager/workMac.nix
      ];
    };
    # This is needed for home-manager
    defaultPackage.${system} = home-manager.defaultPackage.${system};
  };
}
