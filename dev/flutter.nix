{ pkgs, ... }:

let
  android = {
    platform = "36";
    buildTools = "35.0.0";
  };
  androidEnv = pkgs.androidenv.override { licenseAccepted = true; };
  androidComposition = androidEnv.composeAndroidPackages {
    platformVersions = [ android.platform ];
    buildToolsVersions = [ android.buildTools ];

    # ndkVersions = [ "29.0.14206865" ];
    includeNDK = true;
    includeCmake = true;
    cmakeVersions = [ "3.22.1" ];

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
    GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidSdk}/libexec/android-sdk/build-tools/${android.buildTools}/aapt2";
  };
}