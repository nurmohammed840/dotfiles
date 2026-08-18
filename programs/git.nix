{
  programs.git = {
    enable = true;
    settings = {
      core.editor = "code --wait";
      pull.rebase = true;
      rebase.autoStash = true;
      user = {
        name = "Nur Mohammed";
        email = "nurmohammed840@gmail.com";		    
      };
    };
  };
}