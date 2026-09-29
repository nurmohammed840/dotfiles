{ config, ... }:

{
  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
    };
    shellAliases = {
      nix-pull = "sudo nix flake update --flake /etc/nixos";
    };
    extraEnv = ''
      $env.PATH = ($env.PATH | prepend "${config.home.homeDirectory}/.cargo/bin")
    '';
    extraConfig = ''
      def --wrapped c [...args] {
        if ($args | is-empty) {
          ^cargo
        } else if ($args.0 == "test") {
          ^cargo nextest run ...($args | skip 1)
        } else {
          ^cargo ...$args
        }
      }
    '';
  };
}