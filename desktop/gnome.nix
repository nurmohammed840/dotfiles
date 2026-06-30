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

    gnome.core-developer-tools.enable = false;
    gnome.games.enable = false;
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.just-perfection
  ];

  environment.gnome.excludePackages = with pkgs; [
    yelp
    gnome-user-docs
    gnome-tour
    epiphany
    gnome-console
    simple-scan
    gnome-connections
  ];
}