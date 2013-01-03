" -----------------------------------------------------------------------------  
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" -----------------------------------------------------------------------------  

" Mac *************************************************************************
if has("mac")
    set guifont=Menlo\ for\ Powerline:h12

    " Interact with clipboard
    nnoremap <C-y> :w !pbcopy<CR><CR>
    vnoremap <C-y> :w !pbcopy<CR><CR>
    nnoremap <C-p> :w !pbpaste<CR><CR>
    vnoremap <C-p> :w !pbpaste<CR><CR>

    " Use PeepOpen to find files in directory tree
    "if !hasmapto('<Plug>PeepOpen')
    map <silent> <Leader>p <Plug>PeepOpen
    "endif

endif
 
" Linux ***********************************************************************
if has("unix")

    set guioptions-=T

    nnoremap <C-y> "+y
    vnoremap <C-y> "+y
    nnoremap <C-p> "+p
    vnoremap <C-p> "+p

endif


