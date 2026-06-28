{ pkgs, lib, ... }:

let
  zoxideInit = pkgs.runCommand "zoxide.nu" {} ''
    ${pkgs.zoxide}/bin/zoxide init nushell > $out
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