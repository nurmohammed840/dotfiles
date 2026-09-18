{ pkgs, ... }:

{
  # programs.gamemode.enable = true;
  # programs.gamescope.enable = true;
  programs.steam = {
    enable = true;
    # extraCompatPackages = with pkgs; [
    #   proton-ge-bin
    # ];
  };
}