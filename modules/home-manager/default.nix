# modules/home-manager/default.nix
{ config, pkgs, lib, paths, flakeRoot, machineName, ... }: {
  imports = [
    ./programs.nix
    ./packages.nix
    ./shells
  ];
  
  home = {
    stateVersion = "23.11";
    
    file = lib.mapAttrs'
      (name: _: {
        name = ".config/${name}";
        value.source = config.lib.file.mkOutOfStoreSymlink 
          "${flakeRoot}/dotfiles/${name}";
      })
      (lib.filterAttrs 
        (name: type: type == "directory") 
        (builtins.readDir (./. + "/../../dotfiles")));
  };
  
  programs.home-manager = {
    enable = true;
    path = lib.mkForce "${config.home.homeDirectory}/.config/nix";
  };
}