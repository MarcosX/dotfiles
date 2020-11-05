syntax on
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" editor configuration
set backspace=2
set hlsearch
set number
set showmatch
set incsearch
set hidden
set textwidth=0 tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set ruler
set wrap
set dir=/tmp//
set scrolloff=5
set foldmethod=manual
set foldlevelstart=20
set ignorecase
set smartcase

" solarized
syntax enable
set background=light
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" nerdtree
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ctrlp
map <silent> <LocalLeader>ff :CtrlP<CR>
map <silent> <LocalLeader>fb :CtrlPBuffer<CR>
map <silent> <LocalLeader>rt :!/usr/local/bin/ctags -R --exclude=".git\|log\|tmp\|db\|" --extra=+f<CR>

" ag - the silver searcher
" remember to install ag first
map <LocalLeader>aw :Ag '<C-R><C-W>'
" " Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor
" " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" " ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" vim tabs
noremap <silent> <LocalLeader>[ :tabp<CR>
noremap <silent> <LocalLeader>] :tabn<CR>
noremap <silent> <LocalLeader><CR> :tabe<CR>

" Clean empty spaces
nnoremap <silent> <LocalLeader>ww :%s/\s\+$//<CR>:let @/=''<CR><C-o>

" Copy to clipboard
noremap <Leader>Y "+y

" CoC
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
