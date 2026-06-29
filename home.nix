{ config, pkgs, ... }:

{
  imports = [
    ./dev/utils.nix
    ./dev/rust.nix

    ./programs/zoxide.nix
  ];

  home = {
    username = "nur";
    homeDirectory = "/home/nur";
    stateVersion = "26.05";
  };
  home.packages = with pkgs; [
    vscode
    mdbook
    discord
    obs-studio
    nh # Nix cli helper
    google-chrome
  ];

  programs.firefox.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Nur Mohammed";
        email = "nurmohammed840@gmail.com";		    
      };
    };
  };
  
  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
    };
    shellAliases = {
      nix-pull = "sudo nix flake update --flake /etc/nixos";
    };
  };
}
