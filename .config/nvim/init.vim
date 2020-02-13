call plug#begin(stdpath('data') . '/plugged')
" General
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
" Syntax and Semantics
Plug 'scrooloose/syntastic'
Plug 'valloric/youcompleteme'
" LISP IDE
Plug 'tpope/vim-sexp-mappings-for-regular-people' | Plug 'guns/vim-sexp' | Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'
Plug 'tpope/vim-salve' | Plug 'tpope/vim-projectionist' | Plug 'tpope/vim-dispatch' | Plug 'tpope/vim-fireplace'
Plug 'kien/rainbow_parentheses.vim'
Plug 'bhurlow/vim-parinfer'
call plug#end()

" More convenient leader key
noremap <Space> <Nop>
sunmap <Space>
let mapleader = "<space>"

" Automatically remove all trailing whitespace
autocmd FileType c,cpp,rs,lisp,clj autocmd BufWritePre <buffer> %s/\s\+$//e

" Mitigates an YCM bug, preview popup not closing
let g:ycm_autoclose_preview_window_after_insertion = 1

" Hide dotfiles, show with 'gc'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" Required to get YCM Rust completion
" You have to install rust-src nightly with rustup for this path to work
let g:ycm_rust_src_path = '~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
