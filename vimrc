" .vimrc - Developed on OSX El Capitan (10.11) - requires vim >= 7.4
set nocompatible " vim = VI iMproved

" Load vim-plug
" if empty(glob("~/.vim/autoload/plug.vim"))
"     execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"         \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" endif

" Plugins
" -------

call plug#begin('~/.vim/plugged')

Plug 'ervandew/supertab' " Code completion
Plug 'flazz/vim-colorschemes', {'do': 'ln -s ~/.vim/plugged/vim-colorschemes/colors ~/.vim/colors'} " ALL THE COLORS!
Plug 'terryma/vim-multiple-cursors' " Sublime-like cursors
Plug 'tpope/vim-abolish' " Case coercion
Plug 'tpope/vim-characterize' " Character representation in decimal, octal, and hex with 'ga'
Plug 'tpope/vim-commentary' " Comments
Plug 'tpope/vim-repeat' " Repeat plugin actions via '.'
Plug 'tpope/vim-surround' " Manipulate surrounding characters and tags
Plug 'vim-airline/vim-airline' " Better status line
Plug 'vim-airline/vim-airline-themes' " color themes for airline

" Language syntax support
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'tpope/vim-markdown', {'for': 'markdown'}

"Plug 'easymotion/vim-easymotion'
"Plug 'godlygeek/tabular'
"Plug 'junegunn/vim-easy-align'
"Plug 'scrooloose/syntastic' " Syntax checking
"Plug 'valloric/youcompleteme'

"Plug 'sjl/gundo'
"Plug 'tmhedberg/SimpylFold'
"Plug 'tpope/vim-abolish' " Super-charged search, substitution, and abbreviations
"Plug 'tpope/vim-fugitive' " Git integration (displays branch for Airline)

call plug#end()

" Leader
" ------

let mapleader = " "
nnoremap <space> <nop>

" -------------------------------------
" moving around, searching and patterns
" -------------------------------------

" Searching
set ignorecase
set smartcase " Case sensitivity triggered by capital letter
set incsearch " Search-as-you-type
set hlsearch " Highlight search
" Clear search and dismiss highlights
nnoremap <silent> <backspace> :let @/ = ""<return>

" Super-charged cardinals
noremap H ^
noremap J <c-f>
noremap K <c-b>
noremap L $

noremap ^       <nop>
noremap <c-f>   <nop>
noremap <c-b>   <nop>
noremap $       <nop>

" Disable bad habits
noremap <left>  <nop>
noremap <down>  <nop>
noremap <up>    <nop>
noremap <right> <nop>

" ---------------
" displaying text
" ---------------

" Terminal font encoding
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8

" Display nicely-formatted title
set title titlestring=%F\ %a%r%m

" Number column
set number
autocmd ColorScheme * highlight LineNr ctermfg=grey ctermbg=235

" Cursor
set scrolloff=7 " Buffer cursor from top & bottom
" Show cursor crosshairs
set cursorline
set cursorcolumn

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" Invisible character colors
autocmd ColorScheme * highlight NonText ctermfg=237 ctermbg=None
autocmd ColorScheme * highlight SpecialKey ctermfg=237 ctermbg=None

" Show trailing whitespace
autocmd BufWinEnter * match TrailingWhitespace /\s\+$/
autocmd ColorScheme * highlight TrailingWhitespace ctermbg=White

" Suggestive line stop
set colorcolumn=81
autocmd ColorScheme * highlight ColorColumn ctermbg=233

" ---------------------------------
" syntax, highlighting and spelling
" ---------------------------------

" Colorscheme/theme
syntax enable
set background=dark
let g:molokai_original=1
colorscheme molokai " solarized, wombat, railscasts, codeschool

" ------------
" editing text
" ------------

set viminfo='20,<1000,s1000 " Increase clipboard size

" Quick underscore
inoremap <c-@> _

" Switch current line with below
nnoremap - ddp
" Switch current line with above
nnoremap _ kddpk

" No comment nextline-continuation
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
" Start without highlighting
autocmd BufNewFile,BufRead * let @/ = ""

" Fix backspaces
set backspace=indent,eol,start

" ------------------
" tabs and indenting
" ------------------

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab " Soft-tab with 4 space default
set shiftround " Round to nearest tab multiple

augroup Tab " Syntax of these languages is fussy over tabs & spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" -------
" mapping
" -------

" easier escape
inoremap ;; <esc>
vnoremap ;; <esc>

" make 'Y' behave like other capitals
nnoremap Y y$

" toggle invisibles
nnoremap <Leader>i :set list!<CR>

" Persist visual selection after shift
vnoremap < <gv
vnoremap > >gv

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" yank visual selection into clipboard for easy copy/paste
vnoremap <Leader>y "*y

" toggle paste-mode
nnoremap <Leader>p :set paste!<CR>

" -------
" plugins
" -------

set laststatus=2 " Always show Airline status bar
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme = 'wombat' " Airline color theme

" local customization
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
