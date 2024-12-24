# modules/darwin/homebrew.nix
{ config, pkgs, lib, username, ... }: {
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
      "k9s"
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
      "font-cascadia-code"
      "font-monaspace"
      "intellij-idea"
      "iterm2"
      "microsoft-auto-update"
      "microsoft-edge"
      "microsoft-teams"
      "yubico-yubikey-manager"
      "zen-browser"
    ];

    onActivation.cleanup = "zap";
  };
}
