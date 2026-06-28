{ pkgs, lib, ... }:

let
  zoxideInit = pkgs.runCommand "zoxide.nu" {} ''
    ${pkgs.zoxide}/bin/zoxide init nushell > $out
  '';
in
{
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  # Remove this when `programs.zoxide.enableNushellIntegration` is available.
  # See: https://search.nixos.org/options?channel=unstable&query=zoxide
  programs.nushell.extraConfig = lib.mkAfter ''
    source ${zoxideInit}
  '';
}