# modules/home-manager/default.nix
{ config, pkgs, lib,  ... }: {
  imports = [
    ./programs.nix
    ./packages.nix
  ];

  home = {
    sessionVariables = {
      XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
      XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
      XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
    };
    stateVersion = "23.11";
  };

  programs.home-manager = {
    enable = true;
    path = lib.mkForce "${config.home.homeDirectory}/.config/nix";
};
}