{
  programs.alacritty = {
    enable = true;

    settings = {
      keyboard.bindings = [
        # { mods = "Control"; key = "C"; action = "Copy"; }
        { mods = "Control"; key = "V"; action = "Paste"; }

        # See: https://github.com/alacritty/alacritty/issues/474#issuecomment-338803299
        { mods = "Control"; key = "Back"; chars = "\\u001b\\u007f"; } # Delete word
      ];
    };
  };
}