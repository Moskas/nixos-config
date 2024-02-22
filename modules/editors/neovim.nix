{
  config,
  pkgs,
  nixvim,
  nixvim-config,
  ...
}: {
  imports = [nixvim.homeManagerModules.nixvim];

  home.packages = with pkgs; [
    nixvim-config.packages.${system}.default
  ];

  programs.nixvim = {
    enable = false;
    colorschemes.gruvbox.enable = true;
    plugins = {
      lualine = {
        enable = true;
        componentSeparators = {
          left = "|";
          right = "|";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };
      };
      treesitter.enable = true;
      indent-blankline.enable = true;
      nvim-autopairs.enable = true;
      which-key.enable = true;
      tmux-navigator.enable = true;
      floaterm = {
        enable = true;
        height = 0.8;
        width = 0.8;
      };
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
        fromVscode = [
          {
            lazyLoad = true;
            paths = "${pkgs.vimPlugins.friendly-snippets}";
          }
        ];
      };
      telescope = {
        enable = true;
        extensions = {fzf-native.enable = true;};
        keymaps = {
          "<leader><space>" = {
            action = "find_files, {}";
            desc = "Find project files";
          };
          "<leader>ff" = {
            action = "find_files, {}";
            desc = "Find project files";
          };
          "<leader>/" = {
            action = "live_grep";
            desc = "Grep (root dir)";
          };
          "<leader>:" = {
            action = "command_history, {}";
            desc = "Command History";
          };
          "<leader>fr" = {
            action = "oldfiles, {}";
            desc = "Recent";
          };
          "<leader>fb" = {
            action = "buffers, {}";
            desc = "Buffers";
          };
          "<leader>b" = {
            action = "buffers, {}";
            desc = "+buffer";
          };
          "<C-p>" = {
            action = "git_files, {}";
            desc = "Search git files";
          };
          "<leader>gc" = {
            action = "git_commits, {}";
            desc = "commits";
          };
          "<leader>gs" = {
            action = "git_status, {}";
            desc = "status";
          };
          "<leader>sa" = {
            action = "autocommands, {}";
            desc = "Auto Commands";
          };
          "<leader>sb" = {
            action = "current_buffer_fuzzy_find, {}";
            desc = "Buffer";
          };
          "<leader>sc" = {
            action = "command_history, {}";
            desc = "Command History";
          };
          "<leader>sC" = {
            action = "commands, {}";
            desc = "Commands";
          };
          "<leader>sD" = {
            action = "diagnostics, {}";
            desc = "Workspace diagnostics";
          };
          "<leader>sh" = {
            action = "help_tags, {}";
            desc = "Help pages";
          };
          "<leader>sH" = {
            action = "highlights, {}";
            desc = "Search Highlight Groups";
          };
          "<leader>sk" = {
            action = "keymaps, {}";
            desc = "Key maps";
          };
          "<leader>sM" = {
            action = "man_pages, {}";
            desc = "Man pages";
          };
          "<leader>sm" = {
            action = "marks, {}";
            desc = "Jump to Mark";
          };
          "<leader>so" = {
            action = "vim_options, {}";
            desc = "Options";
          };
          "<leader>sR" = {
            action = "resume, {}";
            desc = "Resume";
          };
          "<leader>uC" = {
            action = "colorscheme, {}";
            desc = "Colorscheme preview";
          };
        };
      };
      gitblame.enable = true;
      nix.enable = true;
      lsp-format = {enable = true;};
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
          vuels = {enable = true;};
          nixd = {enable = true;};
        };
      };
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
          {name = "luasnip";}
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
            modes = ["i" "s"];
          };
        };
      };
    };
    options = {number = true;};
    globals.mapleader = " ";
    keymaps = [
      {
        key = "<esc>";
        action = ":noh<return><esc>";
      }
    ];
    extraPlugins = with pkgs.vimPlugins; [formatter-nvim];
  };
}
