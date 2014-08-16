" .vimrc - Developed on OSX Mavericks - may have issues with non-OSX machines

" -------------------
" | .vimrc - Vundle |
" -------------------

" {{{ Vundle
" vim = VI iMproved

" Required Vundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" Plugins

" Better status line
Plugin 'bling/vim-airline'

" Character representation in decimal, octal, and hex with 'ga'
Plugin 'tpope/vim-characterize'

" Git integration (displays branch for Airline)
Plugin 'tpope/vim-fugitive'

" Manipulate surrounding characters and tags
Plugin 'tpope/vim-surround'

" TODO(pcattori): Try out these plugins...
" supertab
" showmarks
" searchcomplete
" youcompleteme
" ultisnips
" nerd commenter
" nerd tree
" syntastic
" ctrl-p
" matchit
" gundo
" abolish
" command-t

" Required Vundle teardown
call vundle#end()
filetype plugin indent on

" }}}

" ----------------------
" | .vimrc - Vimscript |
" ----------------------

" Reload changes to .vimrc automatically | Fix Airline redraw whenever .vimrc is sourced
autocmd! BufWritePost ~/.vimrc source % | AirlineRefresh

" {{{ Terminal font encoding
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8
" }}}

" {{{ Colorscheme/theme
syntax enable
set background=dark
let g:molokai_original=1
colorscheme molokai " solarized, wombat, railscasts, codeschool
" }}}

" {{{ Buffer window
" Display nicely-formatted title
set title titlestring=%F\ %a%r%m

" Number column
set number "numberwidth=5
" }}}

" {{{ Cursor & mouse
" Buffer cursor from top & bottom
set scrolloff=5
" Show cursor row
set cursorline
" Show cursor column
set cursorcolumn
" Don't hide mouse while typing
"set nomousehide " doesn't seem to work...
" }}}

" {{{ Tab
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

" Syntax of these languages is fussy over tabs Vs spaces
autocmd! FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd! FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Customisations based on house-style (arbitrary)
"autocmd! FileType html setlocal ts=2 sts=2 sw=2 expandtab
"autocmd! FileType css setlocal ts=2 sts=2 sw=2 expandtab
"autocmd! FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
" }}}

" {{{ Search
set ignorecase

" Case sensitivity triggered by capital letter
set smartcase

" Search-as-you-type
set incsearch

" Highlight search
set hlsearch
" Clear highlight
" TODO(pcattori): Favor <c-[> over <esc>? Make custom <esc> mapping?
nnoremap <esc> :noh<return><esc>
nnoremap <c-[> :noh<return><c-[>
" }}}

" {{{ Auto-completion
" TODO(pcattori): wildmenu?

" Ctrl-<space> completion
inoremap <c-@> <c-n>

" Disable overridden
inoremap <c-n> <nop>
" }}}

" {{{ Invisible characters
" Show invisible characters
set list

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Invisible character colors
highlight NonText ctermfg=237 ctermbg=None
highlight SpecialKey ctermfg=237 ctermbg=None
" }}}

" {{{ Map leaders
" TODO(pcattori): Should <leader> be used as prefix for all maps?
let mapleader=","
let maplocalleader="//"
" }}}

" {{{ Navigation mappings
" Super-charged cardinals
noremap H ^
noremap J <c-f>
noremap K <c-b>
noremap L $

" Disable bad habits
noremap <left>  <nop>
noremap <down>  <nop>
noremap <up>    <nop>
noremap <right> <nop>

" Disable overridden
noremap ^       <nop>
noremap <c-f>   <nop>
noremap <c-b>   <nop>
noremap $       <nop>

" }}}

" {{{ Syntax enforcement
highlight ErrorMsg ctermfg=White ctermbg=Red

" Show trailing whitespace:
"autocmd! InsertLeave * match ErrorMsg /\s\+$/

" Automatically strip trailing whitespace when exiting insert mode
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
autocmd! InsertLeave * call StripTrailingWhitespace()

function! WarnPastCol(col)
    echom 'warn past!'
    " Regex of the form '/\%>#v.\+/' where # is the column number
    let pastCol = '/\%>' . a:col . 'v.\+/'
    exec 'match ErrorMsg ' .  pastCol
endfunction

" Filetype-dependent column-length warnings
autocmd! FileType java   :call WarnPastCol(100)
autocmd! FileType proto  :call WarnPastCol(80)
autocmd! FileType python :call WarnPastCol(60)
" }}}

" {{{ Recommended mappings (Learn Vimscript the Hard Way)
" Switch current line with below
nnoremap - ddp
" Switch current line with above
nnoremap _ kddpk
" Delete current line
inoremap <c-d> <esc>ddi
" Upper-case current word
nnoremap <c-u> viwU<esc>e
inoremap <c-u> <esc>viwU<esc>ea
" }}}

" No comment nextline-continuation
"autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" {{{ Airline
" Always show status bar
set laststatus=2
" Color theme
let g:airline_theme = 'molokai'
" Beautify with custom font symbols
let g:airline_powerline_fonts = 1
" }}}
