export VISUAL=/usr/bin/nvim
export EDITOR="$VISUAL"
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

source ~/.config/aliasrc
