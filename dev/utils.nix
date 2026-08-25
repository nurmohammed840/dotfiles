{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat       # view file contain
    tokei     # count your code quickly
    fd        # alternative to `find`
    ripgrep   # search inside files
    fastfetch # View system info
  ];
}
