" .vimrc - Developed on macOS El Capitan (10.11)
" Requires vim >= 7.4

" -------------------------------------------------
" | Vundle @ https://github.com/gmarik/Vundle.vim |
" -------------------------------------------------

" vim = VI iMproved
set nocompatible

" Required Vundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" Plugins
" -------

" Super-charged search, substitution, and abbreviations
Plugin 'tpope/vim-abolish'

" Better status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Ruby bundler goodies
Plugin 'tpope/vim-bundler'

" Character representation in decimal, octal, and hex with 'ga'
Plugin 'tpope/vim-characterize'

" Git integration (displays branch for Airline)
Plugin 'tpope/vim-fugitive'

" Sublime-like cursors
Plugin 'terryma/vim-multiple-cursors'

" Repeat plugin actions via '.'
Plugin 'tpope/vim-repeat'

" Code completion
Plugin 'ervandew/supertab'

" Comment manipulation
Plugin 'tomtom/tcomment_vim'

" Manipulate surrounding characters and tags
Plugin 'tpope/vim-surround'

" Folding
Plugin 'tmhedberg/SimpylFold'
Plugin 'nelstrom/vim-markdown-folding'

" Syntax checking
"Plugin 'scrooloose/syntastic'

" Language syntax support
Plugin 'fatih/vim-go'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'lepture/vim-jinja'
Plugin 'slim-template/vim-slim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'derekwyatt/vim-scala'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'

" Try out these plugins...
" gundo

" Required Vundle teardown
call vundle#end()
filetype plugin on

" Leader
" ------

let mapleader = " "
nnoremap <space> <nop>


" -------------------------------------
" moving around, searching and patterns
" -------------------------------------

" Case sensitivity triggered by capital letter
set ignorecase
set smartcase

" Search-as-you-type
set incsearch

" Highlight search
set hlsearch

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

" Buffer cursor from top & bottom
set scrolloff=5

" Show cursor row
set cursorline

" Show cursor column
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

" Folding
set foldmethod=indent
set nofoldenable

" Increase clipboard size
set viminfo='20,<1000,s1000


" ------------
" editing text
" ------------

" Quick underscore
inoremap <c-@> _

" Switch current line with below
nnoremap - ddp
" Switch current line with above
nnoremap _ kddpk

" No comment nextline-continuation
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Fix multiple cursor backspace
set backspace=indent,eol,start

" ------------------
" tabs and indenting
" ------------------

" Soft-tab with 4 space default
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Round to nearest tab multiple
set shiftround

augroup Tab
  " Syntax of these languages is fussy over tabs & spaces
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


" -------
" various
" -------

" Always show Airline status bar
set laststatus=2
let g:airline_left_sep=''
let g:airline_right_sep=''

" Airline color theme
let g:airline_theme = 'wombat'
