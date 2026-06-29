{
  programs.alacritty = {
    enable = true;

    settings = {
      keyboard.bindings = [
        {
          mods = "Control";
          key = "C";
          action = "Copy";
        }
        {
          mods = "Control";
          key = "V";
          action = "Paste";
        }
      ];
    };
  };
}