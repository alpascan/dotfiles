# modules/home-manager/default.nix
{ config, pkgs, ... }: {
  imports = [
    ./programs.nix
    ./packages.nix
  ];

  home = {
    stateVersion = "23.11";
    sessionVariables = {
      HOME_MANAGER_FLAKE = "${config.home.homeDirectory}/.config/nix";
    };
  };

  programs.home-manager.enable = true;

}