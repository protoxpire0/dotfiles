set number
" basics
set relativenumber
set tabstop=2
set shiftwidth=2
" set so=999

" Common typos - credits to Son Dawei
command! Wq wq
command! W w
command! Q q

" folding


" Plugins directory
call plug#begin('~/.local/share/nvim/plugged')

" plugins using plug
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/limelight.vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
" autocloses surrounds
Plug 'jiangmiao/auto-pairs'
" keybindings to quickly add/rm/ch surrounds
Plug 'tpope/vim-surround'
" Plug 'ervandew/supertab'

" Web Dev/Design
Plug 'kabbamine/vcoolor.vim'

" Languages
Plug 'pangloss/vim-javascript'

" theme
Plug 'flazz/vim-colorschemes'
" colorscheme molokai
Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'

" Initialize plugin system
call plug#end()

syntax on
let base16colorspace=256
set t_Co=256 " 256 color mode
set background=dark
colorscheme dracula 

" base16 colors
" if filereadable(expand("~/.nvimrc_background"))
"   let base16colorspace=256
"   source ~/.nvimrc_background
" endif

" airline-theme
let g:airline_theme='minimalist'

" font
set guifont=Menlo:h20

" emmet remapping
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_expandabbr_key = '<tab>'

" fzf
set rtp+=/usr/local/opt/fzf

set hidden
set laststatus=2
set ttimeoutlen=50

" Open up display
function! RandHello()
	let hellos = ["Hello!", "Bonjour, monsieur", "Hola, amigo!", "Hallo", "Ciao!!", "Ola!", "Namaste", "Salaam", "Zdravstvuy", "Ohayo!", "Konnichiwa", "Konban wa", "Ahn young ha se yo", "Merhaba", "Sain Bainuu", "Szia", "Marhaba", "Ni hau", "Nay hoh", "Halo"]
	let n = system("echo `expr $RANDOM % 19`")
	return hellos[n]
endfunction

autocmd VimEnter * echo RandHello()

" Remapping
" scroll down
map <c-j> <c-E>
" scroll up
map <c-k> <c-Y>
" swapping line/s down by 1
map - ddp
" swapping line/s up by 1
map _ ddkP

" splits
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

set splitbelow
set splitright


