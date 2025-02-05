{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lsd
    bat
  ];

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

    plugins = [
      {
        name = "powerlevel10k-config";
        src = ./p10k-config;
        file = ".p10k.zsh";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ];

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
}
