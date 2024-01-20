{ config, lib, pkgs, nixvim, ... }:

{
  imports = [ nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    plugins = {
      lualine.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      indent-blankline.enable = true;
      luasnip = {
        enable = true;
        extraConfig = {
          enable_autosnippets = true;
          #   store_selection_keys = “<Tab>”;
        };
      };
      gitblame.enable = true;
      nix.enable = true;
      lsp-format = { enable = true;};
      lsp = {
        enable = true;
        servers = {
          rust-analyzer = {
            enable = true;
            installRustc = false;
            installCargo = false;
          };
          lua-ls = {
            enable = true;
            settings.telemetry.enable = false;
          };
          vuels = {
            enable = true;
          };
        };
      };
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
        ];

        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = {
            action = ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expandable() then
                  luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                elseif check_backspace() then
                  fallback()
                else
                  fallback()
                end
              end
            '';
            modes = [ "i" "s" ];
          };
        };
      };
    };
    options = { number = true; };
    globals.mapleader = " ";
    keymaps = [{
      key = "<esc>";
      action = ":noh<return><esc>";
    }];
    extraPlugins = with pkgs.vimPlugins; [ ];
  };
}
