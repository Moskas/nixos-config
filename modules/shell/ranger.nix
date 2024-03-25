{ pkgs, ... }:

{
  programs.ranger = {
    enable = true;
    settings = {
      preview_images = true;
      vcs_aware = true;
      draw_borders = "both";
      mouse_enabled = true;
      update_title = true;
    };
    extraConfig = "default_linemode devicons";
    plugins = [
      {
        name = "ranger_devicons";
        src = pkgs.fetchFromGitHub {
          owner = "alexanderjeurissen";
          repo = "ranger_devicons";
          rev = "ed718dd6a6d5d2c0f53cba8474c5ad96185057e9";
          hash = "sha256-ETE13REDIVuoFIbvWqWvQLj/2fGST+1koowmmuBzGmo=";
        };
      }
      {
        name = "zoxide";
        src = pkgs.fetchFromGitHub {
          owner = "jchook";
          repo = "ranger-zoxide";
          rev = "281828de060299f73fe0b02fcabf4f2f2bd78ab3";
          hash = "sha256-JEuyYSVa1NS3aftezEJx/k19lwwzf7XhqBCL0jH6VT4=";
        };
      }
      {
        name = "ranger-archives";
        src = pkgs.fetchFromGitHub {
          owner = "maximtrp";
          repo = "ranger-archives";
          rev = "62783ddb84c8fd25eba1be1607d3a47e8efe8b31";
          hash = "sha256-hSwTsWrbX+unvm9f7dkCRljc6EM9bhGOHRaLNo7ehio=";
        };
      }
    ];
  };
}
