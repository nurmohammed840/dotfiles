{ pkgs, ... }:

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
    nh # Nix cli helper
    vscode
    mdbook
    discord
    obs-studio
    google-chrome
    firefox
    alacritty
  ];

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
