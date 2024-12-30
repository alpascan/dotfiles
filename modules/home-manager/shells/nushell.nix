# modules/home-manager/nushell.nix
{ config, pkgs, paths, ... }: {
  programs.nushell = {
    enable = true;
    shellAliases = config.home.shellAliases;
    extraEnv = ''
      $env.PATH = [
        ($env.HOME + "/.nix-profile/bin")
        ${builtins.concatStringsSep " " (map (path: "\"${path}\"") paths)}
      ]
    '';
    
    extraConfig = ''
      source ${config.home.homeDirectory}/.config/nushell/config.nu
    '';
  };
}