#
# Main
#

# Load brew completion definitions before Prezto & compinit.
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source iTerm2 Shell Integration.
if [[ -s "${HOME}/.iterm2_shell_integration.zsh" ]]; then
  source ${HOME}/.iterm2_shell_integration.zsh
fi

# Initialize brew.
source /usr/local/bin/brew_init

# Load extra tab-completions.
[ -f ~/.config/tabtab/zsh/__tabtab.zsh ] && source ~/.config/tabtab/zsh/__tabtab.zsh

#
# ZSH
#

# Increase history size.
export HISTSIZE=100000
export SAVEHIST=${HISTSIZE}

# Add a key binding (Ctrl + Space) to accept suggestions.
bindkey '^ ' autosuggest-accept

# Expand aliases after sudo instead of only checking the first word of a command for an alias.
alias sudo='sudo '

# Reload Zsh.
alias rr='exec zsh'

# Edit zshrc in VS Code.
alias al='c ~/.zshrc'

#
# Navigation
#

# Changes the current working directory using fasd.
alias d='fasd_cd'

# Navigate to the previous directory.
alias -- -='cd -'

# Navigate to various common directories.
alias db='cd ~/Dropbox'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias wk='cd ~/Projects'
alias tmp='cd ~/Temp'
alias ss='cd ~/Pictures/Screenshots'

# Navigate to the dotfiles repository.
alias dotfiles='wk && cd dotfiles'

#
# Editors
#

# Alias common editors.
alias vim='nvim'
alias c='code'
alias n='nvim'
alias v='nvim'

# Compare two files using VS Code.
alias cdiff='c -n -d'

#
# Miscellaneous
#

# Use GNU grep instead of BSD grep.
alias grep='ggrep'

# Alias ps.
alias psa='ps aux'
alias psg='ps aux | grep -i'

# Alias ls.
alias l='ll'
alias lsg='ll | grep -i'

# Override ls commands to use exa.
alias ls='exa -a -l --git --no-user'
alias l='ls'
alias ll='exa -a -l --git -g'
alias lst='ls -T -L 2'
alias lsgit='ls --git-ignore'

# Use the verbose mode for cp & mv.
alias cp='cp -v'
alias mv='mv -v'

# Override some default commands.
alias cat='bat -p --theme ansi'
alias ping='prettyping'
alias rm='trash'

# Add colors to tree.
alias tree='tree -C'

# Add a native rm fallback.
alias rmi='command rm -i'

# Clear & list the current directory.
alias cls='clear; ls'

# Launch a new VLC instance.
alias vvlc='open -n /Applications/VLC.app'

# Start Streamlink.
alias lv='streamlink'

# Remove the last added file in the ~/Downloads directory if it matches a set of extensions.
dlrm() {
  validExtensions=("avi" "mkv")

  dl
  file=($(ls -tU | head -n1))
  extension="${file##*.}"

  for ext in "${validExtensions[@]}"
  do
      if [ "$ext" = "$extension" ] ; then
          rm "$file"

          echo "Deleted ${file}"

          break
      fi
  done

  cd - > /dev/null
}

#
# macOS
#

# Use Homebrew’s Python 3.
alias python='python3'

# Configure the Homebrew Cask application directory.
export HOMEBREW_CASK_OPTS='--appdir=/Applications'

# Update various parts of the system.
alias update_os='sudo softwareupdate -i -a'
alias update_brew='brew -v update; brew upgrade; brew cleanup --prune=30; brew doctor'
alias update_npm='npmgu'
alias update_yarn='yarn global upgrade --latest'
alias update_prezto='zprezto-update'
alias update_all='update_os; update_brew; update_npm; update_yarn; update_prezto'

# Update npm global packages.
function npmgu() {
  for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f4)
  do
      npm -g --force install "$package"
  done
}

# Empty trashes on all mounted volumes, the trash of the main disk & Apple's System Logs.
alias empty='sudo \rm -rfv /Volumes/*/.Trashes; sudo \rm -rfv ~/.Trash; sudo \rm -rfv /private/var/log/asl/*.asl'

# Remove quarantine on a specific element.
alias unquarantine='xattr -r -d com.apple.quarantine'

# Approve a specific element from an unidentified developer via the system-wide assessment rule database.
alias approve='spctl --add --label "Approved"'

#
# Internet
#

# Get external IPv4.
alias ip='\dig +short -4 myip.opendns.com @resolver1.opendns.com'

# Start a Proxy Socks v5.
alias proxy='ssh -C2qTnN -D 8282'

# Alias dig to dog.
alias dig='dog'

# Edit the hosts file.
alias hosts='sudo $EDITOR /etc/hosts'

#
# Dev
#

# URL-encode a string.
alias urlencode='python -c "import sys, urllib.parse as ul; print(ul.quote_plus(sys.argv[1]));"'

# Ssh to Zoidberg.
alias zoid='ssh zoidberg'

# Alias ripgrep.
alias rg='rg --smart-case --colors "path:fg:green" --colors "path:style:bold" --colors "line:fg:yellow" --colors "line:style:bold" --colors "match:fg:magenta"'
alias rgc='rg --context 2'

# Extract an asar archive to a specific fodler.
alias unasar='npx asar extract'

# Configure Go.
export GOPATH="$HOME/.go"

#
# Fzf
#

# Add fzf default key bindings.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add custom key bindings.
bindkey '^[OP' fzf-cd-widget

export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_OPTS="--color=hl:13,hl+:13,fg:#7f7e80,fg+:15,pointer:9,info:11,bg+:#3a3e50"

# Add custom Ctrl-R widget that can executes commands when pressing Ctrl-X.
fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail 2> /dev/null
  selected=( $(fc -rl 1 |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort --expect=ctrl-x $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
    local accept=0
    if [[ $selected[1] = ctrl-x ]]; then
      accept=1
      shift selected
    fi
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
      [[ $accept = 1 ]] && zle accept-line
    fi
  fi
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return 0
}

#
# Git
#

# Navigate automatically to a git cloned directory.
git() {
  if [ "$1" = clone ] ; then
    command git clone $2
    cd $(basename $2 | sed 's/.git$//')
  else
    command git "$@"
  fi
}

# Delete git local branches which have already been merged into the current HEAD.
alias gitcleanup='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Switch to the main branch, pull-prune the latest changes and delete the previous branch.
gitdone() {
  branch=($(git rev-parse --abbrev-ref HEAD))

  command git main && git pp && git branch -d ${branch}
}

# Create a new PR.
alias npr='gh pr create --body ""'

#
# Node
#

# Configure the Node REPL.
export NODE_REPL_HISTORY_SIZE='10000';

# Lazy-load fnm.
eval "$(fnm env)"

# Configure pnpm.
export PNPM_HOME="$HOME/Library/pnpm"

path=(
  $PNPM_HOME
  $path
)

# Bump version numbers.
# https://github.com/antfu/bumpp
# https://github.com/JS-DevTools/version-bump-prompt
alias bump='pnpx bumpp --commit "v"'
