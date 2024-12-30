{ config, pkgs, paths, ... }: {
  programs.nushell = {
    enable = true;
    shellAliases = config.home.shellAliases;
    extraEnv = ''
      $env.PATH = [
        (${config.home.homeDirectory} + "/.nix-profile/bin")
        ${builtins.concatStringsSep " " (map (path: "\"${path}\"") paths)}
      ]
    '';
  };
}