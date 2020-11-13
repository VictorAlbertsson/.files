call plug#begin(stdpath('data') . '/plugged')
" Text Editing
" Generic Programming
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
" Rust IDE
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
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
" Plug 'nbouscal/vim-stylish-haskell'
call plug#end()

" More convenient leader key
" noremap <Space> <Nop>
" sunmap <Space>
let mapleader = " "

" Automatically remove all trailing whitespace
autocmd FileType c,cpp,cs,rs,lisp,clj,hs autocmd BufWritePre <buffer> %s/\s\+$//e

" Whitespace niceties
set tabstop=2
set shiftwidth=2
set expandtab

" Easy unhighlight
nnoremap <leader>h :noh<cr>

" Hide dotfiles, show with 'gc'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" ConTeXt
fun! ConTeXtClean()
  let l:currdir = expand("%:p:h")
  let l:tmpdirs = ['out'] " Temporary directories
  let l:suffixes = ['aux', 'bbl', 'blg', 'fls', 'log', 'tuc', 'synctex'] " Suffixes of temporary files
  for ff in glob(l:currdir . '/*.{' . join(l:suffixes, ',') . '}', 1, 1)
    call delete(ff)
  endfor
  for dd in l:tmpdirs
    let l:subdir = l:currdir . '/' . dd
    if isdirectory(l:subdir)
      for ff in glob(l:subdir . '/*.{' . join(l:suffixes, ',') . '}', 1, 1)
        call delete(ff)
      endfor
    endif
    call delete(l:subdir) " Delete directory (only if empty)
  endfor
  echomsg "Aux files removed"
endf

nnoremap <leader>tt :<c-u>update<cr>:ConTeXt<cr>:call ConTeXtClean()<cr>

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
