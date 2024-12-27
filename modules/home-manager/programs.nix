# modules/home-manager/programs.nix
{ config, pkgs, ... }: {
  programs = {
    git = {
      enable = true;
      userName = "alpascan";
      userEmail = "alpascan@gmail.com";
      
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
      };
    };

    # Terminal utilities
    bat.enable = true;
    fzf.enable = true;
    zoxide.enable = true;
    nushell = {
        enable = true;
        configFile.source = ./dotfiles/nushell/nushell.nu;

      };
  };
}
