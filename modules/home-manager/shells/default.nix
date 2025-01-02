
{ config, pkgs, lib, paths,  flakeRoot, machineName, ... }: {
  imports = [
    # shells
    ./nushell
    ./fish

    # utilities
    ./oh-my-posh
    ./carapace
    ./zoxide

    # multiplexer
    ./zellij
    ./tmux
  ];
  home = {
    
    sessionPath = [
      "${config.home.homeDirectory}/.nix-profile/bin"  # home-manager path first
    ] ++ paths; 
    shellAliases = {
      # home-manager aliases
      hmu = "home-manager switch --flake ${flakeRoot}#${config.home.username}";
      hbu = "home-manager buind --flake ${flakeRoot}#${config.home.username}";

      # nix-darwin aliases
      dru = "darwin-rebuild switch --flake ${flakeRoot}#${machineName}";
      dbu = "darwin-rebuild build --flake ${flakeRoot}#${machineName}";
      
      # git common aliases
      # Common git commands
       g = "git";
      ga = "git add";
      gaa = "git add --all";
      gb = "git branch";
      gco = "git checkout";
      gcb = "git checkout -b";
      gc = "git commit -v";
      gcm = "git commit -m";
      gd = "git diff";
      gst = "git status";
      gl = "git pull";
      gp = "git push";
      gf = "git fetch";
      gfa = "git fetch --all --prune";
      
      # Stash operations
      gsta = "git stash push";
      gstp = "git stash pop";
      gstl = "git stash list";
      
      # Branch operations
      gbd = "git branch -d";
      gbD = "git branch -D";
      
      # Remote operations
      grv = "git remote -v";
      gra = "git remote add";
      
      # Basic log views
      glg = "git log --stat";
      glo = "git log --oneline --decorate";
      
      # Reset operations
      grh = "git reset";
      grhh = "git reset --hard";
    };
  };
}