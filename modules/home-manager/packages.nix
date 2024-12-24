# modules/home-manager/packages.nix
{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Development
    ripgrep
    fd
    jq
    bat
    nushell
    lazygit
    floorp
    # Add more packages here
  ];
}
