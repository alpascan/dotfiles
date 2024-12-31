{ config, pkgs, ... }: {
  programs.oh-my-posh = {
      enable = true;
      enableNushellIntegration = true;
      enableFishIntegration = true;
      settings = builtins.fromJSON (builtins.readFile ./config/monokai.omp.json);
    };
}