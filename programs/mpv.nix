# mpv is an open-source media player
{ pkgs, ... }:

{
  # See: https://wiki.nixos.org/wiki/MPV
  programs.mpv = {
    enable = true;

    # https://github.com/topics/mpv-script
    scripts = with pkgs.mpvScripts; [
      modernz
      sponsorblock
      thumbfast
    ];

    config = {
      profile = "high-quality";
      ytdl-format = "bestvideo+bestaudio";
      cache-default = 4000000;
    };
  };
}
