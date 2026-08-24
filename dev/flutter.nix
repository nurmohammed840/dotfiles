{ flutterPkgs, ... }:

let
  pkgs = import flutterPkgs { 
    system = "x86_64-linux";
    config = {
      allowUnfree = true;
      android_sdk.accept_license = true;
    };
  };
  android = {
    platform = "36";
    buildTools = "35.0.0";
  };
  androidEnv = pkgs.androidenv.override { licenseAccepted = true; };
  androidComposition = androidEnv.composeAndroidPackages {
    platformVersions = [ android.platform ];
    buildToolsVersions = [ android.buildTools ];

    abiVersions = [ "arm64-v8a" ];
    ndkVersions = [ "29.0.14206865" ];
    cmakeVersions = [ "3.22.1" ];
    includeCmake = true;
    includeNDK = true;

    includeEmulator = false;
    includeSystemImages = false;
    includeSources = false;
    useGoogleAPIs = false;
  };
  androidSdk = androidComposition.androidsdk;
in {
  environment.systemPackages = with pkgs; [
    mesa-demos
    flutter
    jdk17
    android-tools
    androidSdk
  ];

  environment.variables = {
    ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
    ANDROID_HOME = "${androidSdk}/libexec/android-sdk";
    JAVA_HOME = "${pkgs.jdk17}";
    GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidSdk}/libexec/android-sdk/build-tools/${android.buildTools}/aapt2";
  };
}