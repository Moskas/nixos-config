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
      cl = "clone";
      ct = "commit";
      co = "checkout";
      ss = "status -bs";
      st = "stash";
      ad = "add";
      df = "diff";
      ps = "push";
      pl = "pull";
    };
  };
}
