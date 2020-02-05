" fnamemodify from https://stackoverflow.com/a/18734557
let script_dir = resolve(fnamemodify(resolve(expand('<sfile>:p')), ':h'))

execute 'source ' . script_dir . '/FileExists.vim'

let vim_plug_init = script_dir . '/VimPlugInit.vim'
if FileExists(vim_plug_init)
    execute 'source ' . vim_plug_init
endif

:set mouse=r
syntax on

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Show line numbers
set number
" Use the desktop clipboard by default
let g:clipbrdDefaultReg = '+'
" Highlight all search hits
set hlsearch

" Highlight trailing whitespace
" From: https://vim.fandom.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" Draw Column
set colorcolumn=80,100
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" For tmux coloring
set background=dark

let add_on_script = script_dir . '/PlugIns.vim'
if FileExists(add_on_script)
    execute 'source ' . add_on_script
endif
