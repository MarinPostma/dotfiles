{ config, pkgs, xmonad-contexts, ... }:

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
        "nvim/lua".source = ../../../nvim/lua;
        "nvim/init.lua".source = ../../../nvim/init.lua;
    };

    programs.neovim = {
        enable = true;

        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
    };

    programs.alacritty = {
        enable = true;
        settings = {
            font = {
                normal = {
                    family = "JetBrainsMono Nerd Font Mono";
                    style = "normal";
                };
            };
        };
    };

    home.file.".xinitrc".text = ''
        exec xmonad
    '';

    services.gnome-keyring.enable = true;

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
                { name = "plugins/git"; tags = [ from:oh-my-zsh ]; }
                { name = "plugins/rust"; tags = [ from:oh-my-zsh ]; }
                { name = "plugins/fzf"; tags = [ from:oh-my-zsh ]; }
            ];
        };
    };
    programs.p10k.enable = true;
    programs.home-manager.enable = true;
}
