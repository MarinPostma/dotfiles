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
          action = "<cmd>lua vim.lsp.buf.hover()<CR>";
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
          action = ":<C-\\><C-n>:FloatermToggle<CR>";
        }
        {
          mode = "n";
          key = "<leader>g";
          action = ":lua require('neogit').open()<CR>";
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
      };

      performance.byteCompileLua.enable = true;

      opts = {
        number = true;
        termguicolors = true;
        clipboard = "unnamedplus";
        swapfile = false;
        cursorline = true;
        mouse="";
      };

      plugins = {
        rustaceanvim.enable = true;

        fastaction.enable = true;

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
            emmet_ls.enable = true;
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

        lsp-lines.enable = true;
        rainbow-delimiters.enable = true;
        gitlinker.enable = true;

        avante.enable = true;

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
