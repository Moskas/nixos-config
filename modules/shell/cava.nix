{ config, ... }: {
  programs.cava = {
    enable = true;
    settings = {
      general = {
        framerate = 144;
        bars = 0;
        bar_width = 2;
        bar_spacing = 1;
      };
      input = {
        method = "fifo";
        source = "/tmp/mpd.fifo";
        sample_rate = 44100;
        sample_bits = 16;
      };
      output = {
        method = "ncurses";
        channels = "mono";
        mono_option = "right";
      };
      smoothing = {
        noise_reduction = 88;
        gravity = 100;
        integral = 0;
      };
      color = {
        foreground = "'#${config.colorScheme.palette.base06}'";
        background = "'#${config.colorScheme.palette.base00}'";
        gradient = 1;
        gradient_count = 6;
        gradient_color_1 = "'#${config.colorScheme.palette.base0B}'";
        gradient_color_2 = "'#${config.colorScheme.palette.base0B}'";
        gradient_color_3 = "'#${config.colorScheme.palette.base0A}'";
        gradient_color_4 = "'#${config.colorScheme.palette.base0A}'";
        gradient_color_5 = "'#${config.colorScheme.palette.base08}'";
        gradient_color_6 = "'#${config.colorScheme.palette.base08}'";
      };
      eq = {
        "1" = 1; # bass
        "2" = 1;
        "3" = 1; # midtone
        "4" = 1;
        "5" = 1; # treble
      };
    };
  };
}
