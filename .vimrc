set showcmd
"set hidden
"set tw=80

set wildmenu
set wildmode=list,full
set wildignore+=bin/*,*.swp,*.pyc,*~,*#

filetype plugin indent on

set foldlevelstart=99
au FileType python setl sw=4 sts=4 et ts=4 foldmethod=indent cindent cinwords=if,elif,else,for,while,try,except,finally,def,class
au FileType c,cpp setl cindent cinoptions=:0,p0,t0,(1s,(0
au FileType gitcommit setl tw=72

autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertEnter * norm mi
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

vnoremap <silent> al :<c-u>norm!0v$h<cr>
vnoremap <silent> il :<c-u>norm!^vg_<cr>
onoremap <silent> al :norm val<cr>
onoremap <silent> il :norm vil<cr>

set pastetoggle=<F2>
map <F3> :if &mouse == "" <Bar>
             \set mouse=a <Bar>
    	  \else <Bar>
              \set mouse= <Bar>
    	  \endif<cr>
map <silent><F4> :if mapcheck("p", "n") != ""<Bar>
              \unmap p<Bar>
              \unmap y<Bar>
	      \echo "~~~~END WINDOWS MODE~~~~"<Bar>
          \else<Bar>
              \noremap p "+p<Bar>
              \noremap y "+y<Bar>
              \echo "~~~~BEGIN WINDOWS MODE~~~~"<Bar>
          \endif<cr>

nnoremap <C-C> <silent> <C-C>
set completeopt=longest,menuone
inoremap <expr> <TAB> pumvisible() ? '<C-y>' : '<TAB>'

inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
inoremap <Enter> <c-g>u<Enter>

cabbrev <silent> w!! w !sudo tee > /dev/null %
cabbrev <silent> ui :norm `iv`]d

inoremap <c-k> <Esc>lC
nnoremap <c-k> vg_d
vnoremap <c-k> $d

"map <PageUp> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
"map <PageDown> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

set errorformat^=%-G%f:%l:\ warning:%m

nnoremap <F5> :w<cr> :make -j<cr>

autocmd QuickFixCmdPost [^l]* nested vertical botright copen 100
autocmd QuickFixCmdPost    l* nested vertical botright lwindow 100

au BufReadPost quickfix setlocal foldmethod=marker
au BufReadPost quickfix setlocal foldmarker=Entering\ directory,Leaving\ directory
au BufReadPost quickfix normal zq

set cscopequickfix=s-,c-,d-,i-,t-,e-
