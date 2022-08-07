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
alias tmux='tmux -u'
export PATH=$HOME/.cargo/bin:$PATH
export TERM_TYPE=`pstree -As $$ | awk -F "---" '{print $2}'`
#export credentials in here
bash ~/.credentialsrc

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# Timer!
countdown() {
    start="$(( $(date '+%s') + $1))"
    while [ $start -ge $(date +%s) ]; do
        time="$(( $start - $(date +%s) ))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}

stopwatch() {
    start=$(date +%s)
    while true; do
        time="$(( $(date +%s) - $start))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}

# start web server
startpythonwebserver() {
    cd $1
    python -m http.server $2 &> /dev/null &
    sleep 1
    cd
}
