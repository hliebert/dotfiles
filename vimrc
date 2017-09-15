" Load plugins for vim-plugin
call plug#begin('~/.vim/plugged')
Plug 'yegappan/mru'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Gundo'
Plug 'jalvesaq/Nvim-R'
Plug 'vim-scripts/Wombat'
Plug 'vim-scripts/wombat256.vim'
Plug 'sheerun/vim-wombat-scheme'
Plug 'molok/vim-vombato-colorscheme'
Plug 'junegunn/seoul256.vim'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/csapprox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
"Plug 'vim-scripts/taglist.vim'
"Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'vim-scripts/Align'
"Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'
"Plug 'airblade/vim-gitgutter'
"Plug 'jreybert/vim-magit'
"Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-markdownfootnotes'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc-after'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'vim-ctrlspace/vim-ctrlspace'
"Plug 'Shougo/denite.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'terryma/vim-multiple-cursors'
Plug 'klen/python-mode'
Plug 'hdima/python-syntax'
Plug 'Yggdroot/indentLine'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'blindFS/vim-taskwarrior'
"Plug 'chrisbra/csv.vim'
"Plug 'garbas/vim-snipmate'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'ivanov/vim-ipython'
"Plug 'jpalardy/vim-slime'
"Plug 'julienr/vimux-pyutils'
"Plug 'raimondi/delimitmate'
"Plug 'bronson/vim-trailing-whitespace'
"Plug 'jceb/vim-orgmode'
"Plug 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX' "version too old, add manually
"Plug 'flazz/vim-colorschemes'
Plug '~/.vim/vim-latex'
Plug '~/.vim/mycolorschemes'
call plug#end()

set nocompatible
filetype plugin on
filetype indent on
syntax on

" maximize window on startup, windows
"au GUIEnter * simalt ~x

"" Appearance
set background=dark
" csapprox can also approx one scheme, comment then
"if has('gui_running')
    "colorscheme wombat22
"else
    "colorscheme wombat256
"endif

"" seoul256 (dark):
""   Range:   233 (darkest) ~ 239 (lightest)
""   Default: 237
"let g:seoul256_background = 234
"colorscheme seoul256

colorscheme vombato
"colorscheme wombat22
"colorscheme jellybeans
"colorscheme darkspectrum
"colorscheme neverness
"colorscheme ir_black
"colorscheme desert
"colorscheme xoria256
"colorscheme tesla
"autocmd WinEnter,FileType vim,tex,* colorscheme darkspectrum
"autocmd WinEnter,FileType stata,R,python,perl,sh colorscheme wombat22


"set guifont=DejaVu\ Sans\ Mono\:h10
"set guifont=DejaVu\ Sans\ Mono\ 9
"set guifont=Monospace\ 9
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Book\ 9
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Book\ 9
" set guifont=Fira\ Mono\ for\ Powerline\ 9 
" using Source Code Pro
" set anti enc=utf-8
"set guifont=Source\ Code\ Pro\ 10
"set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
"set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
"set guifont=Menlo\ 10
"set guifont=Monaco\ 10
"set guifont=Cousine\ 9
"set guifont=Ubuntu\ Mono\ 11
" set guifont=Inconsolata\ for\ Powerline\ 11
"set guifont=Consolas\ 11
"set guifont=Ubuntu\ Mono\ 12
"set guifont=Inconsolata\ 10
"set guifont=Consolas\ 9
"set guifont=Hack\ 9
set guioptions-=T
set guioptions-=m
set guioptions+=b
set stal=1
set number

" encoding
set encoding=utf-8 "The encoding displayed.
"set fileencodings=utf-8,iso-8859-1,iso-8859-15 "The encoding written to file.

"set encoding=iso-8859-1 " The encoding displayed.
"set fileencodings=iso-8859-1 " The encoding written to file.
"set encoding=utf-8  " The encoding displayed.
"set fileencoding=utf-8  " The encoding written to file.
"au FileType stata set encoding=iso-8859-1 " The encoding displayed
"au FileType stata set fileencoding=iso-8859-1 " The encoding written to file.


" more editing related stuff
set scrolloff=3
" set nowrap
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
"set wildmode=list:full
"set visualbell
"set vb t_vb=
set novisualbell
set noerrorbells
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set shellslash
set splitright
set splitbelow
" also use system clipboard
set clipboard=unnamed,unnamedplus
"set clipboard+=unnamedplus
" set clipboard=unnamedplus
"set clipboard+=unnamed
"set clipboard=unnamed
nnoremap yy yy"+yy
vnoremap y ygv"+y


" searching / moving / stuff from system file, check /etc/vim/vimrc
set ignorecase
set infercase
set wildignorecase
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch
set autowrite " Automatically save before commands like :next and :make
set mouse=a	" Enable mouse usage (all modes)

" kill ex mode once and for all
nnoremap Q <nop>

" jump to the last position when reopening a file
if has("autocmd")
 au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" format and wrap
set wrap
set textwidth=79
"set linebreak=79
set formatoptions=qrn1
"set formatoptions=qrna
"set colorcolumn=85

""disable folding or set foldmethod
set nofoldenable
"set foldmethod=syntax

" tabs and indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set sw=4


" whitespace
set nojoinspaces
"set list
"set listchars=tab:?\ ,eol:Â¬


" handle backup and undo files
"silent execute '!mkdir "'.$VIMRUNTIME.'/temp"'
"silent execute '!del "'.$VIMRUNTIME.'/temp/*~"'
set backupdir=~/.backup-vim//
set directory=~/.backup-vim//
set undodir=~/.backup-vim//

" autosave when changing buffer
"au FocusLost * :wa


" " Spellchecking
" "set spell
" au Filetype tex set spell
" au Filetype tex syntax spell toplevel
" set spelllang=en,en_us,de


" Markdown
" Setting markdown as the standard text mark mode
"au BufNewFile,BufRead *.txt set ft=mkd
"autocmd BufNewFile,BufRead *.md set filetype=markdown
" Setting automatic linebreak after 80 chars
"au Filetype mkd set tw=80


" redefine mapleader
let mapleader = ","
let maplocalleader = ","

" enter cml w/o shift
" nnoremap ; :

"" Automatically save and restore foldview
"au BufWinLeave ?* mkview
"au BufWinEnter ?* silent loadview

""Statusbar
"set laststatus=2
"set statusline=
"set statusline+=%2*%-3.3n%0*\ " buffer number
"set statusline+=%f\ " file name
"set statusline+=%h%1*%m%r%w%0* " flag
"set statusline+=[
"if v:version >= 600
 "set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
 "set statusline+=%{&encoding}, " encoding
"endif
"set statusline+=%{&fileformat}] " file format
"if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
 "set statusline+=\ %{VimBuddy()} " vim buddy
"endif
"set statusline+=%= " right align
""set statusline+=%2*0x%-8B\ " current char
"""set statusline+=0x%-8B\ " current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P " offset


""""""""""" Customizations """"""""""""""""""""""



" disable arrow movement to force learning hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"" R assignment operator
"au FileType R inoremap - <-
"au FileType R inoremap -- -

"open MRU list, try ctrlp for a change
noremap <F3> :MRU<CR>
"noremap <F3> :CtrlPMRU<CR>
"noremap <S-F3> :CtrlPMixed<CR>

" Fast saving
"nmap <leader>w :w!<cr>

" map Y to yank until end of line
function! YRRunAfterMaps()
    nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction
nnoremap Y y$

" buffer navigation, needs to be fixed for terminal use
noremap <C-S-tab> :bprevious<CR>
noremap <C-tab> :bnext<CR>
noremap <C-F4> :bdelete<CR>
"noremap <C-t> :tabnew<CR>
" bdelete second shortcut
"nnoremap qq :q<CR>
"nnoremap wq :wq<CR>

" file shortcuts
com Vimrc :tabnew ~/.vimrc

" searching etc, clear highlight
nnoremap <leader><space> :noh<cr>
" alternatively: toggle highlight
"map  <leader><space> :set hls!<CR>
"imap <leader><space> <ESC>:set hls!<CR>a
"vmap <leader><space> <ESC>:set hls!<CR>gv
" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
"nnoremap <tab> %
"vnoremap <tab> %
"nnoremap / /\v
"vnoremap / /\v

"" Fast code-block formatting
"nnoremap <F10> 1G=G
"inoremap <F10> <ESC>1G=Ga

" working directory
nnoremap <silent> <Leader>cd :cd %:p:h<CR>
" home directory
nnoremap <silent> <Leader>ho :cd /home/helge/<CR>
"set autochdir


" insert blank line, conflicts with vim-surround plugin
"noremap <C-s> :put =''<CR>
"noremap <C-a> :put =''<CR>k

" deal with trailing whitespace
nnoremap <F4> :/\s\+$<CR>
nnoremap <silent> <S-F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Nerdtree
"noremap <F2> :NERDTreeToggle /home/helge<CR>
noremap <F2> :NERDTreeToggle %:p:h<CR>

"" CtrLP
let g:ctrlp_map = '<C-t>'
"let g:ctrlp_map = '<C-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_map = '<leader>t'
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>m :CtrlPMRU<CR>
""nnoremap <leader>m CtrlPBuffer<CR>
"nnoremap <leader>b :CtrlPPMixed<CR>

" insert current date, filename, dir path
"nnoremap <F10> "=strftime("%c")<CR>P
"inoremap <F10> <C-R>=strftime("%c")<CR>
inoremap <F10> <C-R>=strftime("%d-%m-%y")<CR>
"inoremap <F10> <C-R>=strftime("%a, %d %b %Y")<CR>
iab <expr> dts strftime("%c")
inoremap <leader>fn <C-R>=expand("%:t")<CR>
inoremap <leader>fd <C-R>=expand("%:p:h")<CR>

" rewrap
nnoremap <leader>q gwap
"nnoremap <leader>q gqip
nnoremap <leader>gq Vgq
" latex conscious rewrap, not working?
"map <leader>ggl ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>gq//-1<CR>
"omap lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>//-1<CR>.<CR>

" pasting and indentation
"set pastetoggle=<F7>
" reselect pasted line
"nnoremap <leader>vl V`]
"reselect pasted text
nnoremap <leader>v `[v`]

" quick esc
inoremap jj <ESC>

" open vertical split and go there
nnoremap <leader>w <C-w>v<C-w>l

" moving between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" show yankring contents
nnoremap <silent> <F6> :YRShow<cr>
inoremap <silent> <F6> <ESC>:YRShow<cr>

"" insert comment lines / boxes
"function! InsertHLine()
    "let n = 80-col('.')
    "let myline = repeat('-', n)
    "return myline
"endfunction
"inoremap <expr> <C-o> InsertHLine()
"

" NERD commenter
let NERDSpaceDelims=1
" stata comment ignoring endofline ///
nnoremap <leader>cx 0v/\/\/\/<CR>BE:'<,'>call NERDComment('x','comment')<CR>
"nnoremap <leader>cx 0v/\/\/\/<CR>hh:'<,'>call NERDComment('x','comment')<CR>

nnoremap <silent> <leader>hel 020i%<Esc>a<Space><Esc>$a<Space><Esc>60a%<Esc>80\|D0
nnoremap <silent> <leader>hes 020i*<Esc>a<Space><Esc>$a<Space><Esc>60a*<Esc>80\|D0
nnoremap <silent> <leader>her 020i#<Esc>a<Space><Esc>$a<Space><Esc>60a#<Esc>80\|D0

nnoremap <leader>cot O//<Esc>76A*<Esc>i//<Esc>80\|D<CR>i// Filename: <C-R>=expand("%:t")<CR><CR>// Created on: <C-R>=strftime("%c")<CR><CR>// Last modified: <C-R>=strftime("%c")<CR><CR>// Note: <CR>//<Esc>76A*<Esc>i//<Esc>80\|D<Esc>kA
nnoremap <leader>cox O<ESC>80A/<Esc>80\|D<CR>i// Filename: <C-R>=expand("%:t")<CR><CR>// Created on: <C-R>=strftime("%c")<CR><CR>// Last modified: <C-R>=strftime("%c")<CR><CR>// Note: <CR><Esc>80A/<Esc>80\|D<Esc>kA
nnoremap <leader>cos O<ESC>80A*<Esc>80\|D<CR>i** Filename: <C-R>=expand("%:t")<CR><CR>** Created on: <C-R>=strftime("%c")<CR><CR>** Last modified: <C-R>=strftime("%c")<CR><CR>** Note: <CR><Esc>80A*<Esc>80\|D<Esc>kA
nnoremap <leader>col O<ESC>80A%<Esc>80\|D<CR>i%% Filename: <C-R>=expand("%:t")<CR><CR>%% Created on: <C-R>=strftime("%c")<CR><CR>%% Last modified: <C-R>=strftime("%c")<CR><CR>%% Note: <CR><Esc>80A%<Esc>80\|D<Esc>kA
nnoremap <leader>cov O<ESC>80A"<Esc>80\|D<CR>i"" Filename: <C-R>=expand("%:t")<CR><CR>"" Created on: <C-R>=strftime("%c")<CR><CR>"" Last modified: <C-R>=strftime("%c")<CR><CR>"" Note: <CR><Esc>80A"<Esc>80\|D<Esc>kA
nnoremap <leader>cor O<ESC>80A#<Esc>80\|D<CR>i## Filename: <C-R>=expand("%:t")<CR><CR>## Created on: <C-R>=strftime("%c")<CR><CR>## Last modified: <C-R>=strftime("%c")<CR><CR>## Note: <CR><Esc>80A#<Esc>80\|D<Esc>kA
"nnoremap <leader>cp O//<Esc>76A*<Esc>i//<Esc>80\|D<CR>i/<CR><Esc>i//<Esc>76A*<Esc>i//<Esc>80\|D<Esc>kA
nnoremap <leader>cp O<Esc>80A#<Esc>80\|D<CR>i##<CR><Esc>80A#<Esc>80\|D<Esc>kA


" find lines longer than 80
nnoremap <leader>lo /\%>80v.\+<cr>






""""""""""" Functions and Plugins """"""""""""""""

"" highlicht text that goes past 80 chars in a line
"augroup vimrc_autocmds
  "autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  "autocmd BufEnter * match OverLength /\%81v.*/
"augroup END

" format latex tables (not working fully, marks them at least then <leader>tt
au FileType tex nnoremap <leader>tb /\\toprule<CR>jV/\\bottomrule<CR>k


"" Python
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" Tagbar
nnoremap <leader>tl :TagbarToggle<CR>

"" R
"let vimrplugin_vsplit = 1
"let vimrplugin_ca_ck = 1
"let g:ScreenImpl = 'Tmux'
"let vimrplugin_vimpager = "horizontal"
"let g:vimrplugin_conqueplugin = 1
"let vimrplugin_conquevsplit = 1
"let r_syntax_folding = 1
"set nofoldenable

"" Nvim-R plugin
let R_nvimpager = "vertical"
let R_clear_line = 1
let R_editor_w = 80
let R_editor_h = 60

"" STATA DO-FILE SCRIPTS
fun! RunIt()
  w
  "!sh "/home/helge/.rundo.sh" "%:p"
  !sh "/home/helge/dotfiles/rundo.sh" "%:p"
endfun
au FileType stata noremap <F8> :<C-U>call RunIt()<CR><CR>
"au FileType stata inoremap  <F8> <Esc>:<C-U>call RunIt()<CR><CR>
fun! RunDoLines()
  let selectedLines = getbufline('%', line("'<"), line("'>"))
 if col("'>") < strlen(getline(line("'>")))
  let selectedLines[-1] = strpart(selectedLines[-1], 0, col("'>"))
  endif
 if col("'<") != 1
  let selectedLines[0] = strpart(selectedLines[0], col("'<")-1)
  endif
 let temp = tempname() . ".do"
 call writefile(selectedLines, temp)
          "exec "!sh /home/helge/.rundo.sh " . temp
          exec "!sh /home/helge/dotfiles/rundo.sh " . temp
    "au VimLeave * exe "!del -y" temp
    au VimLeave * silent exe '!del /Q "'.$TEMP.'\*.tmp.do"'
endfun
au FileType stata noremap <F9> :<C-U>call RunDoLines()<CR><CR>
au FileType stata noremap <leader>se :<C-U>call RunDoLines()<CR><CR>
au FileType stata noremap <leader>l <S-v>:<C-U>call RunDoLines()<CR><CR>
""au FileType stata nnoremap <F9> :<C-U>call RunDoLines()<CR><CR>
""au FileType stata inoremap <F9> <Esc>:<C-U>call RunDoLines()<CR><CR>
""au FileType stata nnoremap <S-Space> :<C-U>call RunDoLines()<CR><CR>
""au FileType stata inoremap <S-Space> <Esc>:<C-U>call RunDoLines()<CR><CR>
"useful idea, fix this sometime
"fun! RunHelp()
  "w
  "!sh "/home/helge/.runhelp.sh" "%:p"
"endfun
"au FileType stata noremap <leader>rh <viwy>:<C-U>call RunHelp()<CR><CR>


" Tag modifications
" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
  if &modified
    let save_cursor = getpos(".")
    let n = min([20, line("$")])
    exe '1,' . n . 's#^\(.\{,10}Last modified: \).*#\1' .
          \ strftime("%c") . '#e'
          "\ strftime('%a %b %d, %Y  %I:%M%p') . '#e'
    call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModified()



" Toggle wrap and horizontal scrollbar
function ToggleWrap()
    set wrap!
    echo &wrap ? 'wrap' : 'nowrap'
endfunc

"F11 toggles wrap
nnoremap <silent> <F11>      :call ToggleWrap()<CR>
vnoremap <silent> <F11> <C-C>:call ToggleWrap()<CR>
inoremap <silent> <F11> <C-O>:call ToggleWrap()<CR>

function ToggleHorizontalScrollbar()
    "set guioptions+=b
    if &go =~# "b"
        set go-=b
    else
        set go+=b
    endif
endfunc

function ToggleHorizontalScrollbar_setKeys()
    "Shift+F11 toggles the horizontal scrollbar
    nnoremap <silent> <S-F11>      :call ToggleHorizontalScrollbar()<CR>
    vnoremap <silent> <S-F11> <C-C>:call ToggleHorizontalScrollbar()<CR>
    inoremap <silent> <S-F11> <C-O>:call ToggleHorizontalScrollbar()<CR>
endfunc

au GUIEnter * call ToggleHorizontalScrollbar_setKeys()

"if has("statusline")
 "set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
"endif



"""Word count function
function! WC()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
    let result = system(cmd)
    echo result . " words"
endfunction

command WC call WC()



""CSApprox
"force terminal to use 256 colors
set t_Co=256
"avoiding annoying CSApprox warning message
"fix this some other time
"let g:CSApprox_verbose_level = 0



"" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
nnoremap <S-F6> :SyntasticToggleMode<cr>
nnoremap <F6> :SyntasticCheck<cr>
"let g:syntastic_disabled_filetypes=['html,tex,latex']
" disable by default, for all filetypes
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" crtl-w E to check and activate at once
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
"let g:pymode_rope = 1
let g:pymode_rope = 0
" if rope activated, it hangs sometimes, use this to prevent it
let g:pymode_rope_lookup_project = 0
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"disable checking in favor of syntastic!
let g:pymode_lint = 0
"Linting
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes"
"let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
"let g:pymode_lint_write = 1
" Support virtualenv
"let g:pymode_virtualenv = 1
" Enable breakpoints plugin
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>b'
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0


"" slime python
"let g:slime_python_ipython = 1

" disable youcomplete me for now with filteype stata
" due to problems with latin1/iso encoding
let g:enable_ycm_at_startup = 0
let g:loaded_youcompleteme = 1
" or
"let g:ycm_filetype_blacklist = { 'stata': 1 }


" vim-indent-guides
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1

" vim-indent-line
"let g:indentLine_concealcursor = 'inc'
"let g:indentLine_conceallevel = 2
" indent char, 'c' can be any ASCII character. You can use one of ¦, ┆, or │ to display more beautiful lines.
" However, will only work in UTF-8 encoded files
"let g:indentLine_char = 'c'
" disable by default
let g:indentLine_enabled = 0
" map same hotkey as vim-indent-guides
"nnoremap <leader>ig :IndentLinesToggle<CR>
" or map to leader il mnemonic
nnoremap <leader>il :IndentLinesToggle<CR>


" UtilSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



" airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"

" air-line
" from https://vi.stackexchange.com/questions/3359/how-to-fix-status-bar-symbols-in-airline-plugin
"https://stackoverflow.com/questions/30780045/why-vim-airline-is-not-showing-symbols-properly
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" Vim-sneak
let g:sneak#s_next = 1
" let g:sneak#label = 1

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

