{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    coc = { enable = true; };
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-airline
      vim-airline-themes
      gruvbox-material
    ];
    extraConfig = ''
      nnoremap <esc> :noh<return><esc>
      colorscheme gruvbox-material
    '';
  };
}
