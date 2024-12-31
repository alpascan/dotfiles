{config, pkgs, ...}: {
 programs.zoxide = {
      enable = true;
      enableNushellIntegration = true;
      enableFishIntegration = true;
    };
}