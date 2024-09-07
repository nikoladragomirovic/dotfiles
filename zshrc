# OH MY POSH + CUSTOM THEME
eval "$(oh-my-posh init zsh --config ~/.nile.omp.json)"

# OH MY ZSH
export ZSH="$HOME/.oh-my-zsh"

# OH MY ZSH PLUGINS
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

# USE EZA INSTEAD OF LS
alias ls='eza --hyperlink --color=always --group-directories-first --icons'
alias ll='eza -ll --hyperlink --icons --octal-permissions --group-directories-first'
alias la='eza -la --hyperlink --icons --octal-permissions --group-directories-first'
alias lt='eza --tree --hyperlink --level=2 --color=always --group-directories-first --icons'

# ADD PADDING AROUND EVERY COMMAND
preexec(){
  echo
}

precmd(){
  precmd(){
    echo
  }
}
