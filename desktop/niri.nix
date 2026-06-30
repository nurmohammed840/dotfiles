{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fuzzel
    alacritty
    xwayland-satellite
  ];

  programs.niri = {
    enable = true;
    useNautilus = true;
  };
}
