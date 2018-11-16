syntax on
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins here
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'valloric/youcompleteme'
Plugin 'easymotion/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'thoughtbot/vim-rspec'
Plugin 'benmills/vimux'
Plugin 'pgr0ss/vimux-ruby-test'
Plugin 'tpope/vim-abolish'
Plugin 'rking/ag.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'mxw/vim-jsx'
Plugin 'othree/javascript-libraries-syntax.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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

" tabular
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
	let p = '^\s*|\s.*\s|\s*$'
	if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
		let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
		let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
		Tabularize/|/l1
		normal! 0
		call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
	endif
endfunction

" Vimux ruby tests
map <Leader>rl :wa<CR> :VimuxRunLastCommand<CR>
map <silent> <LocalLeader>rf :RunRubyFocusedTest<CR>
map <silent> <LocalLeader>rc :RunRubyFocusedContext<CR>
map <silent> <LocalLeader>rb :RunAllRubyTests<CR>

" Clean empty spaces
nnoremap <silent> <LocalLeader>ww :%s/\s\+$//<CR>:let @/=''<CR><C-o>

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

noremap <Leader>Y "+y
