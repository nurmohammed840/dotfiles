{ pkgs, lib, ... }:

let
  zoxideInit = pkgs.writeText "zoxide.nu" ''
    ${pkgs.zoxide}/bin/zoxide init nushell
  '';
in
{
  home.packages = [
    pkgs.zoxide
  ];

  programs.nushell.extraConfig = lib.mkAfter ''
    source ${zoxideInit}
  '';
}