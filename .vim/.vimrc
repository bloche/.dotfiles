execute pathogen#infect()

" powerline settings
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled = 0

" general settings
set noshowmode

set number relativenumber
" toggle between ralative and abolute numbering based on context
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

syntax on
filetype plugin indent on
colorscheme ir_black

" all new buffers to hide current buffer
" doesn't force save on current buffer
set hidden

" default indentation rules
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set copyindent

" search rules
set hlsearch
set incsearch
set ignorecase

" use standard backspace mode
set backspace=2

" always jump to next row instad of next line
" when moving cursor up or down
nnoremap j gj
nnoremap k gk
