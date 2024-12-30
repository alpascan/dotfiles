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

   
  };
}
