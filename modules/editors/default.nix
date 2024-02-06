{ config, pkgs, ... }:

{
  imports = [ ./emacs.nix ./neovim.nix ./vscode.nix ];
}
