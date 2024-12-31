{ config, pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "custom";
      themes.custom = {
        fg = "#fcfcfa";
        bg = "#2d2a2e";
        black = "#2d2a2e";
        red = "#ff6188";
        green = "#a9dc76";
        yellow = "#ffd866";
        blue = "#78dce8";
        magenta = "#ab9df2";
        cyan = "#78dce8";
        white = "#fcfcfa";
        orange = "#fc9867";
      };
      
      # Basic UI configuration
      pane_frames = false;
      default_layout = "compact";
      default_shell = "${pkgs.nushell}/bin/nu";
      
      # Key bindings similar to your tmux config
      keybinds = {
        normal = {
          "Alt |" = { SplitHorizontal = {}; };
          "Alt -" = { SplitVertical = {}; };
          "Alt q" = { CloseFocus = {}; };
        };
      };
    };
  };
}
