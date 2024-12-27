# modules/home-manager/packages.nix
{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Development
    ripgrep
    fd
    jq
    bat
    xonsh
    lazygit
    # Add more packages here
  ];
}
