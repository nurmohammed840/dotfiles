{ config, pkgs, ... }:

{
  # Enable Kanata system service
  services.kanata = {
    enable = true;
    
    keyboards = {
      # Just a config name.
      "mouseWorkspaceSwitcher" = {
        # Process unmapped keys transparently so the rest of your mouse works normally
        extraDefCfg = ''
          process-unmapped-keys yes
        '';

        config = ''
          ;; Define the physical source keys Kanata will listen to
          (defsrc
            bfwd  ;; Physical "Forward" side button on your mouse (Button 9 / Mouse 5)
            bback ;; Physical "Back" side button on your mouse (Button 8 / Mouse 4)
          )

          ;; Define shortcut aliases (M- = Meta / Super / Windows Key)
          (defalias
            ws-up M-up    ;; Win + Up
            ws-dn M-down  ;; Win + Down
          )
          
          ;; Positional mapping:
          ;; (bfwd / Front) -> Win + Up
          ;; (bback / Rear) -> Win + Down
          (deflayer default
            @ws-up
            @ws-dn
          )
        '';
      };
    };
  };

  users.users.nur.extraGroups = [ "input" "uinput" ];
}