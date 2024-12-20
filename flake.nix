{
  description = "Work darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";  # This will track main branch
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = { self, nixpkgs, home-manager, darwin, nix-homebrew, ... }@inputs:
  let
    system = "aarch64-darwin";
    username = "alexandru.pascan";
  in
  {
    darwinConfigurations."workMac" = darwin.lib.darwinSystem {
      inherit system;
      modules = [
        # Main nix-darwin configuration
        {
          nixpkgs.config.allowUnfree = true;
          users.users.${username}.home = "/Users/${username}";

          # Nix configuration
          nix.settings.experimental-features = [ "nix-command" "flakes" ];
          
          # Enable zsh
          programs.zsh.enable = true;
          
          environment.systemPackages = with nixpkgs.legacyPackages.${system}; [
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

          system.configurationRevision = self.rev or self.dirtyRev or null;
          system.stateVersion = 5;
        }

        # Home Manager configuration
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${username} = { pkgs, ... }: {
              home.stateVersion = "23.11";
              home.packages = [ ];
              
              programs.home-manager.enable = true;
            };
          };
        }

        # Homebrew configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = username;
            autoMigrate = true;
          };

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
        }
      ];
    };
  };
}