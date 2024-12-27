# modules/home-manager/default.nix
{ config, pkgs, ... }: {
  imports = [
    ./programs.nix
    ./packages.nix
  ];

  home = {
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;

}