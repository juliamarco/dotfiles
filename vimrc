set backspace=indent,eol,start
set backupskip=/tmp/*,/private/tmp/*
set cmdheight=2
set complete+=kspell
set complete-=i
set hidden
set history=1000
set hlsearch
set incsearch
set laststatus=2
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set mouse=nvi
set nofoldenable
set nojoinspaces
set number
set scrolloff=1
set shiftround
set sidescrolloff=5
set smartcase
set statusline=[%n]\ %<%f\ %h%m%r%w%=%-14.(%l,%c%V%)\ %P
set synmaxcol=200
set t_RV=
set textwidth=100
set ttimeout
set ttimeoutlen=50
set updatetime=1000
set wildmode=list:longest,list:full
syntax enable

call plug#begin('~/.vim/bundle')

" If fzf has already been installed via Homebrew, use the existing fzf
" Otherwise, install fzf. The `--all` flag makes fzf accessible outside of vim
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif

Plug 'joshdick/onedark.vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby'

call plug#end()

silent! colorscheme onedark
