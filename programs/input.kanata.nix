{
  # Enable uinput
  hardware.uinput.enable = true;
  # Enable the uinput module
  boot.kernelModules = [ "uinput" ];

  users.users.nur.extraGroups = [ "input" "uinput" ];

  # Enable Kanata system service
  services.kanata = {
    enable = true;
    
    keyboards = {
      # Just a config name.
      "mouseWorkspaceSwitcher" = {
        # Use `ls /dev/input/by-path/` to find your keyboard or mouse devices.
        devices = [
          "/dev/input/by-path/pci-0000:05:00.4-usb-0:2:1.0-event-mouse"
        ];

        # Process unmapped keys transparently so the rest of your mouse works normally
        extraDefCfg = ''
          process-unmapped-keys yes
        '';

        config = ''
          ;; Define the physical source keys Kanata will listen to
          (defsrc
            mfwd  ;; Physical "Forward" side button (Mouse 5)
            mbck  ;; Physical "Back" side button (Mouse 4)
          )

          ;; Positional mapping:
          (deflayer default
            M-up    ;; Forward  -> Win + Up
            M-down  ;; Back     -> Win + Down
          )
        '';
      };
    };
  };
}