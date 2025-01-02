{ config, pkgs, ... }:{
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      {
        name = "tpm";
        src = pkgs.fetchFromGitHub {
          owner = "tmux-plugins";
          repo = "tpm";
          rev = "v3.0.0"; # Replace with the desired version
          sha256 = "sha256-goes-here"; # Replace with the actual hash
        };
      }
    ];
  };
}
