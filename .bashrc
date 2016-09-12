if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

RED='\[\e[1;31m\]'
GREEN='\[\e[1;32m\]'
YELLOW='\[\e[1;33m\]'
BLUE='\[\e[1;34m\]'
MAGENTA='\[\e[1;35m\]'
CYAN='\[\e[1;36m\]'
WHITE='\[\e[0m\]'

function git-status() {
  local status="`git status -unormal 2>&1`"

  if ! [[ "$status" =~ Not\ a\ git\ repo ]]; then
    if [[ "$status" =~ nothing\ to\ commit ]]; then
      local ansi=$GREEN
    elif [[ "$status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
      local ansi=$YELLOW
    else
      local ansi=$RED
    fi

    if [[ "$status" =~ On\ branch\ ([^[:space:]]+) ]]; then
      branch=${BASH_REMATCH[1]}
    else
      branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
      echo HEAD`)"
    fi

    echo -n ''"$ansi"'('"$branch"')'"$WHITE"' '
  fi
}

export PROMPT_COMMAND='export PS1="$CYAN[\t]$WHITE 💀  \u ~ \W $(git-status)$ "'

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
