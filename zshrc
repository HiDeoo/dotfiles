# Use .zhistory instead of .zsh_history.
# This is a workaround to use on macOS Catalina an old history file created on macOS Mojave.
# See: https://github.com/sorin-ionescu/prezto/issues/1744
export HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"

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

#
# ZSH
#

# Set the system locale.
export LANG=en_US.UTF-8

# Add a key binding to accept suggestions.
bindkey '^ ' autosuggest-accept

# Expand aliases after sudo instead of only checking the first word of a command for an alias.
alias sudo='sudo '

# Reload Zsh.
alias rr='exec zsh'

# Edit zshrc in VS Code.
alias al='c ~/.zshrc'

# Remove unused aliases.
unalias lc

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
alias wk='cd ~/Work'
alias tmp='cd ~/tmp'

# Navigate to the Toaster volume.
alias toaster='cd /Volumes/Toaster'

# Navigate to the dotfiles repository.
alias dotfiles='db && cd Work/dotfiles'

#
# Editors
#

# Alias common editors.
alias c='code'
alias v='vim'

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

# Use the verbose mode for cp & mv.
alias cp='cp -v'
alias mv='mv -v'

# Override some default commands.
alias cat='bat'
alias ping='prettyping'
alias rm='trash'

# Clear & list the current directory.
alias cls='clear; ls'

# Launch a new VLC instance.
alias vvlc='open -n /Applications/VLC.app'

# Start Streamlink.
alias lv='streamlink --twitch-low-latency'

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

# Use Python 3 as Python 2 is deprecated (even if not removed yet from macOS).
alias python='python3'

# Configure the Homebrew Cask application directory.
export HOMEBREW_CASK_OPTS='--appdir=/Applications'

# Update various parts of the system.
alias update_os='sudo softwareupdate -i -a'
alias update_brew='brew -v update; brew upgrade; brew cleanup --prune=30; brew doctor'
alias update_npm='npmgu'
alias update_yarn='yarn global upgrade --latest'
alias update_gem='sudo gem update --system; sudo gem update'
alias update_pip='pip install -U pip; sudo -H pip-review --auto'
alias update_prezto='cd ~/.zprezto && git pull && git submodule update --init --recursive && cd -'
alias update_all='update_os; update_brew; update_npm; update_yarn; update_prezto'

# Update npm global packages.
function npmgu() {
  for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f4)
  do
      npm -g --force install "$package"
  done
}

# Clean LaunchServices.
alias lscleanup='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'

# Empty trashes on all mounted volumes, the trash of the main disk & Apple's System Logs.
alias empty='sudo \rm -rfv /Volumes/*/.Trashes; sudo \rm -rfv ~/.Trash; sudo \rm -rfv /private/var/log/asl/*.asl'

# Remove quarantine on a specific element.
alias unquarantine='xattr -r -d com.apple.quarantine'

# Approve a specific element from an unidenfied developer via the system-wide assessment rule database.
alias approve='spctl --add --label "Approved"'

#
# Internet
#

# Get external IPv4.
alias ip='dig +short -4 myip.opendns.com @resolver1.opendns.com'

# Flush Directory Service cache.
alias flush='dscacheutil -flushcache && killall -HUP mDNSResponder'

# Start a Proxy Socks v5.
alias proxy='ssh -C2qTnN -D 8282'

# Add default options to dig.
alias dig='dig +nocmd any +multiline +noall +answer'

# Edit the hosts file.
alias hosts='sudo $EDITOR /etc/hosts'

#
# Dev
#

# URL-encode a string.
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Delete git local branches which have already been merged into the current HEAD.
alias gitcleanup='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Ssh to Zoidberg.
alias zoid='ssh zoidberg'

# Alias The Silver Searcher.
alias ag='ag --color-line-number "1;93" --color-match "1;95" --color-path "1;92"'
alias agc='ag -C'

#
# Fzf
#

# Add fzf default key bindings.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add custom key bindings.
bindkey '^[OP' fzf-cd-widget

# Configure various options.
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

#
# Node
#

# Configure the Node REPL.
export NODE_REPL_HISTORY=~/.node_history;
export NODE_REPL_HISTORY_SIZE='10000';

# Lazy-load fnm.
eval "$(fnm env --multi)"
