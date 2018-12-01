if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_SHOWCOLORHINTS=true

  source ~/.git-prompt.sh
fi

function prompt_command {
  local cyan="\[\033[0;36m\]"
  local reset="\e[m"

  PS1="${cyan}[\t]${reset} \u ${cyan}at${reset} \W"

  local branch

  if branch="$(__git_ps1)"; then
    local magenta="\[\033[0;35m\]"
    local yellow="\[\033[01;33m\]"
    local green="\[\033[0;32m\]"
    local red="\[\033[1;31m\]"

    # Branch color.
    local status="$green"

    # Staged.
    if [[ "$branch" =~ "+" ]]; then
      status="$yellow"
    # Untracked.
    elif [[ "$branch" =~ "%" ]]; then
      status="$red"
    # Stashed.
    elif [[ "$branch" =~ "$" ]]; then
      status="$magenta"
    # Dirty.
    elif [[ "$branch" =~ "*" ]]; then
      status="$cyan"
    fi

    PS1+="`echo ${status}$branch${reset}`"
  fi

  PS1+=" $ "
}

export PROMPT_COMMAND=prompt_command
export PATH=/usr/local/bin:/usr/local/sbin:$PATH