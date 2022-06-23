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
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export NVM_DIR="$HOME/.nvm"

typeset -U path
path=(
    $path
)
export PATH

#-------------------------------------------------------------------------------
# ALIAS
#-------------------------------------------------------------------------------
alias vim="nvim"
alias cat="bat"
alias ls="ls -al"
alias t="tree"
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"
# Patch file(s) in the working area and add to staging area
alias gap="git add --patch"
# Patch file(s) in the working area/staging area and commit to the repository
alias gcp="git commit --patch"
# Undo and redo last commit with * in staging area
alias gca="git commit --amend"
alias gc="git commit"
# Create new branch from current commit and move HEAD to new branch
alias gcb="git checkout --branch"
# Move all files (untracked as well) in the working area and the staging area to the stash
alias gs="git stash --include-untracked"
# Move * from the stash to the working area and the staging area
alias gsa="git stash apply --index"
alias gsl="git stash list"
alias gsc="git stash clear"
# Compare the working area with the staging area
alias gdw="git diff"
# Compare the staging area with the repository
alias gds="git diff --cached"
# Move file from the staging area to the working area (unstage)
alias guf="git rm --cached -r"
# List all branches (local and remote)
alias gb="git branch --all"
# Show output in short format
alias gs="git status --short"
# Show commits that would get added if b was merged into a 
#TODO = log <branch-a>..<branch-b> --oneline
# Rebase * interactive
alias gri="git rebase --interactive"


#-------------------------------------------------------------------------------
# REVEAL ALIAS
# https://dev.to/equiman/reveal-the-command-behind-an-alias-with-zsh-4d96
#-------------------------------------------------------------------------------

local cmd_alias=""

# Reveal Executed Alias
alias_for() {
  [[ $1 =~ '[[:punct:]]' ]] && return
  local search=${1}
  local found="$( alias $search )"
  if [[ -n $found ]]; then
    found=${found//\\//} # Replace backslash with slash
    found=${found%\'} # Remove end single quote
    found=${found#"$search='"} # Remove alias name
    echo "${found} ${2}" | xargs # Return found value (with parameters)
  else
    echo ""
  fi
}

expand_command_line() {
  first=$(echo "$1" | awk '{print $1;}')
  rest=$(echo ${${1}/"${first}"/})

  if [[ -n "${first//-//}" ]]; then # is not hypen
    cmd_alias="$(alias_for "${first}" "${rest:1}")" # Check if there's an alias for the command
    if [[ -n $cmd_alias ]]; then # If there was
      echo "${T_GREEN}❯ ${T_YELLOW}${cmd_alias}${F_RESET}" # Print it
    fi
  fi
}

pre_validation() {
  [[ $# -eq 0 ]] && return                    # If there's no input, return. Else...
  expand_command_line "$@"
}

autoload -U add-zsh-hook                      # Load the zsh hook module. 
add-zsh-hook preexec pre_validation 

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

# https://github.com/junegunn/fzf#using-homebrew
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# https://formulae.brew.sh/formula/nvm
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# https://github.com/starship/starship#step-2-setup-your-shell-to-use-starship
eval "$(starship init zsh)"

# https://github.com/Homebrew/homebrew-core/blob/master/Formula/zsh-syntax-highlighting.rb#L30-L35
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# https://github.com/Homebrew/homebrew-core/blob/master/Formula/zsh-autosuggestions.rb#L21-L25
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
