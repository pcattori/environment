" .vimrc - Developed on OSX Yosemite (10.10) - may have issues with non-OSX machines

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

" Haml, Sass, Scss syntax
Plugin 'tpope/vim-haml'

" Markdown syntax
Plugin 'tpope/vim-markdown'

" Slim syntax
Plugin 'slim-template/vim-slim'

" Manipulate surrounding characters and tags
Plugin 'tpope/vim-surround'

" Try out these plugins...
" multiple-cursors
" unite
" supertab
" showmarks
" searchcomplete
" youcompleteme
" * ultisnips
" nerd commenter OR tcomment?
" nerd tree
" ctrl-p
" matchit
" gundo
" command-t
" * tasklist
" * repeat

" Required Vundle teardown
call vundle#end()
filetype plugin on


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

" Tab-match
nnoremap <tab>  %
nnoremap %      <nop>


" ---------------
" displaying text
" ---------------

" Terminal font encoding
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8

" Display nicely-formatted title
set title titlestring=%F\ %a%r%m

" Number column
set number "numberwidth=5

" Buffer cursor from top & bottom
set scrolloff=5

" Show cursor row
set cursorline

" Show cursor column
set cursorcolumn

" Use the same symbols as TextMate for tabstops and EOLs
" trail? other special chars?
set listchars=tab:▸\ ,eol:¬

" Invisible character colors
autocmd ColorScheme * highlight NonText ctermfg=237 ctermbg=None
autocmd ColorScheme * highlight SpecialKey ctermfg=237 ctermbg=None


" Show trailing whitespace
autocmd ColorScheme * highlight TrailingWhitespace ctermfg=White ctermbg=Grey
autocmd BufWinEnter * match TrailingWhitespace /\s\+$/


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

" Switch current line with below
nnoremap - ddp
" Switch current line with above
nnoremap _ kddpk
" Upper-case current word
nnoremap <c-u> viwU<esc>e
inoremap <c-u> <esc>viwU<esc>ea

" Underscore
" TODO(pcattori): inoremap <something> _

" No comment nextline-continuation
"autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

function! StripTrailingWhitespace()
    " Save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction


" ------------------
" tabs and indenting
" ------------------

" Soft-tab with 2 space default
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Round to nearest tab multiple
set shiftround

" Set tabstop, softtabstop and shiftwidth to the same value
" Set expandtab according to user input (y/n)
command! -nargs=* SetTab call SetTab()
function! SetTab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    let l:expandtab = input('(y/n) expandtab = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
    if l:expandtab ==# 'y'
        set expandtab
    elseif l:expandtab ==# 'n'
        set noexpandtab
    endif
    call SummarizeTabs()
endfunction

" Display resulting tab settings
command! -nargs=* GetTab call SummarizeTabs()
function! SummarizeTabs()
    try
        echohl ModeMsg
        echon 'tabstop='.&l:ts
        echon ' shiftwidth='.&l:sw
        echon ' softtabstop='.&l:sts
        if &l:et
            echon ' expandtab'
        else
            echon ' noexpandtab'
        endif
    finally
        echohl None
    endtry
endfunction

augroup Tab
  " Syntax of these languages is fussy over tabs & spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType cs setlocal ts=2 sts=2 sw=2 noexpandtab
  "autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  "autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  "autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
augroup END


" -------
" mapping
" -------

" TODO generalize title generation
" vimrc titles
nnoremap T yypVr"llv$r-hr<space>o<esc>x

" Ctrl-<space> completion
inoremap <c-@> <c-n>
inoremap <c-n> <nop>


" -------
" various
" -------

" Always show Airline status bar
set laststatus=2

" Airline color theme
let g:airline_theme = 'molokai'

" Beautify Airline with custom font symbols
let g:airline_powerline_fonts = 1 " must be using powerline font
