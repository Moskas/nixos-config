{
  nixvim,
  nixvim-config,
  pkgs,
  ...
}:
{
  #imports = [ nixvim.homeManagerModules.nixvim ];
  #home.packages = with pkgs; [ nixvim-config.packages.${system}.default ];

  programs.neovim = {
    enable = true;
  };
}
