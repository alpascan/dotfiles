# modules/home-manager/default.nix
{ config, pkgs, ... }: {
  imports = [
    ./programs.nix
    ./packages.nix
  ];

  home = {
    username = "alexandru.pascan";
    homeDirectory = "/Users/alexandru.pascan";
    stateVersion = "23.11";
    sessionVariables = {
      HOME_MANAGER_FLAKE = "${builtins.toString ./..}";
    };
  };

  programs.home-manager.enable = true;

}