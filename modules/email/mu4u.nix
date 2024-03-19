{ pkgs, ... }: {
  programs.mu = { enable = true; };
  services.mbsync = {
    enable = true;
    #configFile = lib.mkPath "~/.config/mbsync/mbsyncrc";
  };
  services.imapnotify = {
    enable = true;
    package = pkgs.goimapnotify;
  };
  home.packages = with pkgs; [ isync goimapnotify msmtp ];
}
