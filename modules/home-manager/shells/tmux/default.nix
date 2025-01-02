{ config, pkgs, lib, ... }: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    mouse = true;
    prefix = "C-q";
    terminal = "xterm-256color";
    shell = "${pkgs.nushell}/bin/nu";
    
    plugins = with pkgs.tmuxPlugins; [
      sensible

      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour "mocha"
          
          # Base colors
          set -g @catppuccin_status_background "#222223"
          set -g @catppuccin_status_foreground "#FDF9F3"

          
          # Window settings
          set -g @catppuccin_window_left_separator ""
          set -g @catppuccin_window_right_separator " "
          set -g @catppuccin_window_middle_separator " █"
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"

          # Window colors
          set -g @catppuccin_window_default_background "#363537"
          set -g @catppuccin_window_default_foreground "#FDF9F3"
          set -g @catppuccin_window_current_background "#FC618D"
          set -g @catppuccin_window_current_foreground "#222223"
          
          # Status modules
          set -g @catppuccin_status_modules_right "user host uptime date_time"          
          set -g @catppuccin_date_time_text "%Y-%m-%d"
          
          # Status colors
          set -g @catppuccin_directory_color "#7BD88F"
          set -g @catppuccin_date_time_color "#FD9353"
          set -g @catppuccin_session_color "#948AE3"
          set -g @catppuccin_user_color "#FC618D"
          set -g @catppuccin_host_color "#5AD4E6"
          set -g @catppuccin_uptime_color "#7BD88F"
          
          # Status separators
          set -g @catppuccin_status_left_separator  " " 
          set -g @catppuccin_status_right_separator " "        
          set -g @catppuccin_status_right_separator_inverse "no"
          set -g @catppuccin_status_fill "icon"
          set -g @catppuccin_status_connect_separator "no"
          
          # Additional highlighting
          set -g @catppuccin_pane_border_style "fg=#363537"
          set -g @catppuccin_pane_active_border_style "fg=#FC618D"
        '';
      }
    ];

    extraConfig = ''
      # Cursor shape integration
      set -g -a terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'
      
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      unbind '"'
      unbind %
      bind-key q kill-pane
      
      # Nushell specific settings
      set -g default-command "${pkgs.nushell}/bin/nu"
    '';
  };
}