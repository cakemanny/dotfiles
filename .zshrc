# - - - - - - Shell Options - - - - - -

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=500000
SAVEHIST=100000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# Give us the edit-command-line widget
autoload edit-command-line
zle -N edit-command-line

setopt extendedglob # Allows for regex style globbing

# - - - - - - Environment - - - - - -

export PATH=$PATH:~/.ghcup/bin:~/.cargo/bin:~/.local/bin
#export JAVA_HOME=$(/usr/libexec/java_home)
#export SCALA_HOME=/usr/local/opt/scala/idea
#export TOMCAT_HOME=/usr/local/apache-tomcat
#export CC=/usr/local/bin/gcc-7
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"
#export ARCHFLAGS="-arch x86_64"
export EDITOR=vim
export VISUAL=vim
export JAVA_OPTS="-XX:+HeapDumpOnOutOfMemoryError"
export SBT_OPTS="-XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Dsbt.jse.engineType=Node"
export GOPATH=$HOME/.gopath
export NVM_DIR="$HOME/.nvm"
export FZF_DEFAULT_COMMAND='ag --nocolor -g .'
export UV_PYTHON_DOWNLOADS=never
#export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist noma' -\""

export HOMEBREW_MAKE_JOBS=4
export HOMEBREW_NO_INSTALL_CLEANUP=1
export ASPNETCORE_ENVIRONMENT=Development
# cloudsdk is not working with python3.12 right now (module impl removed)
export CLOUDSDK_PYTHON=python3.11

[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
# to fix ocaml upgrade
# https://github.com/ocaml/opam/issues/3708#issuecomment-448549584

export PATH=/usr/local/sbin:/usr/local/bin:$PATH

if [[ "$(uname)" == "Darwin" && "$(uname -m)" == "arm64" ]]; then
    export HOMEBREW_PREFIX="/opt/homebrew"
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
    export HOMEBREW_REPOSITORY="/opt/homebrew"
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
    FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
fi

# https://krew.sigs.k8s.io/docs/user-guide/setup/install/
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Make this one last
export PATH=$HOME/bin:$PATH

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LANG=en_GB.UTF-8



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

# Install direnv hook
(whence direnv 1>/dev/null) && eval "$(direnv hook zsh)"

# -------------------- Vim Mode --------------------

#  enable vim mode on comandline
bindkey -v

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
alias ls='ls --color=auto'  # this one is needed if on linux
alias ll='ls -lh'
alias lll='ls -l'

# git aliases for when oh-my-zsh is not there
alias gst='git status'
alias gl='git pull'
alias gd='git diff'
alias ga='git add'
alias gp='git push'
alias gco='git checkout'
alias gsu='git submodule update'


# for managing our dotfiles repo
#git init --bare ~/.dotfiles
alias dotfiles='command git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#dotfiles config status.showUntrackedFiles no
# one of
#dotfiles remote add origin git@github.com:cakemanny/dotfiles.git
#dotfiles remote add origin https://github.com/cakemanny/dotfiles.git

alias ,dotfiles='if test -z "$GIT_DIR"; then export GIT_DIR=$HOME/.dotfiles/ GIT_WORK_TREE=$HOME; elif test "$GIT_DIR" = "$HOME/.dotfiles/"; then unset GIT_DIR GIT_WORK_TREE; fi'
alias dfs='dotfiles status'
alias dfa='dotfiles add'
alias dfd='dotfiles diff'
alias dfcommit='dotfiles commit'

# https://github.com/kubermatic/fubectl
[[ -f $HOME/.fubectl.source ]] && source $HOME/.fubectl.source
# This conflicts with the kcl configuration language tool
[[ -f $HOME/.fubectl.source ]] && unalias kcl

alias recent-branches="git for-each-ref --sort=-committerdate refs/heads/ | sed 's|.*/||'"
alias gcof='git checkout $(git for-each-ref --sort=-committerdate refs/heads/ | sed "s|.*refs/heads/||" | fzf)'
alias pip='test -n "$VIRTUAL_ENV" && env pip'
alias mutt='neomutt'

function doco {
    if [[ $PWD == $HOME/src/local-dev-stack* ]] && [[ -x $HOME/src/local-dev-stack/doco.sh ]]; then
        $HOME/src/local-dev-stack/doco.sh "$@"
    else
        docker compose "$@"
    fi
}

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

# - docker aliases -
alias dils='docker image ls'
alias _docker-image-select=$'docker image ls | fzf -e --multi --height=50% --border --header-lines=1 | awk \'{ print $1 ":" $2 }\''
alias drmi='_docker-image-select | xargs docker image rm'
alias dihist='_docker-image-select | xargs docker image history'
# get a shell on the docker desktop host i.e. VM
alias dhost="docker run -it --rm --privileged --pid host alpine nsenter -t 1 -m -u -i -n -p -- sh"

# - pnpm aliases -
alias p='pnpm'
alias pifl='pnpm install --frozen-lockfile'

# -------------------- Completions --------------------

# case insensitive and substring completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*'
# finish loading compsys
zstyle :compinstall filename "$HOME/.zshrc"
# must come after setting FPATH
autoload -Uz compinit
compinit


GOOGLE_CLOUD_SDK=${HOMEBREW_PREFIX:-/usr/local}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk
# The next line updates PATH for the Google Cloud SDK.
[[ -f "$GOOGLE_CLOUD_SDK/path.zsh.inc" ]] && source "$GOOGLE_CLOUD_SDK/path.zsh.inc"

# The next line enables shell command completion for gcloud.
[[ -f "$GOOGLE_CLOUD_SDK/completion.zsh.inc" ]] && source "$GOOGLE_CLOUD_SDK/completion.zsh.inc"

# override completion for the kitty command
_kitty() {
    local src
    # Send all words up to the word the cursor is currently on
    src=$(printf "%s\n" "${(@)words[1,$CURRENT]}" | kitty +complete zsh)
    if [[ $? == 0 ]]; then
        eval ${src}
    fi
}
compdef _kitty kitty


# https://github.com/Schniz/fnm  - another alternative NVM alternative
command -v fnm >/dev/null && eval "$(fnm env --use-on-cd)"
