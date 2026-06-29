{
  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
    };
    shellAliases = {
      nix-pull = "sudo nix flake update --flake /etc/nixos";
    };
  };
}