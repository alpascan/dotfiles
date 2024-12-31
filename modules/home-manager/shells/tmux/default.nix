{ config, pkgs, ... }:
let
  tmux-monokai-pro = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-monokai-pro";
    version = "1.0.0";
    src = pkgs.fetchFromGitHub {
      owner = "maxpetretta";
      repo = "tmux-monokai-pro";
      rev = "master";
      sha256 = "sha256-S6EVkjsWU6om4E8yO/g7EOToXIEka6ZuOAGwSjjEHbA=";
    };
  };
in
{
  programs.tmux = {
    enable = true;
    prefix = "C-q";
    baseIndex = 1;
    mouse = true;
    terminal = "xterm-256color";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      {
        plugin = tmux-monokai-pro;
        extraConfig = ''
          set -g @monokai-plugins "git kubernetes-context cpu-usage ram-usage battery weather"
          set -g @monokai-show-empty-plugins false
          set -g @monokai-show-powerline true
          set -g @monokai-show-flags true
          set -g @monokai-kubernetes-hide-user true
          set -g @monokai-kubernetes-eks-hide-arn true
          set -g @monokai-show-fahrenheit false
          set -g @monokai-show-location false
          set -g @monokai-fixed-location "Lausanne"
        '';
      }
    ];
    extraConfig = ''
      # Force nushell as the default shell
      set-option -g default-command "${pkgs.nushell}/bin/nu"
      set-option -g default-shell "${pkgs.nushell}/bin/nu"
 
      # Status bar configuration
      set -g status-right ""
      
      # Window options
      set-option -g allow-rename on
      
      # Custom key bindings
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      bind-key q kill-pane
      
      # Unbind default keys
      unbind '"'
      unbind %
    '';
  };
}