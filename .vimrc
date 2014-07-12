set title
set number
set ts=2 sts=2 sw=2 expandtab
syntax on
colorscheme molokai
set wildmenu
set scrolloff=5
set cursorline
set hlsearch
set list

map <space> \

" Shortcut to rapidly toggle hidden chars (tabs/newlines)
nnoremap <leader><space> :set list! <CR>

" Shortcut to rapidly toggle search highlighting
nnoremap <leader>/ :set hlsearch! <CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText ctermfg=237 ctermbg=None
highlight SpecialKey ctermfg=237 ctermbg=None

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call SetTab()
function! SetTab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
    call SummarizeTabs()
endfunction

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

" Only do this part when compiled with support for autocommands
if has("autocmd")
    " Enable file type detection
    filetype on

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " Customisations based on house-style (arbitrary)
    "autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    "autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    "autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

    " Treat .rss files as XML
    "autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

"command! -nargs=* Stws call StripTrailingWhitespaces()
function! StripTrailingWhitespaces()
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
autocmd BufWritePre * call StripTrailingWhitespaces()
