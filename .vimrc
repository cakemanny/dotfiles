"set nocompatible
filetype off

" https://github.com/junegunn/vim-plug
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
" Maybe consider fzf at some point?
" junegunn/fzf.vim
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'Raimondi/delimitMate' " autoclose delimiters
"Plug 'kana/vim-smartinput' " autoclose delimiters
Plug 'kana/vim-textobj-user' " required for vim-textobj-indent and -line
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'wellle/targets.vim'

"Plug 'direnv/direnv.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rebelot/kanagawa.nvim'  " a treesitter compatible colorscheme

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" language specific plugins
"Plug 'tpope/vim-fireplace' " clojure
"Plug 'kongo2002/fsharp-vim'
Plug 'vim-scripts/indenthaskell.vim'
" Plug 'rust-lang/rust.vim'
"Plug 'OrangeT/vim-csharp'
if 0
    Plug 'fatih/vim-go'
endif
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Plug 'b4winckler/vim-objc'
Plug 'Vimjas/vim-python-pep8-indent'
"Plug 'derekwyatt/vim-scala'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"Plug 'MaxMEllon/vim-jsx-pretty'
"Plug 'neoclide/vim-jsx-improve'
Plug 'neomutt/neomutt.vim'
"Plug 'Quramy/tsuquyomi' " a typescript autocompletion thing
"Plug 'leafgarland/typescript-vim'
"Plug 'hylang/vim-hy'
Plug 'hashivim/vim-terraform'
Plug 'google/vim-jsonnet'
Plug 'vmchale/dhall-vim'
Plug 'ziglang/zig.vim'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

set encoding=utf8

" Make clipboard work as you would expect it to
set clipboard+=unnamed
if has("win32")
    set dir=$TEMP
endif

" Syntax highlighting and tabs
syntax on
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set nofoldenable    " Disable code folding

" Allows us to insert stuff like λ and π with l<BS>* -- disabled too much trouble
" set digraph

" Activate Mouse etc
if has('gui_running')
    set mouse=a
else
    " scrolling in insert mode on macOS terminal inserts an escape code based
    " on the position, which we are not able to predict in a remap
    set mouse=nvc
    if has('mac') && !has('nvim')
        " have mouse selection update while dragging
        set ttymouse=sgr
    end
end

" Allow backspace past insert point etc
set backspace=indent,eol,start

" beeping is damn annoying
set visualbell

" Allow to switch depite not saving
set hidden

" Diable encryption (:X) -- don't want this happening accidently
if !has('nvim')
    set key=
end

" Automatically read files when they are changed
set autoread

" This allows characters like ⇒ to take up two spaces rather than being cut
" short αβξδ -- not sure I like what this does to the greek letters
"set ambiwidth=double

" Make command-line completion better
set wildmenu
set wildoptions=pum,tagfile

" Things to ignore when completing stuff
set wildignore+=*.o,*.class,*.git,*.svn,*/venv/*,*/node_modules/*,*/bower_components/*

" Tell vim to search subdirectories for files with :find
set path+=**

" Don't try to search included files
set complete-=i

" So that '^[O' creates a new line above much quicker in console vim
if !has('nvim')
    set noesckeys
end

" Also set the timeout for commands to a fair amount shorter
set timeoutlen=250

" Delete comment character when joining commented lines
set formatoptions+=j

" Add more history (default=50)
set history=500

" Don't interpret numbers with leading 0 as octal for <c-a> <c-x> incr, decr
set nrformats-=octal

" mapleader and tab stuff - the C-Tab ones only seem to work in gvim (windows)
let mapleader=","
" move between items in the quickfix list
noremap <Leader>m :cnext<CR>
noremap <Leader>n :cprevious<CR>

" quick switching in split screens
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l


" quick switching buffers
noremap <Leader>1 :b1<CR>
noremap <Leader>2 :b2<CR>
noremap <Leader>3 :b3<CR>
noremap <Leader>4 :b4<CR>
noremap <Leader>5 :b5<CR>

" Ctrl-z for saving!
noremap     <C-z> :update<CR>
inoremap    <C-z> <C-o>:update<CR>

" Block focus escape codes
inoremap    <c-[>[O <Nop>
inoremap    <c-[>[I <Nop>

" Much quicker escape - and undo our previous learning
inoremap    <c-[> <Nop>
inoremap    kj  <esc>
vnoremap    kj  <esc>

" Why do we need to press shift to type commands, ; isn't being used for anything
nnoremap    ;   :
vnoremap    ;   :

" Except repeating an f or F
nnoremap    <space>     ;
vnoremap    <space>     ;
nnoremap    <s-space>   ,
vnoremap    <s-space>   ,

" Remap H to go to the beginning of the line and L to go to the end -
nnoremap    H   ^
nnoremap    L   $
vnoremap    H   ^
vnoremap    L   $

nnoremap    dL  d$
nnoremap    cL  c$
nnoremap    yL  y$
nnoremap    dH  d^
nnoremap    cH  c^
nnoremap    yH  y^

nnoremap    (   %
nnoremap    )   %
vnoremap    (   %
vnoremap    )   %

" Clear the search highlight
nnoremap <Leader>h  :nohlsearch<CR>
" Toggle relative numbering
nnoremap <Leader>rn :set relativenumber!<CR>

" Edit our .vimrc
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>

" make , a text object
nnoremap di, f,dT,
nnoremap ci, f,cT,
nnoremap yi, f,yT,
vnoremap i,  <esc>T,vt,

" Disable the arrow keys in insert mode
if has('gui_running')
    " The mac terminal triggers these keys, don't want them to perform an edit
    no <up>     "mddk"mP
    no <down>   "mdd"mp
else
    if has('mac')
        no <up>     <C-Y>
        no <down>   <C-E>
    else
        no <up>     <Nop>
        no <down>   <Nop>
    endif
endif
no <left> <Nop>
no <right> <Nop>
ino <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
vno <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>

" -- -- Display Stuff -- --

colorscheme FreshCut
if has('mac')
    set guifont=Monaco
else
    set guifont=Consolas
    set guifontwide=NSimsun:h10
endif
" tmux is only a problem on tsw-dan-laptop...
if $COLORTERM == 'truecolor' && $TMUX == ''
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors

    let g:terminal_ansi_colors = [
                \ "#000000", "#d71e00", "#5da602", "#cfad00",
                \ "#417ab3", "#88658d", "#00a7aa", "#dbded8",
                \ "#676965", "#f44135", "#98e342", "#fcea60",
                \ "#83afd8", "#bc93b6", "#37e5e7", "#f1f1ef"
                \]
endif
if $TERM == 'xterm-kitty' && !has('nvim')
    let &t_ut=''
endif
if has('win32') && has('gui_running')
    " Get rid of menus
    set guioptions-=m
    set guioptions-=T
    " Set sizes
    set columns=92
    set lines=47
    set window=46
endif

set number              " show line numbers
set textwidth=79        " width of document
set nowrap              " Don't automatically wrap on load
set formatoptions-=t    " don't automatically wrap text when typing
set colorcolumn=80
highlight ColoColumn ctermbg=233
set relativenumber  " show line numbers as relative jumps
set ruler       " show position in bottom right hand corner


set hlsearch    " Highlight search results
set incsearch   " search as type
set ignorecase  "
set smartcase   " be case sensitive if I start with a cap
set maxmempattern=2000

" Highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
augroup vimrc
    autocmd!
    au BufWinEnter * match ExtraWhitespace /\s\+$/
    au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    au InsertLeave * match ExtraWhitespace /\s\+$/
    au BufWinLeave * call clearmatches()
augroup END

" And how about a mapping to fix it as well - cs=clear spaces
nnoremap <Leader>cs :%s/\s\+$//<CR>

set tag=tags;/

" Most indent settings are now handled by vim-sleuth
augroup vimrc
    au FileType clojure,rust let b:delimitMate_quotes = "\""
    au FileType diff color desert
    au FileType go setlocal noexpandtab
    au BufWritePost *.go :silent !goimports -w %
    au FileType make setlocal noexpandtab
    " Avoid auto-wrapping long lines
    au FileType ocaml setlocal fo-=t fo+=croql
augroup END

" POSIX /bin/sh extensions should be highlighted. e.g. $(...)
let g:is_posix = 1

" netrw configuration
"let g:netrw_banner      = 0
let g:netrw_preview     = 1  " vsplit preview
let g:netrw_liststyle   = 3  " tree
"let g:netrw_winsize     = 30
" get relativenumber in netrw
let g:netrw_bufsettings = 'nomodifiable nomodified number nobuflisted nowrap readonly'
" open netrw
nnoremap <Leader>ex :Explore<CR>

"" CtrlP Configuration
"let g:ctrlp_custom_ignore = '\v%(/\.%(git|hg|svn)|\.%(class|o|png|jpg|jpeg|bmp|tar|jar|tgz|deb|zip)$|/target/%(quickfix|resolution-cache|streams)|/target/scala-2.10/%(classes|test-classes|sbt-0.13|cache)|/project/target|/project/project)'
        ""\ 'dir': '\v[\/]\.(git|hg|svn)$\|target\|node_modules\|bower_components',
let g:ctrlp_custom_ignore = {
        \ 'dir': 'target\|node_modules\|bower_components\|build\|_build\|venv\|__pycache__',
        \ 'file': '\v\.(exe|so|dll|class|o|png|jpg|jpeg|bmp|tar|jar|tgz|deb|zip|pyc)$',
        \ }
let g:ctrlp_user_command = {
        \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
        \ 'fallback': 'find %s -type f'
        \ }

" work from current dir - default is 'ra'
let g:ctrlp_working_path_mode = ''

set noshowmatch
set completeopt=longest,menuone,preview
set splitbelow

" ## ALE
" We use coc for lsp
let g:ale_disable_lsp = 1
let g:ale_linters = {
        \ 'python': ['flake8', 'ruff'],
        \ 'haskell':[],
        \ 'typescript': ['eslint']
        \ }
let g:ale_fixers = {
        \ 'javascript': ['prettier'],
        \ 'css': ['prettier'],
        \ 'typescript': ['prettier'],
        \ 'typescriptreact': ['prettier'],
        \ }
if hostname() =~ "^bm-dan-laptop"
    let g:ale_fix_on_save = 1
else
    let g:ale_fix_on_save = 0
endif
let g:ale_disable_lsp = 1

let g:ale_c_clang_options = ' -std=gnu11 -Wall'
let g:ale_c_gcc_options = ' -std=gnu11 -Wall'

"
let g:ale_go_golangci_lint_package = 1

" Fix macvim python problems
if has('mac') && !has('nvim')
  if has('python3')
      "set pythonthreedll=/usr/local/opt/python/Frameworks/Python.framework/Versions/3.8/Python
      "set pythonthreehome=/usr/local/opt/python/Frameworks/Python.framework/Versions/3.8/
  else
      set pythondll=/usr/local/Frameworks/Python.framework/Versions/2.7/Python
      set pythonhome=/usr/local/Frameworks/Python.framework/Versions/2.7
  endif
endif
if has('nvim')
  let g:python3_host_prog = '~/.pyenv/versions/neovim/bin/python'
endif

" avoid |vim-go| conflict with syntastic
let g:go_list_type = "quickfix"
" we will get our go_fmt fails from syntastic
let g:go_fmt_fail_silently = 1
" fix imports instead of complaining about them
let g:go_fmt_command = 'goimports'
" auto creating a dumb hello world program on each new file is stupid
let g:go_template_autocreate = 0

"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'


" ## TreeSitter
if has('nvim')
lua << EOF
    require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
        highlight = {
            enable = true,
            disable = { "c", "python" },
        },
    }
EOF
endif


" ## coc
" Avoid node being affected by nvm or corepack etc
if $HOMEBREW_PREFIX == ""
    let $HOMEBREW_PREFIX = "/usr/local"
endif
if executable($HOMEBREW_PREFIX . '/bin/node')
    let g:coc_node_path = $HOMEBREW_PREFIX . '/bin/node'
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh :call CocActionAsync('doHover')<CR>

nnoremap <silent> <Leader>rf <Plug>(coc-refactor)
nnoremap <silent> <Leader>rn <Plug>(coc-rename)

let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-yaml', 'coc-json', 'coc-rust-analyzer', 'coc-pyright']
if hostname() !~ '^bm-dan-laptop'
    let g:coc_global_extensions += []
endif

" useful functions
function! CloseHiddenBuffers()
  let i = 0
  let n = bufnr('$')
  while i < n
    let i = i + 1
    if bufloaded(i) && bufwinnr(i) < 0
      exe 'bw ' . i
    endif
  endwhile
endfun

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Ripgrep or The Silver Searcher
if executable('rg')
  "set grepprg=rg\ --color\ never\ --no-heading
  let g:ctrlp_user_command = 'rg %s --color never --files'
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" bind K to grep word under cursor
nnoremap K yiw:grep! "\b<C-R>+\b"<CR>:cw<CR>
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

"function! SendQuery()
"  normal! `<"ay`>
"  let keys = @a
"  echo keys
"  let term_bufs = term_list()
"  echo term_bufs
"  let buf = term_bufs[0]
"  call term_sendkeys(buf, keys)
"  call term_sendkeys(buf, "\<cr>")
"endfunction
"
"vnoremap <Leader>t :call SendQuery()<cr>

" source a project-local vim config if the file exists
set exrc
set secure
