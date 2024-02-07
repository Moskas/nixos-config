{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
      sha256 = "0czhz8ghdaqlrqql5wy2hqn0whwx8b8734002ikajkbj1lgnz4lb";
    }))
  ];
}
