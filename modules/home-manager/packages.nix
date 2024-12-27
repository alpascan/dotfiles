# modules/home-manager/packages.nix
{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Development
    ripgrep
    fd
    jq
    neovim
    zoxide
    lazygit
    # Add more packages here
  ];
}
