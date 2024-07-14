{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      sync_address = "http://laffey.home/atuin/";
      key_path = "~/.local/share/atuin/key";
      search_mode = "prefix";
      style = "compact";
      history_filter = [
        "^z"
        "^cd"
        "ls"
        "^clear"
        "^exit"
        "^atuin"
      ];
    };
  };
}
