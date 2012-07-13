" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                   (see gvimrc for gui vim settings)                       |
" |                                                                           |
" | Some highlights:                                                          |
" |   jj = <esc>  Very useful for keeping your hands on the home row          |
" |   ,n = toggle NERDTree off and on                                         |
" |                                                                           |
" |   ,f = fuzzy find all files                                               |
" |   ,b = fuzzy find in all buffers                                          |
" |   ,p = go to previous file                                                |
" |                                                                           |
" |   hh = inserts '=>'                                                       |
" |   aa = inserts '@'                                                        |
" |                                                                           |
" |   ,h = new horizontal window                                              |
" |   ,v = new vertical window                                                |
" |                                                                           |
" |   ,i = toggle invisibles                                                  |
" |                                                                           |
" |   enter and shift-enter = adds a new line after/before the current line   |
" |                                                                           |
" |   :call Tabstyle_tabs = set tab to real tabs                              |
" |   :call Tabstyle_spaces = set tab to 2 spaces                             |
" |                                                                           |
" | Put machine/user specific settings in ~/.vimrc.local                      |
" -----------------------------------------------------------------------------  

filetype on
filetype off

set encoding=utf-8
set laststatus=2
set nocompatible
"let mapleader = ","

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'


" >>>>>>>>>>>>>>>>>>>>>>> Bundles <<<<<<<<<<<<<<<<<<<<<<<<<<
" Color themes
Bundle 'altercation/vim-colors-solarized'
" File types support
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-haml'
Bundle 'digitaltoad/vim-jade'
Bundle 'vim-scripts/JSON.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'wavded/vim-stylus'
Bundle 'kelan/gyp.vim'
" Plugins
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'wincent/Command-T'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'dangerousben/jsonval'
Bundle 'scrooloose/syntastic'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/pythoncomplete'



" Tabs ************************************************************************
"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

function! Tabstyle_4()
  " Using 4 spaces
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set expandtab
"""""""""""""""""""""""""""""""""  set textwidth=79
endfunction

function! Tabstyle_2()
  " Using 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction

call Tabstyle_4()


" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent (local to buffer)


" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4


" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" Vertical and horizontal split then hop to a new buffer
:noremap <Leader>v :vsp^M^W^W<cr>
:noremap <Leader>h :split^M^W^W<cr>


" Cursor highlights ***********************************************************
set cursorline
"set cursorcolumn


" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " Incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase


" Colors **********************************************************************
set t_Co=256 " 256 colors
syntax on " syntax highlighting
let python_highlight_all=1
let python_highlight_indent_errors=0
let python_highlight_space_errors=0
let g:load_doxygen_syntax=1
au! BufRead,BufNewFile *.json setfiletype json
au! BufRead,BufNewFile *.mkd,*.md,*.mdown,*.markdown setfiletype mkd
let g:solarized_termcolors=256
set background=dark
colorscheme solarized


" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
"set ch=2 " Make command line two lines high
"match LongLineWarning '\%120v.*' " Error format when a line is longer than 120
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word


" Directories *****************************************************************
" Setup backup location and enable
"set backupdir=~/backup/vim
"set backup

" Set Swap directory
"set directory=~/backup/vim/swap

" Sets path to directory buffer was loaded from
"autocmd BufEnter * lcd %:p:h


" File Stuff ******************************************************************
filetype plugin on
filetype indent on
" To show current filetype use: set filetype
" HTML/XHTML
autocmd FileType html :set filetype=xhtml
autocmd FileType xhtml setlocal sw=2
autocmd FileType xhtml setlocal ts=2
autocmd FileType xhtml setlocal sts=2
autocmd FileType xhtml setlocal textwidth=0
" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css setlocal sw=2
autocmd FileType css setlocal ts=2
autocmd FileType css setlocal sts=2
autocmd FileType css setlocal textwidth=79
" Stylus (tab width 2 chr, wrap at 79th char)
autocmd FileType stylus setlocal sw=2
autocmd FileType stylus setlocal ts=2
autocmd FileType stylus setlocal sts=2
autocmd FileType stylus setlocal textwidth=79
" Python (tab width 4 chr, wrap at 79th char)
autocmd FileType python setlocal sw=4
autocmd FileType python setlocal ts=4
autocmd FileType python setlocal sts=4
autocmd FileType python setlocal textwidth=0
" JavaScript (tab width 2 chr, wrap at 79th)
autocmd FileType javascript setlocal sw=2
autocmd FileType javascript setlocal ts=2
autocmd FileType javascript setlocal sts=2
autocmd FileType javascript setlocal textwidth=79
" Jade (tab width 2 chr, nowrap)
autocmd FileType jade setlocal sw=2
autocmd FileType jade setlocal ts=2
autocmd FileType jade setlocal sts=2
autocmd FileType jade setlocal textwidth=0
" JSON (tab width 2 chr, nowrap)
autocmd FileType json setlocal sw=2
autocmd FileType json setlocal ts=2
autocmd FileType json setlocal sts=2
autocmd FileType json setlocal textwidth=0
autocmd FileType json set makeprg=~/.vim/bundle/jsonval/jsonval\ %
autocmd FileType json set errorformat=%E%f:\ %m\ at\ line\ %l,%-G%.%#
" GYP (tab width 2 chr, nowrap)
autocmd FileType gyp setlocal sw=2
autocmd FileType gyp setlocal ts=2
autocmd FileType gyp setlocal sts=2
autocmd FileType gyp setlocal textwidth=0



" Insert New Line *************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>
"set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)


" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize


" Invisible characters *********************************************************
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap <Leader>i :set list!<CR> " Toggle invisible chars


" Mouse ***********************************************************************
set mouse=a " Enable the mouse
nnoremap <F12> :call ToggleMouse() <CR>
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
        set nonumber
        echo "Mouse usage diabled"
    else
        set mouse=a
        set number
        echo "Mouse usage enabled"
    endif
endfunction
behave xterm
"set selectmode=mouse


" Misc settings ***************************************************************
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how
set nofoldenable " Turn off folding 


" Navigation ******************************************************************

" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

map <Leader>p <C-^> " Go to previous file


" Ruby stuff ******************************************************************
"compiler ruby         " Enable compiler support for ruby
"map <F5> :!ruby %<CR>


" Omni Completion *************************************************************
:set completeopt=longest,menuone
autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" May require ruby compiled in
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete 


" Hard to type *****************************************************************
"imap uu _
"imap hh =>
"imap aa @


" -----------------------------------------------------------------------------  
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------  

" NERDTree ********************************************************************
:noremap <Leader>n :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=1 " User instead of Netrw when doing an edit /foobar
let NERDTreeMouseMode=1 " Single click for everything


" NERD Commenter **************************************************************
let NERDCreateDefaultMappings=0 " I turn this off to make it simple

" Toggle commenting on 1 line or all selected lines. Wether to comment or not
" is decided based on the first line; if it's not commented then all lines
" will be commented
:map <Leader>c :call NERDComment(0, "toggle")<CR> 


" SnippetsEmu *****************************************************************
"imap <unique> <C-j> <Plug>Jumper
"let g:snip_start_tag = "_\."
"let g:snip_end_tag = "\._"
"let g:snip_elem_delim = ":"
"let g:snip_set_textmate_cp = '1'  " Tab to expand snippets, not automatically.


" CommandT ********************************************************
let g:CommandTMatchWindowAtTop = 1
map <Leader>f :CommandT<CR>


" fuzzyfinder ********************************************************
" I'm using CommandT for main searching, but it doesn't do buffers, so I'm
" using FuzzyFinder for that
map <Leader>b :FufBuffer<CR>
"let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db'


" SuperTab ******************************************************************
let g:SuperTabDefaultCompletionType = "context"


" TagBar *******************************************************************
nnoremap <silent> <F8> :TagbarToggle<cr>


" Gundo ********************************************************************
nnoremap <Leader>u :GundoToggle<CR>

" Powerline ****************************************************************
let Powerline_symbols = "fancy"

" JS Hint ********************************************************************
"let syntastic_enable_signs = 1
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*


" -----------------------------------------------------------------------------  
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" -----------------------------------------------------------------------------  

" Mac *************************************************************************
"if has("mac") 
  "" 
"endif
 
" Windows *********************************************************************
"if has("gui_win32")
  "" 
"endif



" -----------------------------------------------------------------------------  
" |                               Startup                                     |
" -----------------------------------------------------------------------------  
" Open NERDTree on start
" autocmd VimEnter * exe 'NERDTree' | wincmd l 



" -----------------------------------------------------------------------------  
" |                               Host specific                               |
" -----------------------------------------------------------------------------  
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

:set pastetoggle=<F3>

"if hostname() == "foo"
  " do something
"endif

" Example .vimrc.local:

"call Tabstyle_tabs()
"colorscheme ir_dark
"match LongLineWarning '\%120v.*'

"autocmd User ~/git/some_folder/* call Tabstyle_spaces() | let g:force_xhtml=1
