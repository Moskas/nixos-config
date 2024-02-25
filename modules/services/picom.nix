{
  services.picom = {
    enable = true;
    #package = pkgs.picom-next;
    backend = "glx";
    vSync = true;
    opacityRules = [
      "90:class_g = 'kitty' && !focused"
      "98:class_g = 'kitty' && focused"
      "95:class_g = 'Emacs' && !focused"
      "98:class_g = 'Emacs' && focused"
      "95:class_g = 'Zathura' && !focused"
      "98:class_g = 'Zathura' && focused"
      "95:class_g = 'discord' && !focused"
      "98:class_g = 'discord' && focused"
    ];
    settings = {
      blur = {
        method = "dual_kawase";
        strength = 5;
      };
      unredir-if-possible = true;
    };
  };
}
