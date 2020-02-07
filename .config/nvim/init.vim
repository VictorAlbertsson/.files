call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/syntastic'
Plug 'valloric/youcompleteme'
call plug#end()

" More convenient leader key
noremap <Space> <Nop>
sunmap <Space>
let mapleader = "<space>"

" Automatically remove all trailing whitespace
autocmd FileType c,cpp,rs,lisp autocmd BufWritePre <buffer> %s/\s\+$//e

" Hide dotfiles, show with 'gc'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" Required to get YCM Rust completion
" You have to install rust-src nightly with rustup for this path to work
let g:ycm_rust_src_path = '~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
