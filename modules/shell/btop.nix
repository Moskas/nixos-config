{ ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "gruvbox_dark_v2";
      theme_background = false;
      vim_keys = true;
      proc_sorting = "memory";
    };
  };
}
