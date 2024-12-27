{ config, pkgs, ... }: 
let 
  flakePath = "${config.home.homeDirectory}/.config/nix";
  dotfiles = "${flakePath}/dotfiles";
in 
{
  xdg = {
    enable = true;
    configHome = "${config.home.homeDirectory}/.config";
  };

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
    
    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
    
    oh-my-posh = {
      enable = true;
      useTheme = "emodipt-extend";
    };
    
    nushell = {
      enable = true;
      configFile.source = ./../../dotfiles/nushell/config.nu;
      extraEnv = ''
        $env.HOME_MANAGER_FLAKE = "${flakePath}"
        $env.NIX_PATH = "darwin=${flakePath}"
        $env.XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config"
      '';
  
    };
  };

   # Link all dotfiles folders to .config
    xdg.configFile = {
    "nvim".source = config.lib.file.mkOutOfStoreSymlink ./../../dotfiles/nvim;
    "nushell".source = config.lib.file.mkOutOfStoreSymlink ./../../dotfiles/nushell;
    # Add other folders as needed
  };
}
