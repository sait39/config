source /home/demi/.local/antigen.zsh

antigen bundle jeffreytse/zsh-vi-mode

antigen apply


autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%c%{$fg[red]%}]%{$reset_color%}$%b "


HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history


autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.





setopt extendedglob
setopt nocaseglob
setopt rcexpandparam
setopt nocheckjobs
setopt numericglobsort
setopt nobeep
setopt appendhistory
setopt histignorealldups
setopt autocd
setopt inc_append_history

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
WORDCHARS=${WORDCHARS//\/[&.;]}



bindkey -e

bindkey '^[[C'  forward-char
bindkey '^[[D'  backward-char
bindkey '^[[5~' history-beginning-search-backward
bindkey '^[[6~' history-beginning-search-forward

bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word
bindkey '^[[Z' undo


autoload -U compinit colors zcalc
compinit -d
colors

export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

if [[ -r /usr/share/zsh/functions/command-not-found.zsh ]]; then
    source /usr/share/zsh/functions/command-not-found.zsh
    export PKGFILE_PROMPT_INSTALL_MISSING=1
fi

function title {
  emulate -L zsh
  setopt prompt_subst

  [[ "$EMACS" == *term* ]] && return

  : ${2=$1}

  case "$TERM" in
    xterm*|putty*|rxvt*|konsole*|ansi|mlterm*|alacritty|st*)
      print -Pn "\e]2;${2:q}\a"
      print -Pn "\e]1;${1:q}\a"
      ;;
    screen*|tmux*)
      print -Pn "\ek${1:q}\e\\"
      ;;
    *)
    if [[ -n "$terminfo[fsl]" ]] && [[ -n "$terminfo[tsl]" ]]; then
      echoti tsl
      print -Pn "$1"
      echoti fsl
    fi
      ;;
  esac
}

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<"
ZSH_THEME_TERM_TITLE_IDLE="%n@%m:%~"

function mzc_termsupport_precmd {
  [[ "${DISABLE_AUTO_TITLE:-}" == true ]] && return
  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}

function mzc_termsupport_preexec {
  [[ "${DISABLE_AUTO_TITLE:-}" == true ]] && return

  emulate -L zsh

  local -a cmdargs
  cmdargs=("${(z)2}")

  if [[ "${cmdargs[1]}" = fg ]]; then
    local job_id jobspec="${cmdargs[2]#%}"
    case "$jobspec" in
      <->)
        job_id=${jobspec} ;;
      ""|%|+)
        job_id=${(k)jobstates[(r)*:+:*]} ;;
      -)
        job_id=${(k)jobstates[(r)*:-:*]} ;;
      [?]*)
        job_id=${(k)jobtexts[(r)*${(Q)jobspec}*]} ;;
      *)
        job_id=${(k)jobtexts[(r)${(Q)jobspec}*]} ;;
    esac

    if [[ -n "${jobtexts[$job_id]}" ]]; then
      1="${jobtexts[$job_id]}"
      2="${jobtexts[$job_id]}"
    fi
  fi

  local CMD=${1[(wr)^(*=*|sudo|ssh|mosh|rake|-*)]:gs/%/%%}
  local LINE="${2:gs/%/%%}"

  title '$CMD' '%100>...>$LINE%<<'
}

autoload -U add-zsh-hook
add-zsh-hook precmd mzc_termsupport_precmd
add-zsh-hook preexec mzc_termsupport_preexec

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"



function zvm_after_init() {
	[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
	[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

	[ -f "/usr/share/fzf/key-bindings.zsh" ] && source "/usr/share/fzf/key-bindings.zsh"
	[ -f "/usr/share/fzf/completion.zsh" ] && source "/usr/share/fzf/completion.zsh"

	[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}


# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
