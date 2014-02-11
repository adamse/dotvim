" ==============
" Basic settings {{{
" ==============

" Allow pathogen to be a bundle
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Enable pathogen plugin handling
execute pathogen#infect()

set nocompatible

" Show relativenumber
set number

" Allow hidden buffers
set hidden

" Don't update the display while executing macros
set lazyredraw

" Get rid of the silly characters in window separators
set fillchars=""


" }}}
" -------
" Editing {{{
" -------

" Syntax highlight on
syntax on

" Colorscheme
colorscheme Tomorrow-Night-Bright

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Set the default filetype to text
autocmd BufEnter * if &filetype == "" | setlocal ft=text | endif

" 'c' commands place an $ at end of text
set cpoptions=Bces$

" allow backspace to erase previously entered text
set backspace=indent,eol,start

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

" Autoindent!
set autoindent

" Enable search highlighting and incrementally match
set hlsearch
set incsearch

" Ignore case when matching
set ignorecase
set smartcase

" Enable foldmethod=marker
set foldmethod=marker

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" Share clipboard with osx
"set clipboard=unnamed

" Sane zencoding shortcut
let g:user_zen_expandabbr_key = '<c-e>'

" Default to global replace
set gdefault

" Open quickfix window after greps
autocmd QuickFixCmdPost *grep* cwindow

" Ignore some files when autocompleting in Ex
set wildignore=.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.hi,*.aux


" }}}
" ---------
" Statusbar {{{
" ---------

" Keep some stuff in the history
set history=100

" Show the current command in the lower right corner
set showcmd

" Always show statusbar
set laststatus=2

" Command line 2 high
set cmdheight=2

set ruler

set showmode

" Nice command completion
set wildmenu

set statusline=%f\          " Path to file
set stl+=%y\                " filetype
set stl+=%m\       					" modified?
set stl+=%r\  							" readonly?
set stl+=Line:%l/%L[%p%%]\  " line number info
set stl+=Col:%c\   				  " column info
set stl+=Buf:%n\            " buffer number
set stl+=[%b][0x%B]         " char code

" }}}
" ---
" GUI {{{
" ---

" Font
set guifont=Monaco:h12
set noantialias

" No toolbars, no tabbar
set guioptions=ac

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175


" }}}
" ----------
" Keymapping {{{
" ----------

let mapleader = ","
let maplocalleader = "+"

nnoremap j gj
nnoremap k gk

inoremap kj <esc>

" Move around windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" -/+ to move a line down/up
nnoremap - ddp
nnoremap _ ddkP

" <C-u> to uppercase word under cursor
"inoremap <C-u> <esc>viwUi
"nnoremap <C-u> viwU

" Edit and source $MYVIMRC
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Go to beginning/end of line
noremap H 0
noremap L $
" Go to begging/end of file
noremap J G
noremap K gg

" Quote current word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" Surround selection with quotes
vnoremap <leader>" <esc>a"<esc>gvo<esc>i"<esc>
vnoremap <leader>' <esc>a'<esc>gvo<esc>i'<esc>

" Edit in/around next/last ()
onoremap in( :<C-u>normal! f(vi(<cr>
onoremap il( :<C-u>normal! F)vi(<cr>
onoremap an( :<C-u>normal! f(vi(loh<cr>
onoremap al( :<C-u>normal! F(vi(loh<cr>

" Edit in/around next/last []
onoremap in[ :<C-u>normal! f[vi[<cr>
onoremap il[ :<C-u>normal! F[vi[<cr>
onoremap an[ :<C-u>normal! f[vi[loh<cr>
onoremap al[ :<C-u>normal! F]vi[loh<cr>

" Edit in/around next/last {}
onoremap in{ :<C-u>normal! f{vi{<cr>
onoremap il{ :<C-u>normal! F}vi{<cr>
onoremap an{ :<C-u>normal! f{vi{loh<cr>
onoremap al{ :<C-u>normal! F}vi{loh<cr>

" Compile (make) a program
nnoremap <C-m> :w<CR>:make %<CR>

" Find todos in files
command! Todos vimgrep TODO: **/*

" åöä for special chars
"set keymap=svenska
"set langmap=ö[Ö{ä]Ä}å\\Å|

" }}}
" ----------
" Plugins {{{
" ----------

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1
let NERDTreeSortOrder=['\/$', '\.java$', '*', '\.swp$', '\~$']
let NERDTreeIgnore=['\.class', '\.fls', '\.aux', '\.pdf', '\.dvi', '\.fdb_latexmk', '\.pyc']

nnoremap <leader>n :NERDTreeToggle<cr>

" Yes, strip trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

set foldlevelstart=20
