{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      # Recent update to lazygit changed that commit authors are displayed
      # in neon green that doesn't follow term colors
      gui.authorColors."*" = "cyan";
    };
  };
}
