# vim: syntax=ruby filetype=ruby

require "Socket"
hostname = Socket.gethostname
is_work_machine = hostname.start_with?("bm-dan-laptop")

tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-versions"
tap "homebrew/core"
tap "homebrew/services"

brew "autoconf"
brew "openssl@1.1"
brew "readline"
brew "automake"
brew "binutils"
#brew "boost"
brew "bottom"  # like top - but modern
brew "ocaml"
brew "camlp5"
brew "clang-format"
brew "cmake"
brew "colordiff"
brew "ctags"
brew "curl"
# The cue configuration language
brew "cue"
brew "xh" # like httpie
brew "coreutils"
brew "dhall-json"
brew "dhall-lsp-server"
# Auto set environment variables when entering directories
brew "direnv"
brew "emacs"
brew "ffmpeg"
# amazing fuzzy finder
brew "fzf"
brew "gcc"
# Glascow Haskell Compiler - not installed by default as it's rather large
#brew "ghc"
brew "ghcup"
brew "ghostscript"
brew "git"
# OpenGL windowing library
brew "glfw"
brew "graphviz"
brew "libgpg-error"
brew "gnupg"
#brew "gnuplot"
brew "go"
# Used for SASL auth with e.g. Gmail
brew "gsasl"
# Load testing tool
brew "hey"
# modal editor in rust
brew "helix"
brew "haskell-stack"
# Github hub
brew "hub"
brew "gh"
brew "act"  # run github actions locally
brew "imagemagick"
#brew "ivy"
#brew "jbig2dec"
#brew "jbig2enc"
brew "jq"
# JSON incremental digger: https://github.com/simeji/jid
brew "jid"
brew "gron"
brew "kubernetes-cli"
brew "helm"
brew "krew"
brew "kubeseal"
brew "kubeconform"
brew "kind"
brew "k3d"
brew "stern"  # for tailing multiple pod logs simulteously
brew "fluxctl" if hostname.start_with?("cadmus")
#brew "leiningen"
# great embedded key value database
brew "leveldb"
brew "libxml2"
#brew "llvm"  if hostname.start_with?("cadmus")
brew "maven" if hostname.start_with?("cadmus")
#brew "mono"
brew "mosh"
brew "mycli"
brew "mysql"
brew "notmuch"
brew "neomutt"
brew "nginx"
brew "nmap"
brew "node"
brew "pnpm"
brew "opam"
brew "pandoc"
brew "pgcli"
# pager for psql / pgcli / mysql / etc
brew "pspg"
# For Rasterizing PDFs?
#brew "poppler"
#brew "postgresql"
# Traces things
#brew "potrace"
brew "python"
brew "python@3.8"
brew "qemu"
brew "reattach-to-user-namespace"
brew "redis", restart_service: true unless is_work_machine
brew "rlwrap"
brew "ruby", link: true
brew "rustup-init"
brew "cargo-watch"
brew "sbt" unless is_work_machine
brew "scala" unless is_work_machine
brew "clojure" unless is_work_machine
brew "shellcheck"
# For kubernetes projects
brew "tilt"
# A much faster replacement to grep esp for programming projects
brew "the_silver_searcher"
brew "ripgrep"
# For kubernetes projects
brew "tilt"
#brew "thrift"
brew "tmux"
brew "transmission-cli"
brew "uv"  # fast pip-tools replacement
brew "vim"
brew "neovim"
brew "w3m"
brew "watch"
brew "wget"
brew "yarn"
brew "youtube-dl" unless is_work_machine
brew "zig"
brew "zsh"
# very good and fast compression
brew "zstd"

if is_work_machine
  brew "actionlint"
  brew "awscli"
  brew "aws-cdk"
  brew "bash"
  brew "black"
  brew "calicoctl"
  brew "cdk8s"
  brew "cdktf"
  brew "commitizen"
  brew "ctlptl"
  brew "deno"
  brew "dive"
  brew "fnm"  # like nvm but faster
  brew "go@1.19"
  brew "go@1.21"
  brew "golangci-lint"
  brew "k9s"
  brew "make"
  brew "mongosh"
  brew "nss"
  brew "nvm"
  brew "openssl@3"
  brew "pnpm"
  brew "postgresql@12"
  brew "pyenv"
  brew "pyenv-virtualenv"
  brew "tree"
  brew "volta"
end

# ==== CASKS ====
cask "basictex"
cask "flutter" if is_work_machine
cask "calibre" unless is_work_machine
cask "kitty"
cask "xquartz"
cask "google-cloud-sdk"
cask "vlc"

# we should or would also add:
# chrome
# firefox
# dropbox
# google drive
# sequel ace
# Visual Studio Code
# 010 Editor?
# Docker for Mac
# FL Studio
# Gimp?
# Krita?
# Darktable?
# Spotify
# Steam
