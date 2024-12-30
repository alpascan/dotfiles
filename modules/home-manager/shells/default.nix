
{ config, pkgs, lib, paths,  flakeRoot, machineName, ... }: {
  imports = [
    ./nushell.nix
    ./fish.nix
  ];
  home = {
    packages = with pkgs; [
    # Terminal shell
    nushell
    # Plugins
    oh-my-posh
    carapace
    zoxide
    ];
    sessionPath = [
      "${config.home.homeDirectory}/.nix-profile/bin"  # home-manager path first
    ] ++ paths; 
    shellAliases = {
      hmu = "home-manager switch --flake ${flakeRoot}#${config.home.username}";
      dru = "darwin-rebuild switch --flake ${flakeRoot}#${machineName}";
      # Add shell aliases here
    };
  };
  programs = {
  zoxide = {
      enable = true;
      enableNushellIntegration = true;
      enableFishIntegration = true;
    };
    # Terminal utilities
    carapace = {
      enable = true;
      enableNushellIntegration = true;
      enableFishIntegration = true;
    };

    oh-my-posh = {
      enable = true;
      enableNushellIntegration = true;
      enableFishIntegration = true;
      useTheme = "emodipt-extend";
    };
  };
}