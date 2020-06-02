set backspace=2

call plug#begin('~/.vim/bundle')

" If fzf has already been installed via Homebrew, use the existing fzf
" Otherwise, install fzf. The `--all` flag makes fzf accessible outside of vim
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif

Plug 'joshdick/onedark.vim'

call plug#end()

silent! colorscheme onedark
