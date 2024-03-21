{ pkgs, nixvim, nixvim-config, ... }: {
  #imports = [ nixvim.homeManagerModules.nixvim ];
  #home.packages = with pkgs; [ nixvim-config.packages.${system}.default ];

  programs.neovim = { enable = true; };
}
