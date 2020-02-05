" TODO: Break each section into its own file. 1 file per plugin.
" Allow NERDTREE to make new files
set modifiable
" Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
" Disable syntastic checkers for LaTeX
let g:syntastic_tex_checkers = []
" Vimtex setup
let g:tex_flavor = "latex"
let g:vimtex_compiler_latexmk = {
    \ 'background' : 1,
    \ 'build_dir' : 'build',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
        \ '-verbose',
        \ '-file-line-error',
        \ '-synctex=1',
        \ '-interaction=nonstopmode',
    \ ],
\ }
autocmd BufNewFile,BufRead *.cls   set syntax=tex
" YouCompleteMe setup
let g:ycm_show_diagnostics_ui = 0
" Powerline setup
let g:airline_powerline_fonts = 1
" YouCompleteMe setup
let g:ycm_filetype_blacklist = {
	\ 'tex' : 1,
	\ 'plaintex' : 1,
	\ 'rst' : 1,
	\ 'markdown' : 1,
\}
" Snippets setup
" From: https://github.com/SirVer/ultisnips/blob/master/README.md#quick-start
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
