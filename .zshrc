export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git kubectl thefuck sudo podman)

source $ZSH/oh-my-zsh.sh
source ${HOME}/.shell_path
source ${HOME}/.shell_env
source ${HOME}/.shell_alias
source ${HOME}/.shell_fn

if [ -f "${HOME}/.proxy_settings" ]; then
	source ${HOME}/.proxy_settings
fi

if [ -d "$CARGO_HOME/bin" ]; then
    export PATH="$CARGO_HOME/bin:$PATH"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
