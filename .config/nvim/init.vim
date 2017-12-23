" basics
set number
set relativenumber
set tabstop=2
set shiftwidth=2
" set so=999

" Common typos - credits to Son Dawei
command! Wq wq
command! W w
command! Q q

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
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'

" theme
Plug 'chriskempson/base16-vim'

" Initialize plugin system
call plug#end()

syntax on
set background=dark

" base16 colors
if filereadable(expand("~/.nvimrc_background"))
  let base16colorspace=256
  source ~/.nvimrc_background
endif

" airline-theme
let g:airline_theme='base16_twilight'

" font
" set guifont=Inconsolata:h20

" emmet remapping
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

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
map <c-h> <c-Y>
" swapping line/s down by 1
map - ddp
" swapping line/s up by 1
map _ ddkP
