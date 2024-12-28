# Nushell config
$env.config.edit_mode = "vi"
$env.show_banner = false

# Language settings
$env.LANG = "en_US.UTF-8"
$env.LC_ALL = "en_US.UTF-8"

# Editor settings
$env.EDITOR = "nvim"

# PATH configuration
let paths: list<string> = [
    ($env.HOME | path join "bin") # local scripts
    ($env.HOME | path join ".nix-profile/bin") # home-manager
    "/nix/var/nix/profiles/default/bin" # nix binaries
    "/usr/local/bin" # macOS-specific
    "/opt/homebrew/bin" # Homebrew
    "/run/current-system/sw/bin" # System binaries
    "/usr/bin" # macOS-specific
    "/bin" # Standard binaries
    "/usr/sbin" # macOS-specific
    "/sbin" # macOS-specific
]

# Prevent duplicates in PATH
$env.PATH = $paths | uniq | str join ":"

# Aliases
alias ll = ls -la
alias v = vim
alias vim = nvim
alias vi = nvim
alias o = ^open

# Open function based on OS
def open [path: any] {
    if $nu.os-info.name == "macos" { 
        ^/usr/bin/open $path 
    } else { 
        xdg-open $path 
    }
}
