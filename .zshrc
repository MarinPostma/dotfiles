ZSH_THEME="robbyrussell"

plugins=(git cargo)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export GPG_TTY=$(tty)
# start tmux
if [[ $DISPLAY ]]; then
    # If not running interactively, do not do anything
    [[ $- != *i* ]] && return
    [[ -z "$TMUX" ]] && exec tmux
fi

source $HOME/.cargo/env
export EDITOR=/usr/bin/nvim
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/opt/cuda/bin:$PATH

export FZF_DEFAULT_COMMAND='fd --type f'

# Path to your oh-my-zsh installation.
export ZSH="/home/mpostma/.oh-my-zsh"
alias http="xh"

plugins=(git cargo)


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vim="nvim"
alias gs=" git --no-pager log --oneline --decorate -8; git status"
alias gc="git commit"
alias msg="git commit -m"
alias gp="git push"
alias ls="lsd"


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit light zdharma/fast-syntax-highlighting
zinit snippet https://github.com/sainnhe/edge/raw/master/zsh/.zsh-theme-edge-dark
zinit light zsh-users/zsh-autosuggestions
zinit light romkatv/powerlevel10k

source $ZSH/oh-my-zsh.sh
