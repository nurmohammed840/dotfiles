# mpv is an open-source media player
{ pkgs, ... }:

{
  # See: https://wiki.nixos.org/wiki/MPV
  programs.mpv = {
    enable = true;

    # https://github.com/topics/mpv-script
    # https://github.com/mpv-player/mpv/wiki/User-Scripts
    # https://search.nixos.org/packages?channel=unstable&query=mpvScripts&sort=alpha_asc
    scripts = with pkgs.mpvScripts; [
      modernz # https://github.com/Samillion/ModernZ
      sponsorblock
      thumbfast
    ];

    bindings = {
      UP = "add volume 5";
      DOWN = "add volume -5";
      LEFT = "seek -5";
      RIGHT = "seek 5";
    };

    scriptOpts = {
      modernz = {
        layout = "mini";
        seekbar_height = "small";
        show_window_title = "yes";
      };
    };
  };
  
  # TODO: Replace with `programs.mpv.config` once Home Manager fixes:
  # https://github.com/nix-community/home-manager/issues/5853
  xdg.configFile."mpv/mpv.conf".text = ''
    osc=no
    osd-bar=no
    title-bar=no

    profile=high-quality
    ytdl-format=bestvideo+bestaudio
  '';
}
