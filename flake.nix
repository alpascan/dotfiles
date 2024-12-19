{
  description = "Work darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nix-homebrew, nixpkgs, ...}:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages =
        [ pkgs.neovim
        pkgs.tmux
        pkgs.nushell
        pkgs.fzf
        pkgs.zoxide
        pkgs.nodejs
        pkgs.oh-my-posh
        pkgs.python3
        pkgs.alacritty
        pkgs.temurin-bin
        pkgs.yabai
        ];
      
      homebrew = {
          enable = true;
          taps = [
            "aws/tap"
            "datawire/blackbird"
            "dwarvesf/tap"
            "homebrew/cask"
            "homebrew/core"
            "homebrew/services"
            "koekeishiya/formulae"
          ];

          brews = [
            "abseil"
            "aws-vault"
            "awscli"
            "berkeley-db"
            "c-ares"
            "ca-certificates"
            "cffi"
            "cryptography"
            "docutils"
            "fd"
            "freetds"
            "gdbm"
            "gettext"
            "git"
            "glib"
            "gotop"
            "grep"
            "grpc"
            "helm"
            "jq"
            "kubernetes-cli"
            "ldns"
            "libassuan@2"
            "libcbor"
            "libevent"
            "libfido2"
            "libgpg-error"
            "libidn2"
            "libsigc++"
            "libtasn1"
            "libtool"
            "libunistring"
            "m4"
            "mpdecimal"
            "ncurses"
            "oniguruma"
            "openssh"
            "openssl@3"
            "p11-kit"
            "parallel"
            "pcre"
            "pcre2"
            "pinentry-mac"
            "pip-tools"
            "protobuf"
            "pycparser"
            "python-packaging"
            "python@3.10"
            "python@3.11"
            "python@3.12"
            "python@3.13"
            "re2"
            "readline"
            "ripgrep"
            "snappy"
            "sqlite"
            "sshpass"
            "tilt"
            "tree"
            "unixodbc"
            "wget"
            "xz"
            "ykman"
            "zsh"
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

        onActivation.cleanup = "zap";
        };
      # Neceasary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.zsh.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#workMac
    darwinConfigurations."workMac" = nix-darwin.lib.darwinSystem {
      modules = [ configuration 
       nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            enableRosetta = true;

            # User owning the Homebrew prefix
            user = "alexandru.pascan";

            autoMigrate = true;
         };
        }

      ];
    };

    darwinPackages = self.darwinConfigurations."workMac".pkgs;
  };
}
