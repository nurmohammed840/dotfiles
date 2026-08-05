{
  programs.mangohud = {
    enable = true;

    settings = {
      position = "top-left";

      fps = true;
      frame_timing = true;

      cpu_stats = true;
      cpu_temp = true;

      gpu_stats = true;
      gpu_temp = true;

      ram = true;
      vram = true;

      hud_compact = true;
      background_alpha = 0.4;
      round_corners = true;
    };
  };
}