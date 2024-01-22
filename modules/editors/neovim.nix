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
      nvim-autopairs.enable = true;
      which-key.enable = true;
      alpha = {
        enable = true;
        theme = null;
        iconsEnabled = true;
        layout = let
          padding = val: {
            type = "padding";
            inherit val;
          };
        in [
          (padding 4)
          {
            opts = {
              hl = "AlphaHeader";
              position = "center";
            };
            type = "text";
            val = [
              "█▒█▒█▀█▒█▀▀▒█▒█▒▒▒▀█▀▒█▒█▒█▀▀▒▒▒█▀█▒█▒▒▒█▀█▒█▀▄▒█▀▀▒▀█▀▒"
              "█▀█▒█▄█▒█▒▒▒█▄▀▒▒▒▒█▒▒█▀█▒█▄▄▒▒▒█▄█▒█▒▒▒█▄█▒█▒█▒█▄▄▒▒█▒▒"
              "█▒█▒█▒█▒█▄▄▒█▒█▒▒▒▒█▒▒█▒█▒█▄▄▒▒▒█▒▒▒█▄▄▒█▒█▒█▒█▒█▄▄▒▒█▒▒"
              "                                                        "
              "                 git@github.com:Moskas                  "
            ];
          }
          (padding 2)
          {
            type = "button";
            val = "  Find File";
            on_press.raw = "require('telescope.builtin').find_files";
            opts = {
              # hl = "comment";
              keymap = [
                "n"
                "f"
                ":Telescope find_files <CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "f";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "  New File";
            on_press.__raw = "function() vim.cmd[[ene]] end";
            opts = {
              # hl = "comment";
              keymap = [
                "n"
                "n"
                ":ene <BAR> startinsert <CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "n";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "󰈚  Recent Files";
            on_press.raw = "require('telescope.builtin').oldfiles";
            opts = {
              # hl = "comment";
              keymap = [
                "n"
                "r"
                ":Telescope oldfiles <CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "r";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "󰈭  Find Word";
            on_press.raw = "require('telescope.builtin').live_grep";
            opts = {
              # hl = "comment";
              keymap = [
                "n"
                "g"
                ":Telescope live_grep <CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "g";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "  Restore Session";
            on_press.raw = "require('persistence').load()";
            opts = {
              # hl = "comment";
              keymap = [
                "n"
                "s"
                ":lua require('persistence').load()<cr>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "s";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "  Quit Neovim";
            on_press.__raw = "function() vim.cmd[[qa]] end";
            opts = {
              # hl = "comment";
              keymap = [
                "n"
                "q"
                ":qa<CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "q";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
        ];
      };
      luasnip = {
        enable = true;
        extraConfig = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
        };
      };
      gitblame.enable = true;
      nix.enable = true;
      lsp-format = { enable = true; };
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
          vuels = { enable = true; };
          nixd = { enable = true; };
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
