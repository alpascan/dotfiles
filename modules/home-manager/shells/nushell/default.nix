# nushell nix file
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
      source ${./config/config.nu};

      source ${./config/aliases.nu};
    '';
  };
}