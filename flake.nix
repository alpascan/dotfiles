{
  description = "Cross-platform system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, nix-homebrew, ... }@inputs:
    let
      # System types to support.
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
      
      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      
      # Overlays shared across all systems
      overlays = [];
    in
    {
      # Darwin configuration for work Mac
      darwinConfigurations."workMac" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          {
            # Let's add the configuration inline first to test
            imports = [ ./hosts/darwin/configuration.nix ];
          }
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."alexandru.pascan" = import ./home/common;
          }
        ];
      };

      # Future: Add NixOS configurations for PC and Raspberry Pis here
      # nixosConfigurations."homePC" = nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #   modules = [
      #     ./hosts/nixos/configuration.nix
      #     home-manager.nixosModules.home-manager
      #     {
      #       home-manager.useGlobalPkgs = true;
      #       home-manager.useUserPackages = true;
      #       home-manager.users."alexandru.pascan" = import ./home/common;
      #     }
      #   ];
      # };

      # Packages shared across all systems
      packages = forAllSystems (system: {
        # Add any custom packages here
      });
    };
}