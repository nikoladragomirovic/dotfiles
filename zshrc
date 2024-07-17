export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable git svn

zstyle ':vcs_info:git*' formats "%b "

precmd() {
    vcs_info
}

setopt prompt_subst

prompt=' %F{208}%1~%f %F{7}${vcs_info_msg_0_}%f'

alias start-ac="sh ~/.start-ac.sh"
alias lt='f() { eza -T -L=$1 }; f'
alias lta='f() { eza -Ta -L=$1 }; f'
