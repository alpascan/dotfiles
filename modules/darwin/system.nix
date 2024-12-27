# modules/darwin/system.nix
{ pkgs, ... }: {
  # System packages
  environment.systemPackages = with pkgs; [
    home-manager
    tmux
    fzf
    zoxide
    nodejs
    oh-my-posh
    python3
    alacritty
    temurin-bin
    gradle
    yabai
  ];
}
