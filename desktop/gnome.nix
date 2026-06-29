{ pkgs, ... }:

{
  services = {
    xserver.enable = true;
    desktopManager.gnome.enable = true;
    displayManager = {
      gdm.enable = true;
      autoLogin = {
        enable = true;
        user = "nur";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.just-perfection
  ];

  environment.gnome.excludePackages = with pkgs; [
    yelp
    gnome-tour
    epiphany
    gnome-console
    simple-scan
    gnome-connections
  ];
}