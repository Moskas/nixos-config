{ config, lib, pkgs, ... }:

{
  imports = [ ./emacs.nix ./neovim.nix ./vscode.nix ./helix.nix ];
}
