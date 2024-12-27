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
    fzf.enable = true;
    zoxide.enable = true;
    nushell = {
        enable = true;
        configFile.source = ./../../dotfiles/nushell/config.nu;
      };
  };

    # Dotfile linking for programs that don't allow changing the config location
    home.file = {
        ".config/nvim" = {
          source = ../../dotfiles/nvim;
          recursive = true;
        };
      };
}
