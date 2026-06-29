{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat       # view file contain
    tokei     # count your code quickly
    bottom    # TUI system monitor
    fd        # alternative to `find`
    ripgrep   # search inside files
  ];
}
