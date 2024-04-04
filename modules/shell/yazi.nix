{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      log = {
        enabled = false;
      };
      manager = {
        show_hidden = false;
        sort_by = "modified";
        sort_dir_first = true;
        #sort_reverse = true;
        ratio = [
          0
          5
          5
        ];
      };
    };
    theme = {
      status = {
        separator_open = "";
        separator_close = "";
        separator_style = {
          fg = "black";
          bg = "blue";
        };
        mode_normal = {
          fg = "black";
          bg = "blue";
        };
        mode_select = {
          fg = "black";
          bg = "red";
        };
        select = {
          fg = "black";
          bg = "red";
        };
      };
    };
  };
}
