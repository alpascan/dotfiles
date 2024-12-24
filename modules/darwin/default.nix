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
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = 5;
}