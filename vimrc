set autowrite
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
set splitright
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
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby'

call plug#end()

silent! colorscheme onedark

" System clipboard integration
nnoremap gy "*y
nnoremap gY "*y$
nnoremap gp "*p
nnoremap gP "*P
vnoremap gy "*y
vnoremap gp "*p
vnoremap gP "*P

nnoremap <silent> <C-L> :nohlsearch <C-R>=has("diff") ? "<Bar>diffupdate" : ""<CR><CR><C-L>
nnoremap <Space><Space> :FZF<CR>

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

augroup ReleaseSwapfiles
  autocmd!

  autocmd BufWritePost,BufReadPost,BufLeave *
        \ if isdirectory(expand("<amatch>:h")) |
        \   let &swapfile = &modified |
        \ endif
augroup END

let g:rails_projections = {
      \  "app/controllers/*_controller.rb": {
      \     "test": [
      \       "spec/requests/{}_spec.rb",
      \       "spec/requests/{}_request_spec.rb",
      \       "spec/controllers/{}_controller_spec.rb",
      \       "test/controllers/{}_controller_test.rb"
      \     ],
      \     "alternate": [
      \       "spec/requests/{}_spec.rb",
      \       "spec/requests/{}_request_spec.rb",
      \       "spec/controllers/{}_controller_spec.rb",
      \       "test/controllers/{}_controller_test.rb"
      \     ],
      \   },
      \   "app/services/*.rb": {
      \     "command": "service",
      \     "test": [
      \       "spec/services/%s_spec.rb",
      \       "test/services/%s_test.rb"
      \     ],
      \   },
      \   "app/graphql/*.rb": {
      \     "command": "graphql",
      \     "test": [
      \       "spec/graphql/{}_spec.rb",
      \       "test/graphql/{}_test.rb"
      \     ],
      \   },
      \   "config/routes.rb": { "command": "routes" },
      \   "spec/*_spec.rb": {
      \     "dispatch": "bin/rspec spec/{}_spec.rb`=v:lnum ? ':'.v:lnum : ''`",
      \   },
      \   "spec/requests/*_spec.rb": {
      \     "alternate": "app/controllers/{}_controller.rb"
      \   },
      \   "spec/requests/*_request_spec.rb": {
      \     "alternate": "app/controllers/{}_controller.rb"
      \   },
      \ }
