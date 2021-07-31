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
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
DISABLE_CORRECTION="true"

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
plugins=(git brew)

if [[ -d $ZSH ]]; then
    source $ZSH/oh-my-zsh.sh
else
    # case insensitive and substring completion
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*'
    # finish loading compsys
    zstyle :compinstall filename "$HOME/.zshrc"
    autoload -Uz compinit
    compinit

    # History
    HISTSIZE=500000
    SAVEHIST=100000
    setopt extended_history
    setopt hist_expire_dups_first
    setopt hist_ignore_dups
    setopt hist_ignore_space
    setopt hist_verify
    setopt share_history
fi

# ------------ User configuration ------------

# - - - - - - Environment - - - - - -

export PATH=$PATH:~/.cabal/bin:~/.cargo/bin
#export JAVA_HOME=$(/usr/libexec/java_home)
#export SCALA_HOME=/usr/local/opt/scala/idea
#export TOMCAT_HOME=/usr/local/apache-tomcat
#export CC=/usr/local/bin/gcc-7
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"
export ARCHFLAGS="-arch x86_64"
export EDITOR=vim
export VISUAL=vim
export JAVA_OPTS="-XX:+HeapDumpOnOutOfMemoryError"
export SBT_OPTS="-XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Dsbt.jse.engineType=Node"
export GOPATH=$HOME/.gopath
# TODO: Migrate to .gopath
if [[ "${HOST/.*}" == "tsw-dan-laptop" ]]; then
    export GOPATH=$HOME/src/go
fi
export FZF_DEFAULT_COMMAND='ag --nocolor -g .'

#export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist noma' -\""

export HOMEBREW_MAKE_JOBS=4
export HOMEBREW_NO_INSTALL_CLEANUP=1
export ASPNETCORE_ENVIRONMENT=Development

source $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
# to fix ocaml upgrade
# https://github.com/ocaml/opam/issues/3708#issuecomment-448549584

if [[ "$(uname)" == "Darwin" && "$(uname -m)" == "arm64" ]]; then
    export HOMEBREW_PREFIX="/opt/homebrew"
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
    export HOMEBREW_REPOSITORY="/opt/homebrew"
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
fi

# Make this one last
export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LANG=en_GB.UTF-8

# Install direnv hook
(whence direnv 1>/dev/null) && eval "$(direnv hook zsh)"

# - - - - - - Shell Options - - - - - -
# Most of the ones we want are already set by the oh-my-zsh

setopt extendedglob # Allows for regex style globbing

# - - - - - - Prompt Display and Colors - - - - - -

# Setup our prompt the way we like it...
function _user_host() {
    [[ -n $SSH_CONNECTION ]] && me='%n@%m' || [[ $LOGNAME != $USER ]] && me='%n'
    [[ -n $me ]] && echo "$me:"
}
function _git-branch-prompt() {
    local ref=$(command git symbolic-ref HEAD 2>/dev/null)
    local branch=${ref##*/}
    [ $branch ] && printf " (%s)" $branch
}
# allow the use of the functions in the prompt
setopt prompt_subst
PROMPT='$(_user_host)%~$(_git-branch-prompt) %% '
# The defaults. I don't like bold!
export LSCOLORS='exfxcxdxbxegedabagacad'

# enable colors via the env var - so we can use gnu ls as well
export CLICOLOR=1


## Now doing this via iterm status bar
# show kubectl context
#function zle-line-init {
#    RPS1="($(kube_ctx_name))"
#    RPS2="$RPS1"
#    zle reset-prompt
#}
#zle -N zle-line-init

function iterm2_print_user_vars {
    iterm2_set_user_var kubecontext $(kubectl config current-context)
}

if [[ "$TERM_PROGRAM" == "iTerm.app" && -e "${HOME}/.iterm2_shell_integration.zsh" ]]; then
    source "${HOME}/.iterm2_shell_integration.zsh"
fi

# Don't need user@host on local
ZSH_THEME_TERM_TITLE_IDLE='$(_user_host)%~'
# Avoid duplication of directory in terminals with independent dir display
if [[ "$TERM_PROGRAM" == Apple_Terminal ]]; then
    ZSH_THEME_TERM_TITLE_IDLE='$(_user_host)'
fi

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

# edit line in vim
bindkey -M vicmd ' ' edit-command-line

# my own bindings pretty much straight from the vimrc
bindkey -v 'kj' vi-cmd-mode
bindkey -M visual 'kj' deactivate-region
bindkey -a 'H'  vi-beginning-of-line
bindkey -a 'L'  vi-end-of-line


# -------------------- Functions --------------------

function cdfinder {
    local target="$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')"
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

function cdf {
    local toplevel
    local directory
    if [ -z "$1" ]; then
        toplevel=.
    else
        toplevel="$1"
    fi
    directory=$(find "$toplevel" \
        \( -name venv \
        -o -name bower_components \
        -o -name node_modules \
        -o -name collect_static \
        -o -name .git \
        -o -name __pycache__ \
        \) -prune -o -type d -print | fzf)
    if [ ! -z "$directory" ]; then
        cd "$directory"
    fi
}

function ghash {
    local ref
    if [ -z "$1" ]; then
        ref=HEAD
    else
        ref="$1"
    fi
    git rev-parse --short=10 "$ref"
}

function b64enc {
    base64 -i <(echo -n "$1")
}
function b64dec {
    base64 --decode -i <(echo -n "$1")
}

# -------------------- Aliases --------------------
# Most of those are already set by oh-my-zsh

# git aliases for when oh-my-zsh is not there
alias gst='git status'
alias gl='git pull'
alias gd='git diff'
alias ga='git add'
alias gp='git push'
alias gco='git checkout'


# for managing our dotfiles repo
#git init --bare ~/.dotfiles
if [[ "${HOST/.*}" == "tsw-dan-laptop" ]]; then
    alias dotfiles='command git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME/workdir'
else
    alias dotfiles='command git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
fi
#dotfiles config status.showUntrackedFiles no

alias dfs='dotfiles status'
alias dfa='dotfiles add'
alias dfd='dotfiles diff'
alias dfcommit='dotfiles commit'

# https://github.com/kubermatic/fubectl
[[ -f $HOME/.fubectl.source ]] && source $HOME/.fubectl.source


alias recent-branches="git for-each-ref --sort=-committerdate refs/heads/ | sed 's|.*/||'"
alias gcof='git checkout $(git for-each-ref --sort=-committerdate refs/heads/ | sed "s|.*/||" | fzf)'
alias pip='test -n "$VIRTUAL_ENV" && env pip'
alias mutt='neomutt'

# because I'm so vimmed
alias ':e'='vim'

# - kubectl aliases -
# Get current context
alias krc='kubectl config current-context'
# List all contexts
alias klc='kubectl config get-contexts -o name | sed "s/^/  /;\|^  $(krc)$|s/ /*/"'
# Change current context
alias kcc='kubectl config use-context "$(klc | fzf -e --height=10 | sed "s/^..//")"'

# Get current namespace
alias krn='kubectl config get-contexts --no-headers "$(krc)" | awk "{print \$5}" | sed "s/^$/default/"'
# List all namespaces
alias kln='kubectl get -o name ns | sed "s|^.*/|  |;\|$(krn)|s/ /*/"'
# Change current namespace
alias kcn='kubectl config set-context --current --namespace "$(kln | fzf -e | sed "s/^..//")"'


# -------------------- Completions --------------------

GOOGLE_CLOUD_SDK=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk
# The next line updates PATH for the Google Cloud SDK.
[[ -f "$GOOGLE_CLOUD_SDK/path.zsh.inc" ]] && source "$GOOGLE_CLOUD_SDK/path.zsh.inc"

# The next line enables shell command completion for gcloud.
[[ -f "$GOOGLE_CLOUD_SDK/completion.zsh.inc" ]] && source "$GOOGLE_CLOUD_SDK/completion.zsh.inc"

# completion for the kitty command
_kitty() {
    local src
    # Send all words up to the word the cursor is currently on
    src=$(printf "%s\n" "${(@)words[1,$CURRENT]}" | kitty +complete zsh)
    if [[ $? == 0 ]]; then
        eval ${src}
    fi
}
compdef _kitty kitty

# generate with helm completion zsh
[[ -f $HOME/.completions.d/helm.inc.zsh ]] && source $HOME/.completions.d/helm.inc.zsh
