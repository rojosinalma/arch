#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# ASDF
. $HOME/.asdf/asdf.sh

# Cargo
PATH=$PATH:/home/rojo/.asdf/installs/rust/1.51.0/bin
. $HOME/.asdf/completions/asdf.bash

# SSH AGENT
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi

if [[ ! "$SSH_AUTH_SOCK" ]]; then
  source "$XDG_RUNTIME_DIR/ssh-agent.env" > /dev/null
fi


## Local
. $HOME/.bash_aliases
