# modules/darwin/paths.nix
[
  # Nix/Darwin paths (highest priority after home-manager)
  "/run/current-system/sw/bin"
  "/nix/var/nix/profiles/default/bin"

  # Homebrew paths
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"

  # MacOS default paths
  "/usr/local/bin"
  "/usr/bin"
  "/usr/sbin"
  "/bin"
  "/sbin"
]