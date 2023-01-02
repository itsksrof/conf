# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Enabled theme
ZSH_THEME="lambda-gitster"

# Enabled plugins
plugins=( git z jsontools history zsh-syntax-highlighting zsh-autosuggestions fzf zsh-shift-select )

source $ZSH/oh-my-zsh.sh

# Golang version manager
[[ -s "/home/ksrof/.gvm/scripts/gvm" ]] && source "/home/ksrof/.gvm/scripts/gvm"

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
