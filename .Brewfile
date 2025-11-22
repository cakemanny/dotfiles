# vim: syntax=ruby filetype=ruby

require "Socket"
hostname = Socket.gethostname
is_work_machine = hostname.start_with?("bm-dan-laptop")

tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/core"
tap "homebrew/services"

brew "autoconf"
brew "openssl@1.1"
brew "readline"
brew "automake"
brew "binutils"
brew "bottom"  # like top - but modern
tap "oven-sh/bun"
brew "oven-sh/bun/bun"  # fast javascript runtime
brew "ocaml"
brew "camlp5"
brew "clang-format"
brew "cmake"
brew "colordiff"
brew "colima"  # container runtime
brew "ctags"
brew "curl"
# The cue configuration language
brew "cue"
brew "xh" # like httpie
brew "coreutils"
#brew "dhall-json"
#brew "dhall-lsp-server"
# Auto set environment variables when entering directories
brew "direnv"
brew "docker"
brew "docker-buildx"
brew "docker-completion"
brew "docker-credential-helper"
brew "emacs"
brew "ffmpeg"
# amazing fuzzy finder
brew "fzf"
brew "gcc"
# Glascow Haskell Compiler - not installed by default as it's rather large
#brew "ghc"
#brew "ghcup"
#brew "ghostscript"
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
#brew "helix"
#brew "haskell-stack"
# Github hub
brew "hub"
brew "gh"
brew "act"  # run github actions locally
brew "imagemagick"
#brew "ivy"
#brew "jbig2dec"
#brew "jbig2enc"
brew "jq"
brew "gron"
brew "kubernetes-cli"
brew "helm"
brew "krew"
brew "kind"
brew "k3d"
brew "stern"  # for tailing multiple pod logs simulteously
brew "fluxctl" if hostname.start_with?("cadmus")
#brew "leiningen"
# great embedded key value database
brew "leveldb"
brew "libxml2"
brew "lima"
#brew "llvm"  if hostname.start_with?("cadmus")
brew "lua-language-server"
brew "maven" if hostname.start_with?("cadmus")
brew "mdbook"
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
brew "ollama"  # llm model runner
brew "pandoc"
brew "pgcli"
brew "pkg-config"
# For Rasterizing PDFs?
#brew "poppler"
#brew "postgresql"
# Traces things
#brew "potrace"
brew "python"
brew "pipx"
brew "qemu"
brew "reattach-to-user-namespace"
brew "redis", restart_service: true
brew "rlwrap"
brew "ruby", link: true
brew "rustup"
brew "cargo-watch"
brew "sbt" unless is_work_machine
brew "sccache"
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
brew "tmux"
brew "transmission-cli"
brew "uv"  # fast pip-tools replacement
brew "ruff"
brew "vim"
brew "neovim"
brew "w3m"
brew "watch"
brew "wget"
brew "yarn"
brew "youtube-dl" unless is_work_machine
brew "zig"
brew "zls"
brew "zsh"
# very good and fast compression
brew "zstd"

if is_work_machine
  tap "hashicorp/tap"
  tap "ionos-cloud/homebrew-ionos-cloud"
  tap "stackitcloud/tap"
  tap "kcl-lang/tap"
  brew "actionlint"
  brew "awscli"
  brew "aws-cdk"
  brew "bash"
  brew "black"
  brew "calicoctl"
  brew "cdk8s"
  brew "cdktf"
  brew "cloudflared"
  brew "commitizen"
  brew "ctlptl"
  brew "difftastic"
  brew "deno"
  brew "docker-credential-helper-ecr"
  brew "docker-compose"
  brew "duckdb"
  brew "entr"  # for watching files
  brew "fnm"  # like nvm but faster
  brew "fd"  # alternative to find
  brew "gnu-sed"
  brew "go@1.23"
  brew "go@1.24"
  brew "go@1.25"
  brew "golangci-lint"
  brew "ionosctl"
  brew "k9s"
  brew "kcl"
  brew "kcl-lsp"
  brew "make"
  brew "mongosh"
  brew "mongodb-atlas"
  brew "nss"
  brew "nvm"
  brew "offlineimap" # <- for use with notmuch, neomutt
  brew "openjdk@17"
  brew "openjdk@21"
  brew "openssl@3"
  brew "pkl"
  brew "pnpm"
  brew "postgresql@16"
  brew "postgresql@17"
  brew "python@3.9"
  brew "python@3.10"
  brew "python@3.11"
  cask "stackit"
  brew "tree"
  brew "terraform"
  brew "hashicorp/tap/vault"
  brew "volta"
end

# ==== CASKS ====
cask "basictex"
cask "flutter" if is_work_machine
cask "flameshot" if is_work_machine
cask "calibre" unless is_work_machine
cask "kitty"
cask "mongodb-compass" if is_work_machine
cask "tableplus" if is_work_machine
cask "xquartz"
cask "gcloud-cli" unless is_work_machine
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
