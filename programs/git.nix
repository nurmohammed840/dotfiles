{
  programs.git = {
    enable = true;
    extraConfig.core.editor = "code --wait";
    settings = {
      pull.rebase = true;
      rebase.autoStash = true;
      user = {
        name = "Nur Mohammed";
        email = "nurmohammed840@gmail.com";		    
      };
    };
  };
}