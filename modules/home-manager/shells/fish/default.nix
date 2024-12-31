{ config, pkgs, paths, ... }: {
  programs.fish = {
    enable = true;
    shellInit = ''
      # Clear PATH first
      set -e PATH
      
      # Add paths in the correct order, with proper quoting for spaces
      fish_add_path -g "$HOME/Library/Application Support/carapace/bin"
      fish_add_path -g "$HOME/.nix-profile/bin"
      ${builtins.concatStringsSep "\n" (map (path: 
        "fish_add_path -g ${path}"
      ) paths)}

      source ${./config/config.fish}
      
    '';
  };
}

