def awi [] {
    load-env (open /Users/alexandru.pascan/.aws_credentials.env | lines | split column "=" | transpose -r | transpose -d)
}

alias awr = dev; awi 
alias awp = prod; awi
alias k = kubectl
alias kk = k9s

def h [...args] {
    let result = (/opt/homebrew/bin/helm ...$args | lines | where {|line| ($line !~ "skipping loading invalid entry")})
    $result
    # nushell automatically returns the last exit code, no need for explicit return
}