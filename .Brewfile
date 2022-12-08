# vim: syntax=ruby filetype=ruby

require "Socket"
hostname = Socket.gethostname

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
brew "ocaml"
brew "camlp5"
brew "cmake"
brew "colordiff"
brew "commitizen" if hostname.start_with?("bm-dan-laptop")
brew "ctags"
brew "curl"
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
brew "ghostscript"
brew "git"
# OpenGL windowing library
brew "glfw"
brew "libgpg-error"
brew "gnupg"
#brew "gnuplot"
brew "go"
# Used for SASL auth with e.g. Gmail
brew "gsasl"
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
brew "kubeseal"
brew "stern"
brew "skaffold" if hostname.start_with?("bm-dan-laptop")
brew "fluxctl" if hostname.start_with?("cadmus")
brew "awscli"
brew "aws-cdk"
brew "cdktf"
#brew "leiningen"
# great embedded key value database
brew "leveldb"
brew "libxml2"
brew "llvm"  if hostname.start_with?("cadmus")
brew "maven" if hostname.start_with?("cadmus")
#brew "mono"
brew "mosh"
brew "mongosh" if hostname.start_with?("bm-dan-laptop")
brew "mycli"
brew "mysql"
brew "notmuch"
brew "neomutt"
brew "nginx"
brew "nmap"
brew "nss"
brew "node"
brew "deno"
brew "opam"
#brew "pandoc"
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
brew "reattach-to-user-namespace"
brew "redis", restart_service: true
brew "rlwrap"
brew "ruby", link: true
brew "sbt"
brew "scala" unless hostname.start_with?("bm-dan-laptop")
brew "shellcheck"
# A much faster replacement to grep esp for programming projects
brew "the_silver_searcher"
brew "ripgrep"
#brew "thrift"
brew "tmux"
brew "transmission-cli"
brew "vim"
brew "neovim"
brew "w3m"
brew "wget"
brew "yarn"
brew "youtube-dl" unless hostname.start_with?("bm-dan-laptop")
brew "zsh"
# very good and fast compression
brew "zstd"

if hostname.start_with?("bm-dan-laptop")
  brew "bash"
  brew "black"
  brew "go@1.18"
  brew "make"
  brew "nvm"
  brew "openssl@3"
  brew "postgresql@12"
  brew "pyenv"
  brew "pyenv-virtualenv"
  brew "volta"
end

# ==== CASKS ====
cask "basictex"
cask "background-music" if hostname.start_with?("bm-dan-laptop")
cask "calibre" unless hostname.start_with?("bm-dan-laptop")
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
