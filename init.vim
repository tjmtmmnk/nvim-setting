let mapleader = "\<Space>"

"========================================="
" plugin Manager: dein.vim setting
"========================================="
if &compatible
    set nocompatible
endif
  
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

let g:dein#install_max_processes = 16

"========================================="
" setting
"========================================="
filetype plugin indent on

syntax enable
autocmd ColorScheme * highlight LineNr guifg=DarkGrey
set cursorline
hi clear CursorLine
colorscheme molokai
set number
set ignorecase
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls
set termguicolors
set hidden
"for lightline
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

"use zsh
set shell=/bin/zsh
let $SHELL = "/bin/zsh"

nnoremap <CR> $
nnoremap <BS> ^
nnoremap d "_d
xnoremap d "_d
nnoremap x "_x
nnoremap <ESC><ESC> :nohl<CR>
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>

runtime! hand_made/*.vim
