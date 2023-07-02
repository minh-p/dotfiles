#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias wifi='nmtui'
alias ls='ls --color=auto'

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
export VISUAL=nvim;
export EDITOR=nvim;
export JOURNAL='/home/hmp/Documents/journal-entries';
export MPD_HOST="localhost"
alias updateconfig='config submodule foreach git pull'
alias tmux='tmux -u'
alias doom='~/.config/emacs/bin/doom'
export TERM_TYPE=`pstree -As $$ | awk -F "---" '{print $2}'`
alias run_obs="VK_ICD_FILENAMES=/opt/amdgpu-pro/amd_pro_icd64.json obs"
# export QT_QPA_PLATFORM=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export JAVA_HOME=/usr/lib/jvm/java-19-openjdk
export CAPACITOR_ANDROID_STUDIO_PATH=/usr/bin/android-studio
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_HOME=/opt/android-sdk
alias runandroidavd='QT_QPA_PLATFORM=xcb emulator -feature -Vulkan'

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

# terminal prompt
eval "$(starship init bash)"
