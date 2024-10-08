{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs; # For rust-analyzer etc
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      jnoortheen.nix-ide
      arrterian.nix-env-selector
      kamadorueda.alejandra
      jdinhlife.gruvbox
      brandonkirbyson.solarized-palenight
      ms-pyright.pyright
      rust-lang.rust-analyzer
      ms-python.black-formatter
      asvetliakov.vscode-neovim
      mkhl.direnv
      fill-labs.dependi
    ];
  };
}
