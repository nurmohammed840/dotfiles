{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Wayland
    wayland
    wayland-protocols
    libxkbcommon

    # X11 (optional)
    # xorg.libX11
    # xorg.libXcursor
    # xorg.libXi
    # xorg.libXrandr
    # xorg.libXinerama
    # xorg.libXext

    # Graphics
    vulkan-loader
    mesa
  ];

  home.sessionVariables = {
    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
      pkgs.wayland
      pkgs.libxkbcommon
      pkgs.vulkan-loader
      pkgs.mesa

      # pkgs.xorg.libX11
      # pkgs.xorg.libXcursor
      # pkgs.xorg.libXi
      # pkgs.xorg.libXrandr
      # pkgs.xorg.libXinerama
      # pkgs.xorg.libXext
    ];
  };
}