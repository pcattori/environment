" .vimrc - Developed on OSX El Capitan (10.11)

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
"Plugin 'tpope/vim-abolish'

" Better status line
Plugin 'bling/vim-airline'

" Syntax checking
"Plugin 'scrooloose/syntastic'

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

" Manipulate surrounding characters and tags
Plugin 'tpope/vim-surround'

" Language syntax support
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-haml'
Plugin 'lepture/vim-jinja'
Plugin 'tpope/vim-markdown'
Plugin 'slim-template/vim-slim'

" Try out these plugins...
" showmarks
" youcompleteme
" nerd commenter OR tcomment?
" ctrl-p
" matchit
" gundo
" command-t
" * tasklist

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
set colorcolumn=80
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


" ------------
" editing text
" ------------

" Quick underscore
inoremap <c-@> _

" Switch current line with below
nnoremap - ddp
" Switch current line with above
nnoremap _ kddpk
" Upper-case current word
nnoremap <c-l> viwu<esc>e
inoremap <c-l> <esc>viwu<esc>ea
nnoremap <c-u> viwU<esc>e
inoremap <c-u> <esc>viwU<esc>ea

" No comment nextline-continuation
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Fix multiple cursor backspace
set backspace=indent,eol,start

" ------------------
" tabs and indenting
" ------------------

" Soft-tab with 2 space default
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

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

" Persist visual selection after shift
vnoremap < <gv
vnoremap > >gv

" map sort function to a key
vnoremap <Leader>s :sort<CR>


" -------
" various
" -------

" Always show Airline status bar
set laststatus=2
let g:airline_left_sep=''
let g:airline_right_sep=''

" Airline color theme
let g:airline_theme = 'wombat'
