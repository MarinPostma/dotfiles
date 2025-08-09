{ pkgs, nixvim, system, ...}:
{

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    fzf
    fd
    ripgrep

    # LSPs
    nixd
    jq
    wget

    (nixvim.legacyPackages.${system}.makeNixvim {

      viAlias = true;
      vimAlias = true;

      colorschemes.kanagawa = {
        enable = true;
        settings = {
          theme = "lotus";
        };
      };

      extraPlugins = with pkgs.vimPlugins; [
        rust-vim
        luasnip
        cmp_luasnip
        vim-floaterm
        vim-nix
      ];

      globals = {
        mapleader = " ";
      };

      keymaps = [
        {
          mode = "n";
          key = "<Right>";
          action = "<C-w>l";
        }
        {
          mode = "n";
          key = "<Left>";
          action = "<C-w>h";
        }
        {
          mode = "n";
          key = "<Down>";
          action = "<C-w>j";
        }
        {
          mode = "n";
          key = "<Up>";
          action = "<C-w>k";
        }
        {
          mode = "n";
          key = "<C-f>";
          action = "<cmd>lua require('fzf-lua').live_grep_glob()<cr>";
        }
        {
          mode = "n";
          key = "<C-p>";
          action = "<cmd>lua require('fzf-lua').files()<cr>";
        }
        {
          mode = "n";
          key = "<C-b>";
          action = "<cmd>lua require('fzf-lua').buffers()<cr>";
        }
        {
          mode = "n";
          key = "<leader>fs";
          action = "<cmd>NvimTreeToggle<cr>";
        }
        {
          mode = "n";
          key = "gd";
          action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        }
        {
          mode = "n";
          key = "ga";
          action = "<cmd>lua require('fastaction').code_action()<CR>";
        }
        {
          mode = "n";
          key = "K";
          action = "<cmd>lua vim.lsp.buf.hover() <CR>";
        }
        {
          mode = "n";
          key = "gre";
          action = "<cmd>lua vim.lsp.buf.references()<CR>";
        }
        {
          mode = "n";
          key = "grn";
          action = "<cmd>lua vim.lsp.buf.rename()<CR>";
        }
        {
          mode = "n";
          key = "<leader>n";
          action = "<cmd>cnext<CR>";
        }
        {
          mode = "n";
          key = "<leader>p";
          action = "<cmd>cprev<CR>";
        }
        {
          mode = "v";
          key = "<leader>ss";
          action = ":s/";
        }
        {
          mode = "n";
          key = "<leader>ss";
          action = ":%s/";
        }
        {
          mode = "n";
          key = "<leader>tt";
          action = ":FloatermToggle<cr>";
        }
        {
          mode = "t";
          key = "<leader>tt";
          action = "<C-\\><C-n>:FloatermToggle<CR>";
        }
        {
          mode = "n";
          key = "<leader>g";
          action = ":lua require('neogit').open()<CR>";
        }
        {
          mode = "n";
          key = "<leader>oo";
          action = ":lua require('oil').open()<CR>";
        }
      ];

      extraFiles = {
        "ftplugin/typescript.vim".text = ''
          set shiftwidth=2
          set tabstop=2
        '';
        "ftplugin/javascript.vim".text = ''
          set shiftwidth=2
          set tabstop=2
        '';
      "ftplugin/rust.lua".text = ''
          vim.keymap.set('n', '<leader>c', '<Cmd>make check<CR>', {silent = false })
      '';
      };

      extraConfigLua = ''
        vim.api.nvim_create_autocmd({ "BufWritePre" }, {
          pattern = { "*.rs" },
          callback = function()
            vim.lsp.buf.format { async = false}
          end
        })
        vim.api.nvim_create_autocmd({ "CursorHold" }, {
          pattern = "*",
          callback = function()
            for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
              if vim.api.nvim_win_get_config(winid).zindex then
                return
              end
            end
            vim.diagnostic.open_float({
              scope = "cursor",
              focusable = false,
              close_events = {
                "CursorMoved",
                "CursorMovedI",
                "BufHidden",
                "InsertCharPre",
                "WinLeave",
              },
            })
          end
        })
      '';

      performance.byteCompileLua.enable = true;

      opts = {
        updatetime=500;
        number = true;
        termguicolors = true;
        clipboard = "unnamedplus";
        swapfile = false;
        cursorline = true;
        mouse="";
      };

      plugins = {
        rustaceanvim = {
          enable = true;
          # rustAnalyzerPackage = null;
          settings.tools.hover_actions.replace_builtin_hover = true;
        };

        fastaction.enable = true;
        trouble.enable = true;

        cmp = {
          enable = true;
          settings = {
            mapping = {
              "<C-j>" = "cmp.mapping.select_next_item()";
              "<C-k>" = "cmp.mapping.select_prev_item()";
              "<CR>" = "cmp.mapping.confirm({ select = true })";
              "<C-space>" = "cmp.mapping.complete()";
            };

            snippet = {
              expand = "function(args) require('luasnip').lsp_expand(args.body) end";
            };
            sources = [
              { name = "nvim_lsp"; }
              { name = "path"; }
              { name = "buffer"; }
              { name = "luasnip"; }
            ];
          };

          cmdline = {
            "/" = {
              mapping = {
                __raw = "cmp.mapping.preset.cmdline()";
            };
            sources = [
              { name = "buffer"; }
            ];
          };
          ":" = {
              mapping = {
                __raw = "cmp.mapping.preset.cmdline()";
              };
              sources = [
                { name = "path"; }
                { 
                  name = "cmdline";
                  option = {
                    ignore_cmds = [
                      "Man"
                      "!"
                    ];
                  };
                }
              ];
            };
          };
        };


        luasnip = {
          enable = true;
          settings = {
            enable_autosnippets = true;
          };
        };

        cmp-buffer.enable = true;
        cmp-cmdline.enable = true;
        cmp-nvim-lsp.enable = true;
        cmp_luasnip.enable = true;

        lsp = {
          enable = true;
          inlayHints = true;
          servers = {
            nixd.enable = true;
            ruff.enable = true;
            ts_ls.enable = true;
            emmet_ls = {
              enable = true;
              filetypes = ["rust" "typescript" "typescriptreact"];
            };
            basedpyright.enable = true;
          };
        };

        nvim-autopairs.enable = true;
        nvim-surround.enable = true;
        neogit.enable = true;
        gitsigns = {
          enable = true;
          settings = {
            current_line_blame = true;
        };

        };
        nvim-tree.enable = true;
        oil = {
          enable = true;
          settings = {
            view_options = {
              show_hidden = true;
            };
          };
        };

        rainbow-delimiters.enable = true;
        gitlinker.enable = true;

        avante = {
          enable = true;
          settings = {
            claude = {
              endpoint = "https://api.anthropic.com";
              max_tokens = 4096;
              model = "claude-3-5-sonnet-20240620";
              temperature = 0;
            };
          };
        };

        treesitter = {
          enable = true;
          grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
            bash
            json
            lua
            markdown
            rust
            python
            nix
            javascript
            typescript
            toml
            yaml
            c
            wgsl
            just
          ];

          settings = {
            highlight.enable = true;
            indent.enable = true;
          };
        };

        web-devicons.enable = true;
        fzf-lua = {
          enable = true;
        };

      };

    })
  ];
}
