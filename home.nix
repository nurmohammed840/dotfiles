{ config, pkgs, ... }:

{
  imports = [
    ./dev/utils.nix
    ./dev/rust.nix
  ];

  home = {
    username = "nur";
    homeDirectory = "/home/nur";
    stateVersion = "26.05";
  };
  home.packages = with pkgs; [
    gnomeExtensions.just-perfection
    vscode
    discord
  ];

  programs.home-manager.enable = true;

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
