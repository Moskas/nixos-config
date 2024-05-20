{ e-mail, ... }:

{
  programs.git = {
    enable = true;
    userName = "Moskas";
    userEmail = "${e-mail}";
    extraConfig = {
      init.defaultBranch = "master";
      rebase = {
        autoSquash = true;
        autoStash = true;
      };
      rerere = {
        autoupdate = true;
        enabled = true;
      };
    };
    ignores = [
      ".direnv/"
      "result"
    ];
    aliases = {
      c = "clone";
      ci = "commit";
      co = "checkout";
      s = "status";
      st = "stash";
      a = "add";
      d = "diff";
      p = "push";
      pu = "pull";
    };
  };
}
