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
  };

  programs.home-manager.enable = true;
}