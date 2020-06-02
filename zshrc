autoload -U compinit && compinit
autoload -Uz colors && colors

setopt globdots
setopt nobeep
setopt no_bg_nice
setopt alwaystoend
setopt hist_ignore_all_dups inc_append_history

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export EDITOR="vim"
export HOMEBREW_AUTO_UPDATE_SECS=600000
export HOMEBREW_NO_COLOR=1
export HOMEBREW_NO_EMOJI=1
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LESS="-F -X -R"
export PAGER="less -R"
export VISUAL="$EDITOR"

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' insert-tab pending
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

git_branch() {
  GIT_BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null) || return
  [ -n "$GIT_BRANCH" ] && echo "$GIT_BRANCH "
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
which rbenv >/dev/null && eval "$(rbenv init -)"

# to make vim behave under xterm
stty -ixon

git_branch_color() {
  echo "%{$fg_bold[white]%}"
}

precmd() {
  if [ -z $SSH_CONNECTION ]; then
    PROMPT="%c $(git_branch_color)$(git_branch)%{$reset_color%}%# "
  else
    PROMPT="%c@%m $(git_branch_color)$(git_branch)%{$reset_color%}%# "
  fi
}

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
