# modules/darwin/default.nix
{ config, pkgs, lib, username, ... }: {
  imports = [
    ./system.nix
    ./homebrew.nix
    # If you have a nix-homebrew module, import it here
    # For example:
    # "${inputs.nix-homebrew}/darwin-module.nix"
  ];

  # Basic configuration
  nixpkgs.config.allowUnfree = true;
 #  users.users.${username}.home = "/Users/${username}";

  nix.settings = {
    allow-import-from-derivation = true;
    experimental-features = [ "nix-command" "flakes" ];
    pure-eval = false;  # This is what we want
  };
  system.stateVersion = 5;
}