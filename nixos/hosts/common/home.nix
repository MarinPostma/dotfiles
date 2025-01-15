{ config, pkgs, ... }:

{
  imports = [
    ./../../modules/default.nix
  ];
  home.username = "adhoc";
  home.homeDirectory = "/home/adhoc";
  home.stateVersion = "24.11"; # Please read the comment before changing.
  home.packages = with pkgs; [ ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  xdg.configFile = {
    nvim = {
      source = ../../../nvim;
      recursive = true;
      force = true;
    };
  };

  programs.git = {
    enable = true;
    userName = "adhoc";
    userEmail = "postma.marin@protonmail.com";
  };

  home.file.".cargo/config.toml".source = ../../../cargo-config.toml;

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 10;
          y = 10;
        };
      };
      font = {
        size = 13.0;
        normal = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "normal";
        };
      };
    };
  };

  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ../../../tmux.conf;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      grep="rg";
      ls="lsd";
      http="xh";
      vim="nvim";
      vi="nvim";
      gs="git --no-pager log --oneline -n10 && git status";
      cat="bat";
      gane="git commit -a --amend --no-edit";
      cr="cargo run";
      crr="cargo run --release";
      ct="cargo test";
      gwa="git worktree add";
      gwr="git worktree remove";
      gwl="git worktree list";
      gw="git worktree";
      gwc="git worktree list | fzf -m | awk {print $1} | xargs -I _ git worktree remove -f _";
      py="python3";
    };

    oh-my-zsh = {
      enable = true;
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "nix-community/nix-zsh-completions"; }
        { name = "plugins/git"; tags = [ from:oh-my-zsh ]; }
        { name = "plugins/rust"; tags = [ from:oh-my-zsh ]; }
        { name = "plugins/fzf"; tags = [ from:oh-my-zsh ]; }
      ];
    };
  };
  programs.p10k.enable = true;
  programs.home-manager.enable = true;
}
