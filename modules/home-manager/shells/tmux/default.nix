{ config, pkgs, lib, ... }:{
  programs.tmux = {
    enable = true;

    # Your custom tmux configuration
    extraConfig = ''
      # List of plugins
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'maxpetretta/tmux-monokai-pro'
      set -g @plugin 'yardnsm/tmux-1password'

      set -g default-terminal "xterm-256color"
      set -g base-index 1
      setw -g pane-base-index 1
      set -g @monokai-show-empty-plugins false
      set -g @monokai-show-powerline false
      set -g @monokai-show-flags true
      set -g @monokai-kubernetes-hide-user true
      set -g @monokai-kubernetes-eks-hide-arn true
      set -g @monokai-show-fahrenheit false
      set -g @monokai-show-location false
      set -g @monokai-fixed-location "Lausanne"

      # Reload config
      bind r source-file ~/.tmux.conf

      # Enable mouse mode
      set -g mouse on
      set -g status-right '#(echo $ZSH_VI_MODE)'

      # Window naming and key bindings
      set-option -g allow-rename on
      unbind-key C-b
      set-option -g prefix C-q
      bind-key C-q send-prefix
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      unbind '"'
      unbind %
      bind-key q kill-pane

      run '~/.tmux/plugins/tpm/tpm'
    '';
  };

home.activation.installTPM = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  export PATH=${pkgs.git}/bin:$PATH
  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
  fi
'';

}
