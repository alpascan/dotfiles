{ config, pkgs, ... }: 
let 
    flakePath = "${config.home.homeDirectory}/.config/nix";
    dotfiles = "${flakePath}/dotfiles";
in 
{
  xdg = {
    enable = true;
    configHome = "${config.home.homeDirectory}/.config";
    cacheHome = "${config.home.homeDirectory}/.cache";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
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
      enableFishIntegration = true;
    };
    
    carapace = {
      enable = true;
      enableFishIntegration = true;
    };
    
    oh-my-posh = {
      enable = true;
      enableFishIntegration = true;
      useTheme = "emodipt-extend";
    };
    nushell 
        = {
      enable = true;
      configFile.source = "${config.xdg.configHome}/nushell/config.nu";
      loginFile.source = "${config.xdg.configHome}/nushell/login.nu";
      envFile.source = "${config.xdg.configHome}/nushell/env.nu";
          };
    fish = {
      enable = true;
  };
  };
  
  # Dotfile linking for programs that don't allow changing the config location
   home.file = {
    # Nushell configs
    ".config/nushell".source = 
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nushell";
    
    # Neovim config
    ".config/nvim".source = 
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nvim";
  };
}