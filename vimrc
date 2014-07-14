" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                   (see gvimrc for gui vim settings)                       |
" |                                                                           |
" | Some highlights:                                                          |
" |   ,n = toggle NERDTree off and on                                         |
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

if has('vim_starting')
   set nocompatible
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

filetype off
set encoding=utf-8
set laststatus=2
set timeoutlen=50
set ttyfast
set clipboard=unnamed

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" :::                                                    :::
" :::                      Bundles                       :::
" :::                                                    :::
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

"
" -----------------------------------  
" |       File types support        |
" -----------------------------------  
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'vim-scripts/JSON.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kelan/gyp.vim'
NeoBundle 'vim-scripts/Vim-R-plugin'
NeoBundle 'JuliaLang/julia-vim'
"NeoBundle 'fatih/vim-go'
let vimrplugin_screenplugin = 0
let vimrplugin_assign = 0


" -----------------------------------  
" |              Plug-ins           |
" -----------------------------------  
"
" ::::::::::::   Ctrl-P  :::::::::::::::
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<Leader>p'


" ::::::::::::   TagBar   ::::::::::::::
NeoBundle 'majutsushi/tagbar'
let g:tagbar_left = 1
autocmd VimEnter *py nested :call tagbar#autoopen(1)
nnoremap <Leader>t :TagbarToggle<CR>


" ::::::::::::   NERDTree   :::::::::::::::
NeoBundle 'scrooloose/nerdtree', { 'augroup' : 'NERDTreeHijackNetrw'}
let NERDTreeHijackNetrw=1 " User instead of Netrw when doing an edit /foobar
let NERDTreeMouseMode=1 " Single click for everything
NeoBundle 'jistr/vim-nerdtree-tabs'
:noremap <Leader>n :NERDTreeTabsToggle<CR>


" ::::::::::::   NERD Commenter   ::::::::::::::
NeoBundle 'scrooloose/nerdcommenter'


" ::::::::::::   Surround   ::::::::::::::
NeoBundle 'tpope/vim-surround'


" ::::::::::::   SuperTab   ::::::::::::::
NeoBundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = '<c-x><c-o>'


" ::::::::::::   FuGitive   ::::::::::::::
NeoBundle 'tpope/vim-fugitive', {'augroup': 'fugitive'}


" ::::::::::::   FuGitive   ::::::::::::::
NeoBundle 'airblade/vim-gitgutter' 


" ::::::::::::   Gundo   ::::::::::::::
NeoBundle 'sjl/gundo.vim'
nnoremap <Leader>u :GundoToggle<CR>


" ::::::::::::   EasyMotion   ::::::::::::::
NeoBundle 'Lokaltog/vim-easymotion'


NeoBundle 'dangerousben/jsonval'


" ::::::::::::   Jedi (python)   :::::::::::::
NeoBundle 'davidhalter/jedi-vim'


" ::::::::::::   YCM (code completion)   :::::::::::::
"NeoBundle 'Valloric/YouCompleteMe'


" ::::::::::::   Syntastic   :::::::::::::
NeoBundle 'scrooloose/syntastic'
let syntastic_enable_signs = 0
let syntastic_auto_jump = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


 "::::::::::::   UltiSnips   :::::::::::::
NeoBundle 'guns/ultisnips'
imap <C-l> <C-r>=UltiSnips_ListSnippets()<CR>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" ::::::::::::   delimitMate   :::::::::::::
NeoBundle 'Raimondi/delimitMate'


" ::::::::::::   Airline   :::::::::::::
NeoBundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extenions#branch#enabled = 1


" ::::::::::::   PowerLine   :::::::::::::
"set rtp+=~/.vim/powerline/bindings/vim


" ::::::::::::   Python Folding   :::::::::::::
NeoBundle 'agrimaldi/SimpylFold'


" ::::::::::::   Rainbow-Parenthesis   :::::::::::::::
NeoBundle 'vim-scripts/Rainbow-Parenthesis'


" ::::::::::::   vim-rooter   :::::::::::::::
NeoBundle 'airblade/vim-rooter'


" ::::::::::::   Multiple Cursors   ::::::::::::::
NeoBundle 'terryma/vim-multiple-cursors'


" ::::::::::::   AutomaticLatexPlugin   :::::::::::::::
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
let g:LatexBox_latexmk_options = '-pvc -bibtex'
let g:LatexBox_viewer = '/Applications/Skim.app/Contents/MacOS/Skim'
let g:LatexBox_output_type = 'pdf'
let g:LatexBox_autojump = 1


" ::::::::::::   Hardtime   ::::::::::::::
"NeoBundle 'takac/vim-hardtime'
"let g:hardtime_default_on = 1
"let g:hardtime_allow_different_key = 1
"let g:hardtime_maxcount = 3


" -----------------------------------  
" |              Colors             |
" -----------------------------------  
"NeoBundle 'altercation/vim-colors-solarized'
"let g:solarized_termcolors=256
"let g:solarized_diffmode="high"

NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
NeoBundle 'nanotech/jellybeans.vim'


call neobundle#end()

NeoBundleCheck


filetype plugin indent on
syntax on
set t_Co=256 " 256 colors
"colorscheme Jellybeans
colorscheme Tomorrow-Night
"set background=dark
"colorscheme solarized
hi Normal ctermbg=NONE
"highlight clear SignColumn


" Misc settings ***************************************************************
set backspace=indent,eol,start
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how
set nofoldenable " Turn off folding 
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
" printing
set pdev=pdf
set printoptions=paper:A4,syntax:y,wrap:y,number:y


" Line numbering
set relativenumber
"set number
autocmd InsertEnter * :set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
"autocmd InsertLeave * :set number
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
        set number
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>


" Tabs ************************************************************************
"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

function! Tabstyle_4()
  " Using 4 spaces
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set expandtab
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
set sidescrolloff=5
set numberwidth=4


" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" Vertical and horizontal split then hop to a new buffer
:noremap <Leader>v :vsp<cr>
:noremap <Leader>h :split<cr>
" Move around split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Cursor highlights ***********************************************************
set cursorline
set cursorcolumn


" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " Incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase
set gdefault
set showmatch
nnoremap <leader><space> :noh<cr>


" Colors **********************************************************************
let python_highlight_all=1
let python_highlight_indent_errors=1
let python_highlight_space_errors=1
let g:load_doxygen_syntax=1


" Status Line *****************************************************************
set showcmd
set wildmenu
set wildmode=list:longest
set ruler " Show ruler
"set ch=2 " Make command line two lines high
"match LongLineWarning '\%120v.*' " Error format when a line is longer than 120
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word
set formatoptions=qrn1
set colorcolumn=80


" Persistant undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
au FocusLost * :wa
" Directories *****************************************************************
" Setup backup location and enable
"set backupdir=~/backup/vim
"set backup

" Set Swap directory
"set directory=~/backup/vim/swap

" Sets path to directory buffer was loaded from
"autocmd BufEnter * lcd %:p:h


" File Stuff ******************************************************************
" To show current filetype use: set filetype
au! BufRead,BufNewFile *.json setfiletype json
au! BufRead,BufNewFile *.mkd,*.md,*.mdown,*.markdown setfiletype mkd
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

:set pastetoggle=<F3>


" Navigation ******************************************************************
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>


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
" reselect last selected chunk
nnoremap <leader>V V`]



" -----------------------------------------------------------------------------  
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" -----------------------------------------------------------------------------  

" Mac *************************************************************************
if has("mac")
    
    " Clipboard interaction
    nnoremap <C-y> :w !pbcopy<CR><CR>
    vnoremap <C-y> :w !pbcopy<CR><CR>
    nnoremap <C-p> :w !pbpaste<CR><CR>
    vnoremap <C-p> :w !pbpaste<CR><CR>

endif
 
" Linux ***********************************************************************
if has("unix")

    nnoremap <C-y> "+y
    vnoremap <C-y> "+y
    nnoremap <C-p> "+p
    vnoremap <C-p> "+p
        
endif



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


"if hostname() == "foo"
  " do something
"endif

" Example .vimrc.local:

"call Tabstyle_tabs()
"colorscheme ir_dark
"match LongLineWarning '\%120v.*'

"autocmd User ~/git/some_folder/* call Tabstyle_spaces() | let g:force_xhtml=1
