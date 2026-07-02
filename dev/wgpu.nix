{ config, pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      libxkbcommon

      # GPU backend
      vulkan-loader
      mesa

      # Window system
      wayland
      # xorg.libX11
      # xorg.libXcursor
      # xorg.libXi
    ];
  };
}