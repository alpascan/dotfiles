{
  description = "Darwin System & Home Manager Configuration";
  inputs = {
    # Hihger level inputs
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
  outputs = { self, nixpkgs, nix-darwin, home-manager, nix-homebrew, ... }@inputs:
  let
    work = {
      machineName = "workMac";
      system = "aarch64-darwin";
      username = "alexandru.pascan";
      homeDirectory = "/Users/${work.username}";
      flakeRoot = "${work.homeDirectory}/.config/nix";
      pkgs = nixpkgs.legacyPackages.${work.system};
      paths = import ./modules/darwin/paths.nix;
    };
  in
  {
    darwinConfigurations.${work.machineName} = nix-darwin.lib.darwinSystem {
      inherit (work) system;
      modules = [ 
        nix-homebrew.darwinModules.nix-homebrew
        ./modules/darwin
        {
          _module.args = {
            inherit (work) username homeDirectory;
            inherit inputs;  # Pass inputs through
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
            inherit (work) username homeDirectory paths flakeRoot machineName;
            inherit inputs;  # Pass inputs through
          };
        }
        ./modules/home-manager
      ];
    };
  };
}