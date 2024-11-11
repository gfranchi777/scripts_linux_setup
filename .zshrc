if [[ -f ~/.zsh_variables ]]; then
  . ~/.zsh_variables
fi

if [[ -f ~/.zsh_aliases ]]; then
  . ~/.zsh_aliases
fi

if [[ -f ~/.zsh_functions ]]; then
  . ~/.zsh_functions
fi

# Get a random quote and display it to the terminal
get-random-quote
