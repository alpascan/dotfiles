


#nushell config
$env.config.edit_mode = "vi"
$env.show_banner = false
$env.HOME_MANAGER_FLAKE = "/Users/alexandru.pascan/.config/nix"

# Language settings
$env.LANG = "en_US.UTF-8"
$env.LC_ALL = "en_US.UTF-8"

# editor
$env.EDITOR = "nvim"

# PATH
let paths: list<string> = [
    ($env.HOME | path join "bin") # local scripts
    ($env.HOME | path join ".nix-profile/bin") # home-manager
    "/nix/var/nix/profiles/default/bin" # nix binaries
    "/usr/local/bin" # macos specific
    "/opt/homebrew/bin" # homebrew
    "/run/current-system/sw/bin" 
    $env.PATH
]

$env.PATH = $paths | str join ":"

# aliases
alias ll = ls -la
alias v = vim
alias vim = nvim
alias vi = nvim
def o [path: any] {
    if $nu.os-info.name == "macos" { 
        ^/usr/bin/open $path 
    } else { 
        xdg-open $path 
    }
}