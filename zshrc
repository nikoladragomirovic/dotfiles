# OH MY POSH + CUSTOM THEME
eval "$(oh-my-posh init zsh --config ~/.nile.omp.json)"

# OH MY ZSH
export ZSH="$HOME/.oh-my-zsh"

# OH MY ZSH PLUGINS
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

# FUZZY FIND FILES
alias fif="fuzzy_find_files"

fuzzy_find_files() {
    rg --color=always --line-number --no-heading --smart-case "${*:-}" |
      fzf-tmux --ansi \
          --color "hl:-1:underline,hl+:-1:underline:reverse" \
          --delimiter : \
          --preview 'batcat --color=always {1} --highlight-line {2}' \
          --preview-window 'right,70%,border-left,+{2}+3/3,~3' \
          --bind 'enter:become(phpstorm --line {2} {1})' \
          --with-nth=1
}

# USE EZA INSTEAD OF LS
alias l='eza -bGF --hyperlink --header --git --color=always --group-directories-first --icons'
alias ls='eza --hyperlink --color=always --group-directories-first --icons'
alias ll='eza -ll --hyperlink --icons --octal-permissions --group-directories-first'
alias la='eza -la --hyperlink --icons --octal-permissions --group-directories-first'
alias lt='eza --tree --hyperlink --level=2 --color=always --group-directories-first --icons'
alias llm='eza -lbGd --hyperlink --header --git --sort=modified --color=always --group-directories-first --icons'

# FUZZY CHANGE DIRECTORY
fuzzy_change_directory() {
  local dir
  local dir_list

  dir_list=$(eza -lD -1)

  if [ -z "$dir_list" ]; then
    echo "No directories found."
    return 0
  fi

  dir=$(echo "$dir_list" | fzf)

  cd "$dir"
}

alias cz="fuzzy_change_directory"

# ADD PADDING AROUND EVERY COMMAND
preexec(){
  echo
}

precmd(){
  precmd(){
    echo
  }
}