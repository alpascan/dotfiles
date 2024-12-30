# modules/home-manager/packages.nix
{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Development
    ripgrep
    fd
    jq
    tmux
    git
    oh-my-posh
    neovim
    zoxide
    lazygit
    # Add more packages here
  ];
}
