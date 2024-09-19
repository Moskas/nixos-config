{ nixvim, config, ... }:
{
  imports = [ nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    globals = {
      mapleader = " ";
    };
    plugins = {
      autoclose.enable = true;
      crates-nvim.enable = true;
      lsp-format.enable = true;
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
        };
      };
      lualine = {
        enable = true;
        alwaysDivideMiddle = true;
        ignoreFocus = [ "neo-tree" ];
        extensions = [ "fzf" ];
        componentSeparators = {
          left = "|";
          right = "|";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };
        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [
            "branch"
            "diff"
            "diagnostics"
          ];
          lualine_c = [ "filename" ];
          lualine_x = [ "filetype" ];
          lualine_y = [ "progress" ];
          lualine_z = [ ''" " .. os.date("%R")'' ];
        };
      };
      persistence.enable = true;
      alpha = {
        enable = true;
        theme = null;
        iconsEnabled = true;
        layout =
          let
            padding = val: {
              type = "padding";
              inherit val;
            };
          in
          [
            (padding 4)
            {
              opts = {
                hl = "AlphaHeader";
                position = "center";
              };
              type = "text";
              val = [
                " =================     ===============     ===============   ========  ======== "
                " \\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . // "
                " ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .|| "
                " || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . || "
                " ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .|| "
                " || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . || "
                " ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .|| "
                " || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . || "
                " ||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.|| "
                " ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `|| "
                " ||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   || "
                " ||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   || "
                " ||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   || "
                " ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   || "
                " ||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   || "
                " ||.=='    _-'                                                     `' |  /==.|| "
                " =='    _-'                                                            \\/   `== "
                " \\   _-'                                                                `-_   / "
                "  `''                                                                      ``'  "
                #"				     N E O V I M					   "
                #"            	      git@github.com:Moskas/nixvim-config         	           "
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
      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
          file-browser.enable = true;
        };
        keymaps = {
          "<leader><space>" = {
            action = "find_files";
            # desc = "Find project files";
          };
          "<leader>ff" = {
            action = "find_files";
            # desc = "Find project files";
          };
          "<leader>/" = {
            action = "live_grep";
            # desc = "Grep (root dir)";
          };
          "<leader>:" = {
            action = "command_history";
            # desc = "Command History";
          };
          "<leader>fr" = {
            action = "oldfiles";
            # desc = "Recent";
          };
          "<leader>fb" = {
            action = "buffers";
            # desc = "Buffers";
          };
          #"<leader>b" = {
          #  action = "buffers";
          #  # desc = "+buffer";
          #};
          "<C-p>" = {
            action = "git_files";
            # desc = "Search git files";
          };
          "<leader>gc" = {
            action = "git_commits";
            # desc = "commits";
          };
          "<leader>gs" = {
            action = "git_status";
            # desc = "status";
          };
          "<leader>sa" = {
            action = "autocommands";
            # desc = "Auto Commands";
          };
          "<leader>sb" = {
            action = "current_buffer_fuzzy_find";
            # desc = "Buffer";
          };
          "<leader>sc" = {
            action = "command_history";
            # desc = "Command History";
          };
          "<leader>sC" = {
            action = "commands";
            # desc = "Commands";
          };
          "<leader>sD" = {
            action = "diagnostics";
            # desc = "Workspace diagnostics";
          };
          "<leader>sh" = {
            action = "help_tags";
            # desc = "Help pages";
          };
          "<leader>sH" = {
            action = "highlights";
            # desc = "Search Highlight Groups";
          };
          "<leader>sk" = {
            action = "keymaps";
            # desc = "Key maps";
          };
          "<leader>sM" = {
            action = "man_pages";
            # desc = "Man pages";
          };
          "<leader>sm" = {
            action = "marks";
            # desc = "Jump to Mark";
          };
          "<leader>so" = {
            action = "vim_options";
            # desc = "Options";
          };
          "<leader>sR" = {
            action = "resume";
            # desc = "Resume";
          };
          "<leader>uC" = {
            action = "colorscheme";
            # desc = "Colorscheme preview";
          };
        };
      };
    };
    extraConfigLua = ''
      require('lualine').setup {
        extensions = { 'toggleterm'}
        }
    '';

    colorschemes.base16 = {
      enable = true;
      colorscheme = {
        base00 = "#${config.colorScheme.palette.base00}";
        base01 = "#${config.colorScheme.palette.base01}";
        base02 = "#${config.colorScheme.palette.base02}";
        base03 = "#${config.colorScheme.palette.base03}";
        base04 = "#${config.colorScheme.palette.base04}";
        base05 = "#${config.colorScheme.palette.base05}";
        base06 = "#${config.colorScheme.palette.base06}";
        base07 = "#${config.colorScheme.palette.base07}";
        base08 = "#${config.colorScheme.palette.base08}";
        base09 = "#${config.colorScheme.palette.base09}";
        base0A = "#${config.colorScheme.palette.base0A}";
        base0B = "#${config.colorScheme.palette.base0B}";
        base0C = "#${config.colorScheme.palette.base0C}";
        base0D = "#${config.colorScheme.palette.base0D}";
        base0E = "#${config.colorScheme.palette.base0E}";
        base0F = "#${config.colorScheme.palette.base0F}";
      };
    };
  };
}
