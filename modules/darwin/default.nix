# modules/darwin/default.nix
{ config, pkgs, lib, username, ... }: {
  imports = [
    ./../common/packages.nix
    # MacOS specific packages
    ./system.nix
    ./homebrew.nix
  
  ];

  # Basic configuration
  nixpkgs.config.allowUnfree = true;

  # Nix specific path
  environment.systemPath = import ./paths.nix;

  nix.settings = {
    allow-import-from-derivation = true;
    experimental-features = [ "nix-command" "flakes" ];
    pure-eval = false;  # This is what we want
  };
  system.stateVersion = 5;
}