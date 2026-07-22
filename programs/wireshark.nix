{ pkgs, ... }:

{
  users.users.nur.extraGroups = [ "wireshark" ];

  programs.wireshark.enable = true;

  environment.systemPackages = with pkgs; [
    wireshark
  ];
}