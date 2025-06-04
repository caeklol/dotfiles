#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

hostname=$(uname -n)

case "$hostname" in
  pc-arch)
    eval "$(oh-my-posh init bash --config /home/caek/.config/oh-my-posh/emodipt.omp.json)"
    ;;
  framework)
    eval "$(oh-my-posh init bash --config /home/caek/.config/oh-my-posh/robbyrussell.omp.json)"
    ;;
  *)
    echo "Unknown hostname"
    ;;
esac

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

export EDITOR=nvim
export TERM=xterm-256color
. "$HOME/.cargo/env"
