set guifont=Consolas:h11:cDEFAULT
set showcmd
set ruler

if has("clipboard")
    " CTRL-X and SHIFT-Del are Cut
    vnoremap <C-X> "+x
    vnoremap <S-Del> "+x

    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C> "+y
    vnoremap <C-Insert> "+y
    
    imap <C-v> <Esc>"+p
    map <C-z> <Esc>u
    imap <C-z> <Esc>u
endif

" behave xterm
filetype plugin indent on
syntax on

set cinoptions=:0,p0,t0,(1s,(0
