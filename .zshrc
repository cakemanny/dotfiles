# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git autojump brew sbt scala django)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# ------------ User configuration ------------

# - - - - - - Environment - - - - - -

export PATH=$PATH:/usr/local/mysql/bin:~/.cabal/bin:~/.cargo/bin
export JAVA_HOME=$(/usr/libexec/java_home)
export SCALA_HOME=/usr/local/opt/scala/idea
export TOMCAT_HOME=/usr/local/apache-tomcat
#export CC=/usr/local/bin/gcc-7
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"
export ARCHFLAGS="-arch x86_64"
export EDITOR=vim
export VISUAL=vim
export JAVA_OPTS="-XX:+HeapDumpOnOutOfMemoryError"
export SBT_OPTS="-XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Dsbt.jse.engineType=Node"
export GOPATH=$HOME/.gopath

export HOMEBREW_MAKE_JOBS=4
export HOMEBREW_NO_INSTALL_CLEANUP=1
export ASPNETCORE_ENVIRONMENT=Development

. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
(which direnv 1>/dev/null 2>/dev/null) && eval "$(direnv hook zsh)"

# to fix ocaml upgrade
# https://github.com/ocaml/opam/issues/3708#issuecomment-448549584

# add user installed python modules
#export PATH=$PATH:$HOME/Library/Python/3.5/bin

# Make this one last

export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH


# - - - - - - Shell Options - - - - - -
# Most of the ones we want are already set by the oh-my-zsh

# Not good feature
unsetopt correctall

setopt extendedglob # Allows for regex style globbing

# - - - - - - Prompt Display and Colors - - - - - -

# Setup our prompt the way we like it...
function _user_host() {
    [[ -n $SSH_CONNECTION ]] && me='%n@%m' || [[ $LOGNAME != $USER ]] && me='%n'
    [[ -n $me ]] && echo "$me:"
}
function _git-branch-prompt() {
    local ref=$(git symbolic-ref HEAD 2>/dev/null)
    local branch=${ref##*/}
    [ $branch ] && printf " (%s)" $branch
}
PROMPT='$(_user_host)%~$(_git-branch-prompt) %% '
# The defaults. I don't like bold!
LSCOLORS='exfxcxdxbxegedabagacad'

# -------------------- Vim Mode --------------------

#  enable vim mode on comandline
bindkey -v

# show vim status
#function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#    RPS2="$RPS1"
#    #local _i_or_n="${${KEYMAP/vicmd/N}/(main|viins)/I}"
#    #PS1='$(_user_host)%~$(_git-branch-prompt) '"${_i_or_n}"'%% '
#    zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select

# add missing vim hotkeys - a=cmd-mode v=insert-mode
bindkey -a u undo
bindkey -a '^R' redo
bindkey    '^?' backward-delete-char
bindkey    '^H' backward-delete-char

# history-search in vim mode
bindkey -M vicmd '^s' history-incremental-search-backward
bindkey -M viins '^s' history-incremental-search-backward

# my own bindings pretty much straight from the vimrc
bindkey -v 'kj' vi-cmd-mode
bindkey -M visual 'kj' deactivate-region
bindkey -a 'H'  vi-beginning-of-line
bindkey -a 'L'  vi-end-of-line


# -------------------- Functions --------------------

function cdf {
    local target="$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')"
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# -------------------- Aliases --------------------
# Most of those are already set by oh-my-zsh

# for managing our dotfiles repo
# git init --bare ~/.dotfiles
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# dotfiles config status.showUntrackedFiles no

alias vimr='mvim --remote-silent'

# https://github.com/kubermatic/fubectl
[[ -f $HOME/.fubectl.source ]] && source $HOME/.fubectl.source


# -------------------- Completions --------------------

# The next line updates PATH for the Google Cloud SDK.
[[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]] && source "$HOME/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
[[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]] && source "$HOME/google-cloud-sdk/completion.zsh.inc"

# iTerm2 Shell Integration
if [[ "$TERM_PROGRAM" == "iTerm.app" && -f $HOME/.iterm2_shell_integration.zsh ]]; then
    source $HOME/.iterm2_shell_integration.zsh
fi

# complete for the kitty command
if [[ -e /usr/local/bin/kitty ]]; then
    /usr/local/bin/kitty + complete setup zsh | source /dev/stdin
fi
