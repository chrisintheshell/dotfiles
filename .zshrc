# ZSH Path
export ZSH="$HOME/.oh-my-zsh"

#Theme
ZSH_THEME=""

# Plugins
plugins=(git tmux-notify)

source $ZSH/oh-my-zsh.sh

# User configuration
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='zed --wait'
else
  export EDITOR='nvim'
fi

# Starship
eval "$(starship init zsh)"
