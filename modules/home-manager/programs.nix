{ config, pkgs, ... }: 
let 
    flakePath = "${config.home.homeDirectory}/.config/nix";
    dotfiles = "${flakePath}/dotfiles";
in 
{
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
      extraEnv = ''
        $env.HOME_MANAGER_FLAKE = "${flakePath}";
        $env.NIX_PATH = "darwin=${flakePath}"
        source "${dotfiles}/nushell/env.nu"  # Source our symlinked config
      '';
      extraConfig = ''
        source "${dotfiles}/nushell/config.nu"  # Source our symlinked config
      '';
    };
  };
  
  # Dotfile linking for programs that don't allow changing the config location
   home.file = {
    # Nushell configs
    ".config/nushell/env.nu".source = 
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nushell/env.nu";
    ".config/nushell/config.nu".source = 
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nushell/config.nu";
    
    # Neovim config
    ".config/nvim".source = 
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nvim";
  };
}