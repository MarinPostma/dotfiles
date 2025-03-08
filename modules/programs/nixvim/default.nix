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
      colorschemes.catppuccin = {
        enable = true;
        settings = {
          dim_inactive = {
            enabled = true;
            shade = "dark";
            percentage = 0.15;
          };
          styles = {
            comments = [ "italic" ];
            loops = [ "bold" ];
            functions = [ "bold" ];
            confitionals = [ "bold" ];
            types = [ "bold" ];
          };
          flavour = "mocha";
          integration = {
            cmp = true;
            gitsigns = true;
            nvimtree = true;
            treesitter = true;
          };
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
          action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
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
          key = "<leader>bl";
          action = ":Gitsigns blame_line<CR>";
        }
        {
          mode = "n";
          key = "<leader>bl";
          action = ":Gitsigns blame_line<CR>";
        }
        {
          mode = "n";
          key = "<leader>g";
          action = ":lua require('neogit').open()<CR>";
        }
      ];

      performance.byteCompileLua.enable = true;

      opts = {
        number = true;
        termguicolors = true;
        clipboard = "unnamedplus";
        swapfile = false;
        cursorline = true;
      };

      plugins = {
        rustaceanvim.enable = true;
        cmp.enable = true;
        cmp-buffer.enable = true;
        cmp-cmdline.enable = true;
        cmp-nvim-lsp.enable = true;

        lsp = {
          enable = true;
          inlayHints = true;
          servers = {
            nixd.enable = true;
            ruff.enable = true;
            ts_ls.enable = true;
            emmet_ls.enable = true;
          };
        };

        nvim-autopairs.enable = true;
        nvim-surround.enable = true;
        neogit.enable = true;
        gitsigns.enable = true;
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
