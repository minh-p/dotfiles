# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hmp/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PS1='[\u@\h \W]\$ '
alias doom='~/.config/emacs/bin/doom'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias wifi='nmtui'
alias ls='ls --color=auto'
VISUAL=nvim
EDITOR=nvim
JOURNAL='/home/hmp/Documents/journal-entries'
MPD_HOST="localhost"
updateconfig='config submodule foreach git pull'
tmux='tmux -u'
doom='~/.config/emacs/bin/doom'
alias run_obs="VK_ICD_FILENAMES=/opt/amdgpu-pro/amd_pro_icd64.json obs"
_JAVA_AWT_WM_NONREPARENTING=1
JAVA_HOME=/usr/lib/jvm/java-22-openjdk
CAPACITOR_ANDROID_STUDIO_PATH=/usr/bin/android-studio
ANDROID_SDK_ROOT=/opt/android-sdk
ANDROID_HOME=/opt/android-sdk
alias runandroidavd='QT_QPA_PLATFORM=xcb emulator -feature -Vulkan'

eval "$(starship init zsh)"

# X11 and Wayland
alias spotify="/usr/bin/spotify"
MOZ_ENABLE_WAYLAND=""
QT_QPA_PLATFORM="xcb"

if [ -n "$WAYLAND_DISPLAY" ]; then
    MOZ_ENABLE_WAYLAND=1
    QT_QPA_PLATFORM=wayland-egl
    TERMINAL=foot
    alias spotify="/usr/bin/spotify --enable-features=UseOzonePlatform --ozone-platform=wayland"
fi
