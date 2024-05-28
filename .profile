export VISUAL=/usr/bin/nvim
export EDITOR="$VISUAL"
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

source ~/.config/aliasrc

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
