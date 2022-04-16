#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias wifi='nmtui'
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
eval "$(starship init bash)"
export VISUAL=nvim;
export EDITOR=nvim;
export JOURNAL='/home/hmp/Documents/journal-entries';
export MPD_HOST="localhost"
alias updateconfig='config submodule foreach git pull'

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
