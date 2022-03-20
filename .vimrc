"set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dense-analysis/ale'
" Maybe consider fzf at some point?
" junegunn/fzf.vim
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'Raimondi/delimitMate' " autoclose delimiters
"Plugin 'kana/vim-smartinput' " autoclose delimiters
Plugin 'kana/vim-textobj-user' " required for vim-textobj-indent and -line
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-line'
Plugin 'wellle/targets.vim'

"Plugin 'Shougo/deoplete.nvim'
"Plugin 'roxma/nvim-yarp' " required for deoplete
"Plugin 'roxma/vim-hug-neovim-rpc' " required for deoplete
"Plugin 'zchee/deoplete-go'
"Plugin 'direnv/direnv.vim'

Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" language specific plugins
"Plugin 'tpope/vim-fireplace' " clojure
"Plugin 'kongo2002/fsharp-vim'
Plugin 'vim-scripts/indenthaskell.vim'
"Plugin 'Shutnik/jshint2.vim'
" Plugin 'rust-lang/rust.vim'
"Plugin 'OrangeT/vim-csharp'
Plugin 'fatih/vim-go'
" Plugin 'b4winckler/vim-objc'
Plugin 'Vimjas/vim-python-pep8-indent'
"Plugin 'derekwyatt/vim-scala'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
"Plugin 'MaxMEllon/vim-jsx-pretty'
"Plugin 'neoclide/vim-jsx-improve'
Plugin 'neomutt/neomutt.vim'
"Plugin 'Quramy/tsuquyomi' " a typescript autocompletion thing
"Plugin 'leafgarland/typescript-vim'
"Plugin 'hylang/vim-hy'
Plugin 'hashivim/vim-terraform'
Plugin 'google/vim-jsonnet'

call vundle#end()

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
    if has('mac')
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
set key=

" Automatically read files when they are changed
set autoread

" This allows characters like ⇒ to take up two spaces rather than being cut
" short αβξδ -- not sure I like what this does to the greek letters
"set ambiwidth=double

" Make command-line completion better
set wildmenu

" Things to ignore when completing stuff
set wildignore+=*.o,*.class,*.git,*.svn,*/venv/*,*/node_modules/*,*/bower_components/*

" Tell vim to search subdirectories for files with :find
set path+=**

" Don't try to search included files
set complete-=i

" So that '^[O' creates a new line above much quicker in console vim
set noesckeys

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

" Ctrl-zfor saving!
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
" Quote a word
nnoremap <Leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <Leader>' viw<esc>a'<esc>hbi'<esc>lel
" Quote a selection
vnoremap <Leader>" <esc>`>a"<esc>`<i"<esc>`>2<right>
vnoremap <Leader>' <esc>`>a'<esc>`<i'<esc>`>2<right>
vnoremap <Leader>} <esc>`>a}<esc>`<i{<esc>`>f}<left>
vnoremap <Leader>{ <esc>`>a<space>}<esc>`<i{<space><esc>`>f}<left>
vnoremap <Leader>) <esc>`>a)<esc>`<i(<esc>`>f)<left>
vnoremap <Leader>( <esc>`>a<space>)<esc>`<i(<space><esc>`>f)<left>
vnoremap <Leader>] <esc>`>a]<esc>`<i[<esc>`>f]<left>
vnoremap <Leader>[ <esc>`>a<space>]<esc>`<i[<space><esc>`>f]<left>

" Edit our .vimrc
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>

" Taken from Shawn Biddle's Vim Training Class

"inoremap <Leader>' ''<left>
"inoremap <Leader>" ""<left>
"inoremap <Leader>( ()<left>
"inoremap <Leader>[ []<left>
"inoremap <Leader>{ {}<left>

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

" Control the Syntastic Plugin
noremap <silent> <Leader>e :Errors<CR>
noremap <Leader>s :SyntasticToggleMode<CR>

" -- -- Display Stuff -- --

color FreshCut
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
if $TERM == 'xterm-kitty'
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
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" And how about a mapping to fix it as well - cs=clear spaces
nnoremap <Leader>cs :%s/\s\+$//<CR>

set tag=tags;/

" Most indent settings are now handled by vim-sleuth
" TODO: use augroups
autocmd FileType make setlocal noexpandtab
autocmd FileType go setlocal noexpandtab
autocmd FileType diff color desert
autocmd FileType clojure let b:delimitMate_quotes = "\""

" netrw configuration
"let g:netrw_banner      = 0
let g:netrw_preview     = 1  " vsplit preview
let g:netrw_liststyle   = 3  " tree
"let g:netrw_winsize     = 30
" get relativenumber in netrw
let g:netrw_bufsettings = 'nomodifiable nomodified number nobuflisted nowrap readonly'
" open netrw
nnoremap <Leader>ex :Explore<CR>

"" JSHint configuration
"let jshint2_command = '~/node_modules/jshint/bin/jshint'

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

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" Updates for OmniSharp:
let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_host = "http://localhost:2000"
let g:OmniSharp_timeout = 1
set noshowmatch
set completeopt=longest,menuone,preview
set splitbelow

" Syntastic options
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cs_checkers = ['code_checker']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++14'

" pylint is sooo slow, only run pyflakes for each buffer save
let g:syntastic_python_checkers = ['pyflakes']

let g:syntastic_go_checkers = ['go', 'govet']

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_ocaml_checkers = ['merlin']
" ignore ocamlyacc and ocamllex files
let g:syntastic_ignore_files = ['\m\c\.ml[ly]$']

" ## ALE
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'javascript': ['prettier'], 'css': ['prettier']}
let g:ale_fix_on_save = 0
let g:ale_c_clang_options = ' -std=gnu11 -Wall'
let g:ale_c_gcc_options = ' -std=gnu11 -Wall'

" Fix macvim python problems
if has('mac')
  if has('python3')
      "set pythonthreedll=/usr/local/opt/python/Frameworks/Python.framework/Versions/3.8/Python
      "set pythonthreehome=/usr/local/opt/python/Frameworks/Python.framework/Versions/3.8/
  else
      set pythondll=/usr/local/Frameworks/Python.framework/Versions/2.7/Python
      set pythonhome=/usr/local/Frameworks/Python.framework/Versions/2.7
  endif
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

" Don't enable deoplete straight away - makes it slow
let g:deoplete#enable_at_startup = 0
" settings for deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH . '/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" ## coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" Ripgrep or The Silver Searcher
"if executable('rg')
  "set grepprg=rg\ --color\ never\ --no-heading
  "let g:ctrlp_user_command = 'rg %s --color never --files'
  "let g:ctrlp_use_caching = 0
"elseif executable('ag')
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

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
