call plug#begin(stdpath('data') . '/plugged')
" Text Editing
" Generic Programming
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
" Rust IDE
Plug 'rust-lang/rust.vim' | Plug 'vim-syntastic/syntastic'
" LISP IDE
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fireplace'
Plug 'kien/rainbow_parentheses.vim'
Plug 'bhurlow/vim-parinfer'
" Haskell IDE
Plug 'neovimhaskell/haskell-vim'
Plug 'nbouscal/vim-stylish-haskell'
" C# IDE

call plug#end()

" More convenient leader key
noremap <Space> <Nop>
sunmap <Space>
let mapleader = "<space>"

" Automatically remove all trailing whitespace
autocmd FileType c,cpp,cs,rs,lisp,clj,hs autocmd BufWritePre <buffer> %s/\s\+$//e

" Whitespace niceties
set tabstop=2
set shiftwidth=2
set expandtab

" Mitigates an YCM bug, preview popup not closing
" let g:ycm_autoclose_preview_window_after_insertion = 1

" Hide dotfiles, show with 'gc'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" Required to get YCM Rust completion
" You have to install rust-src nightly with rustup for this path to work
" let g:ycm_rust_src_path = '~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

" Format Rust code on save
let g:rustfmt_autosave = 1

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces

" Haskell
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_backpack = 1
