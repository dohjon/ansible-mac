#-------------------------------------------------------------------------------
# HISTORY
#-------------------------------------------------------------------------------
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

#-------------------------------------------------------------------------------
# OPTIONS
#-------------------------------------------------------------------------------
setopt AUTO_CD
setopt GLOBDOTS

unsetopt CASE_GLOB

#-------------------------------------------------------------------------------
# VARIABLES
#-------------------------------------------------------------------------------

export VISUAL="$(which code)"
export EDITOR="$VISUAL"

typeset -U path
path=(
    $path
)
export PATH

#-------------------------------------------------------------------------------
# ADVANCED TAB-COMPLETION 
#-------------------------------------------------------------------------------
autoload -Uz compinit

# <TAB> matches both X and x
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'no matches for: %d'
zstyle ':completion:*' group-name ''

compinit

#-------------------------------------------------------------------------------
# VIM
#-------------------------------------------------------------------------------

# vi mode
bindkey -v

# ci ' " `    
autoload -Uz select-quoted
zle -N select-quoted
for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
        bindkey -M $m $c select-quoted
    done
done

# ci ( [ { <
autoload -Uz select-bracketed
zle -N select-bracketed
for m in visual viopp; do
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $m $c select-bracketed
    done
done

# surrounds
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd 'cs' change-surround
bindkey -M vicmd 'ds' delete-surround
bindkey -M vicmd 'ys' add-surround
bindkey -M visual 'S' add-surround

# vi navigation keys in tab completion menu
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

#-------------------------------------------------------------------------------
# SHOULD BE LOADED LAST
#-------------------------------------------------------------------------------
# https://github.com/Homebrew/homebrew-core/blob/master/Formula/zsh-syntax-highlighting.rb#L30-L35
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
