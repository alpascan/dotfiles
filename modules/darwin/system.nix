# modules/darwin/system.nix
{ pkgs, ... }: {
  # System packages
  environment.systemPackages = with pkgs; [
    home-manager
    fzf
    nodejs
    python3
    alacritty
    temurin-bin
    gradle
    yabai
  ];
}
