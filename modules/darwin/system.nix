# modules/darwin/system.nix
{ pkgs, lib, ... }: {
  # System packages
  environment.systemPackages = with pkgs; [
    fzf
    yabai
  ];

}
