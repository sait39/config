export VISUAL=/usr/bin/nvim
export EDITOR="$VISUAL"
export QT_QPA_PLATFORMTHEME="gtk3"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export TERMINAL="st"
export BROWSER="chromium"
export ZDOTDIR="$HOME/.config/zsh"
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

export PATH=~/.config/composer/vendor/bin:~/.local/bin:~/go/bin:~/.local/bin/npm-global/bin:$PATH

export QT_QPA_PLATFORMTHEME=gtk2
