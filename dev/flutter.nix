{ pkgs, ... }:

let
  buildToolsVersion = "28.0.3";
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    buildToolsVersions = [ buildToolsVersion ];
    platformVersions = [ "36" ];

    # includeCmdlineTools = true;

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
    mesa-demos
    flutter
    android-tools
    androidSdk
  ];

  environment.variables = {
    ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
    ANDROID_HOME = "${androidSdk}/libexec/android-sdk";
  };
}