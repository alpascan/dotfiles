# Darwin system configuration
{ config, pkgs, ... }: {
  # System-wide configuration
  nixpkgs.config.allowUnfree = true;
  
  # System packages (these are installed globally)
  environment.systemPackages = with pkgs; [
    neovim
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

  # Homebrew configuration
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    enableRosetta = true;
    user = "alexandru.pascan";
    autoMigrate = true;

    taps = [
      "aws/tap"
      "datawire/blackbird"
      "dwarvesf/tap"
      "homebrew/cask"
      "homebrew/core"
      "homebrew/services"
      "koekeishiya/formulae"
    ];

    # Keeping only the most essential brews that can't be managed through nix
    brews = [
      "aws-vault"
      "awscli"
      "git"
      "helm"
      "jq"
      "kubernetes-cli"
      "ripgrep"
      "tilt"
      "ykman"
    ];

    casks = [
      "alfred"
      "bettertouchtool"
      "brave-browser"
      "font-cascadia-code"
      "font-monaspace"
      "intellij-idea"
      "iterm2"
      "microsoft-auto-update"
      "microsoft-edge"
      "microsoft-teams"
      "vivaldi"
      "yubico-yubikey-manager"
      "zen-browser"
    ];
  };

  # Nix configuration
  nix.settings.experimental-features = "nix-command flakes";

  # Shell configuration
  programs.zsh.enable = true;

  # System configuration
  system.stateVersion = 5;

  # Platform configuration
  nixpkgs.hostPlatform = "aarch64-darwin";
}