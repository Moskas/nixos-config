{ config, ... }: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    colors = {
      fg = "#${config.colorScheme.palette.base05}";
      bg = "#${config.colorScheme.palette.base00}";
      hl = "#${config.colorScheme.palette.base07}";
      "fg+" = "#${config.colorScheme.palette.base05}";
      "bg+" = "#${config.colorScheme.palette.base01}";
      "hl+" = "#${config.colorScheme.palette.base07}";
      info = "#83a598";
      prompt = "#bdae93";
      spinner = "#fabd2f";
      pointer = "#83a598";
      marker = "#fe8019";
      header = "#665c54";
    };
  };
}
