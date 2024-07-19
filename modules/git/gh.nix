{ config, ... }:

{
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };
  };

  programs.gh-dash = {
    enable = true;
    settings = {
      theme.colors = {
        text = {
          primary = "#${config.colorScheme.palette.base06}";
          secondary = "#${config.colorScheme.palette.base07}";
          inverted = "#${config.colorScheme.palette.base00}";
          faint = "#${config.colorScheme.palette.base05}";
          warning = "#${config.colorScheme.palette.base08}";
          success = "#${config.colorScheme.palette.base0B}";
        };
        background.selected = "#${config.colorScheme.palette.base02}";
        border = {
          primary = "#${config.colorScheme.palette.base07}";
          secondary = "#${config.colorScheme.palette.base06}";
          faint = "#${config.colorScheme.palette.base05}";
        };
      };
    };
  };
}
