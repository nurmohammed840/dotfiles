{ pkgs, ... }:

{
  services = {
    desktopManager.gnome.enable = true;
    displayManager = {
      gdm.enable = true;
      autoLogin = {
        enable = true;
        user = "nur";
      };
    };

    gnome.core-apps.enable = false;
    gnome.core-developer-tools.enable = false;
    gnome.games.enable = false;
  };

  environment.systemPackages = with pkgs; [
    nautilus                # File manager
    gnome-calculator    
    gnome-system-monitor
    gnomeExtensions.just-perfection
  ];

  environment.gnome.excludePackages = with pkgs; [
    yelp
    gnome-user-docs
    gnome-tour
    
    decibels          # Audio Player
    gnome-music       # Music Player
    showtime          # Video Player 
    gnome-console     # Terminal

    epiphany          # Web browser
    simple-scan       # Docs Scanner
    gnome-connections # Remote Desktop 
  ];
}