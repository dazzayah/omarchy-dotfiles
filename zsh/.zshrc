# The zshrc file, tweak here
# Alias

alias pbcopy="wl-copy"
alias pbpaste="wl-paste"

# Oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(
  git
  sudo
  zsh-autosuggestions
  zsh-syntax-highlighting
  you-should-use
  zsh-bat
)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1
source $ZSH/oh-my-zsh.sh

# Omarchy functions translated to ZSH (sorta)
if [ -f ~/.config/zsh/rc ]; then
  source ~/.config/zsh/rc
fi

# Starship (must be loaded at the end)
eval "$(starship init zsh)"
