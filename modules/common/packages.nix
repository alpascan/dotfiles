# modules/darwin/system.nix
{ pkgs, username, ... }: {
  # System packages
  environment.systemPackages = with pkgs; [
    # integration
    home-manager
    # default terminal
    fish
    # Programing languages
    go
    nodejs
    python3
    temurin-bin
    gradle
  ];

  programs.fish.enable = true;
  users.users.${username}.shell = pkgs.fish;


}
