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
    zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };
    # Terminal utilities
    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };



    oh-my-posh = {
      enable = true;
      useTheme = "peru";
    };
    nushell = {
        enable = true;
        configFile.source = ./../../dotfiles/nushell/config.nu;
        environmentVariables = {
            HOME_MANAGER_FLAKE = "/Users/alexandru.pascan/.config/nix";
        };
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
