" Basic settings

" Allow pathogen to be a bundle
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Enable pathogen plugin handling
execute pathogen#infect()

set nocompatible

" Allow hidden buffers
set hidden

" Don't update the display while executing macros
set lazyredraw

" Get rid of the silly characters in window separators
set fillchars=""


" EDITING

" Syntax highlight on
syntax on

" Colorscheme
set background=dark " Solarized background
colorscheme solarized

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Allow per directory .vimrc
set exrc
set secure

" Normal stuff
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

set ttimeout
set ttimeoutlen=50

set incsearch

" to clear the highlighting of :set hlsearch.
nnoremap <silent> <C-i> :nohlsearch<CR>

set laststatus=2
set ruler
set showcmd
set wildmenu

set autoread
set fileformats+=mac

" Set the default filetype to text
autocmd BufEnter * if &filetype == "" | setlocal ft=text | endif

" 'c' commands place an $ at end of text
set cpoptions=Bces$

" Cursor can enter invalid positions
set virtualedit=block,onemore

" Cursor stays 8 from top and bottom
set scrolloff=10

" Highlight line at cursor
set cursorline

" Set tab to 2 spaces
set shiftwidth=2
set tabstop=2
set expandtab

" Enable search highlighting and incrementally match
set hlsearch

" Ignore case when matching
set ignorecase
set smartcase

" Enable foldmethod=marker
set foldmethod=marker

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" Share clipboard with osx
"set clipboard=unnamed

" Default to global replace
set gdefault

" Open quickfix window after greps
autocmd QuickFixCmdPost *grep* cwindow

" Ignore some files when autocompleting in Ex
set wildignore=.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.hi,*.aux

" Show linenumbers
" Set absolute and relative linenumbers in different modes
if version >= 703 " vim >= 7.3 supports relative linenumbers
  set relativenumber

  au FocusLost * :set number
  au FocusGained * :set relativenumber
  au InsertEnter * :set number
  au InsertLeave * :set relativenumber
elseif
  set number
endif


" Statusbar

" Keep some stuff in the history
set history=100

" Command line 2 high
set cmdheight=2

set ruler

set showmode

set statusline=%f\          " Path to file
set stl+=%y\                " filetype
set stl+=%m\       					" modified?
set stl+=%r\  							" readonly?
set stl+=Line:%l/%L[%p%%]\  " line number info
set stl+=Col:%c\   				  " column info
set stl+=Buf:%n\            " buffer number
set stl+=[%b][0x%B]         " char code


" Keymapping {{{

let mapleader = ","
let maplocalleader = "+"

nnoremap j gj
nnoremap k gk

" Move around windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" <C-u> to uppercase word under cursor
"inoremap <C-u> <esc>viwUi
"nnoremap <C-u> viwU

" Edit and source $MYVIMRC
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Go to beginning/end of line
noremap H 0
noremap L $

" Compile (make) a program
nnoremap <C-m> :w<CR>:make %<CR>

" Find todos in files
command! Todos vimgrep TODO: **/*


" Plugins

" EasyTags for haskell

let g:easytags_languages = {
\   'haskell': {
\       'cmd': '/Users/adam/.cabal/bin/hasktags',
\       'args': ['-c'],
\       'fileoutput_opt': '-f',
\       'stdout_opt': '-f-'
\   }
\}

" NeoComplete
"let g:neocomplete#enable_at_startup=1
"let g:neocomplete#disable_auto_complete=1
"inoremap <expr><Tab> neocomplete#start_manual_complete()


" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1
let NERDTreeSortOrder=['\/$', '\.java$', '*', '\.swp$', '\~$']
let NERDTreeIgnore=['\.class', '\.fls', '\.aux', '\.pdf', '\.dvi', '\.fdb_latexmk', '\.pyc']

nnoremap <silent> <leader>n :NERDTreeToggle<cr>
nnoremap <silent> <leader>b :NERDTreeFind<cr>

set foldlevelstart=20
