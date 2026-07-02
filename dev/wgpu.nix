{
  home.packages = with pkgs; [
    # Wayland
    wayland
    wayland-protocols
    libxkbcommon

    # X11
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
}
