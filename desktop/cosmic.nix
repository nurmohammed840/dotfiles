{ pkgs, ... }:

{
  services = {
    system76-scheduler.enable = true;
    desktopManager.cosmic.enable = true;
    displayManager = {
      cosmic-greeter.enable = true;
      autoLogin = {
        enable = true;
        user = "nur";
      };
    };
  };

  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  environment.cosmic.excludePackages = with pkgs; [
    cosmic-term
  ];
}