{ pkgs, ... }: {
  programs.mu = { enable = true; };
  services.mbsync = {
    enable = true;
    #configFile = lib.mkPath "~/.config/mbsync/mbsyncrc";
  };
  home.packages = with pkgs; [ isync ];
}
