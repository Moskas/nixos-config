{ config, lib, pkgs, e-mail, ... }:

{
  programs.git = {
    enable = true;
    userName = "Moskas";
    userEmail = "${e-mail}";
    extraConfig = { init.defaultBranch = "master"; };
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

  # Github helper is also git so yeah
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

  # Sometimes you need to checkout the git history in a more managable way
  programs.lazygit = {
    enable = true;
  };
}
