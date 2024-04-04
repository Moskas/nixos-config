{ e-mail, ... }:

{
  programs.git = {
    enable = true;
    userName = "Moskas";
    userEmail = "${e-mail}";
    extraConfig = {
      init.defaultBranch = "master";
    };
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
