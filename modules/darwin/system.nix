# modules/darwin/system.nix
{ pkgs, ... }: {
  # System packages
  environment.systemPackages = with pkgs; [
    neovim
    home-manager
    tmux
    nushell
    fzf
    zoxide
    nodejs
    oh-my-posh
    python3
    alacritty
    temurin-bin
    yabai
  ];

  # Enable zsh
  programs.zsh.enable = true;
}