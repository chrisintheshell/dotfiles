# ZSH Path
export ZSH="$HOME/.oh-my-zsh"

#Theme
ZSH_THEME=""

# Customizations
ZSH_CUSTOM=$HOME/.zsh_custom

# Plugins
plugins=(git tmux-notify)

source $ZSH/oh-my-zsh.sh

# User configuration
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# Starship
eval "$(starship init zsh)"

# Amp CLI
export PATH="/Users/cjones/.amp/bin:$PATH"

# UV
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
