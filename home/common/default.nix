# Common home-manager configuration
{ config, pkgs, ... }: {
  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # Common packages across all systems
  home.packages = with pkgs; [
    # Development tools
    git
    ripgrep
    fd
    tree
    jq

    # Languages and runtimes
    nodejs
    python3

    # Terminal utilities
    fzf
    tmux
    zoxide
  ];

  # Git configuration
  programs.git = {
    enable = true;
    userName = "alpascan";
    userEmail = "alpascan@gmail.com";  # Update this
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  # Shell configuration
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "kubectl" ];
    };

    initExtra = ''
      # Your custom zsh configuration here
    '';
  };

  # Neovim configuration
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    # Add your neovim configuration here
  };

  # Alacritty configuration
  programs.alacritty = {
    enable = true;
    # Add your alacritty configuration here
  };

  # Tmux configuration
  programs.tmux = {
    enable = true;
    # Add your tmux configuration here
  };

  # direnv configuration for project-specific environments
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Default home configuration
  home = {
    stateVersion = "23.11";
    
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERMINAL = "alacritty";
    };
  };
}