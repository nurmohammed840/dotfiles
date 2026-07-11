{ pkgs, ... }:

let
  buildToolsVersion = "34.0.0";
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    buildToolsVersions = [ buildToolsVersion ];
    platformVersions = [ "34" ];

    includeEmulator = false;
    includeSystemImages = false;
    includeSources = false;
    useGoogleAPIs = false;
  };
  androidSdk = androidComposition.androidsdk;
in {
  nixpkgs.config.android_sdk.accept_license = true;

  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };

  environment.systemPackages = with pkgs; [
    flutter
    android-tools
    androidSdk
  ];
}