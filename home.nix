{ pkgs, ... }:

{
  imports = [
    ./dev/utils.nix
    ./dev/rust.nix
    ./dev/typescript.nix

    ./programs/zoxide.nix
    ./programs/nushell.nix
    ./programs/alacritty.nix

    ./programs/git.nix

    ./programs/mpv.nix
  ];

  home = {
    username = "nur";
    homeDirectory = "/home/nur";
    stateVersion = "26.05";
  };
  home.packages = with pkgs; [
    nh # Nix cli helper
    vscode
    mdbook
    discord
    obs-studio
    google-chrome
    firefox
    qbittorrent
  ];
}
