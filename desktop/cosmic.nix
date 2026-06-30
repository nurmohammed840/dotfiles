{
  services = {
    desktopManager.cosmic.enable = true;
    displayManager = {
      cosmic-greeter.enable = true;
      autoLogin = {
        enable = true;
        user = "nur";
      };
    };
    system76-scheduler.enable = true;
  };

  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
}