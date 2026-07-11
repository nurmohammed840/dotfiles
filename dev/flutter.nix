{ pkgs, ... }:

{
  nixpkgs.config.android_sdk.accept_license = true;

  programs.java = {
    enable = true;
    package = pkgs.jdk21;
  };

  home.packages = with pkgs; [
    flutter
    android-tools
    androidSdk
  ];
}