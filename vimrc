"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Filename: .vimrc
"" Created on: Thu 02 Nov 2017 07:30:54 PM CET
"" Last modified: Fri 10 Nov 2017 05:14:59 PM CET
"" Note: My vimrc. Mostly cleaned now.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" vim-plug: load plugins """""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
"""""""""""""""""""" Appearance """""""""""""""""""""""""""""""""""""""""""""""
"Plug 'flazz/vim-colorschemes'
Plug 'molok/vim-vombato-colorscheme'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
"""""""""""""""""""" Editing """"""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/YankRing.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/Align'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-gtfo'
"""""""""""""""""""" Completion """""""""""""""""""""""""""""""""""""""""""""""
"Plug 'Shougo/denite.vim'
" Plug 'Shougo/deoplete.nvim'
" Plug 'ajh17/VimCompletesMe'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"""""""""""""""""""" Feature support """"""""""""""""""""""""""""""""""""""""""
" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'sjl/gundo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'yegappan/mru'
"""""""""""""""""""" Language support """""""""""""""""""""""""""""""""""""""""
Plug 'lervag/vimtex'
Plug 'jalvesaq/Nvim-R'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'vim-pandoc/vim-pandoc-after'
" Plug 'vim-pandoc/vim-rmarkdown'
Plug 'klen/python-mode'
Plug 'hdima/python-syntax'
"Plug 'airblade/vim-gitgutter'
"Plug 'jreybert/vimagit'
"Plug 'tpope/vim-fugitive'
"""""""""""""""""""" Misc """""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug '~/.vim/vim-latex'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Appearance """""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if (has("termguicolors"))
  set termguicolors
endif

" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Book\ 11
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Book\ 11
set guifont=Fira\ Mono\ for\ Powerline\ 11
" set guifont=Source\ Code\ Pro\ for\ Powerline\ 11
" set guifont=Pragmata\ Pro\ 11

" colorscheme vombato
" colorscheme onedark
colorscheme one
" colorscheme nord
set background=dark
" set background=light

" Airline (alternative: lightline)
" let g:airline_theme='wombat'
" let g:airline_theme='onedark'
let g:airline_theme='one'
" let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Basic settings  """"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype plugin on
filetype indent on
syntax on

set guioptions-=T
set guioptions-=m
set guioptions+=b
set stal=1
set number
set relativenumber
set scrolloff=3
" set nowrap
set autoindent
set showmode
set showcmd
set hidden
set novisualbell
set noerrorbells
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
set shellslash
set splitright
set splitbelow
set ignorecase
set infercase
set smartcase
set wildignorecase
set wildmenu
set wildmode=list:longest
"set wildmode=list:full
"set gdefault
set incsearch
set showmatch
set hlsearch
set autowrite
set mouse=a
" set clipboard+=unnamedplus
set clipboard=unnamedplus,unnamed
set encoding=utf-8
" format and wrap
set wrap
set textwidth=79
"set linebreak=79
"set colorcolumn=85
set formatoptions=qrn1
"set formatoptions=qrna
set nofoldenable
"set foldmethod=syntax
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set sw=2
set nojoinspaces
"set list
"set listchars=tab:?\ ,eol:Â¬

" " Spellchecking
" "set spell
" au Filetype tex set spell
" au Filetype tex syntax spell toplevel
" set spelllang=en,en_us,de

" handle backup and undo files
if !isdirectory($HOME . '/.backup-vim')
    call mkdir($HOME . '/.backup-vim', 'p')
endif
set undodir=~/.backup-vim//
set backupdir=~/.backup-vim//
set directory=~/.backup-vim//

" redefine mapleader
let mapleader = ","
let maplocalleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Customizations """""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" disable arrow movement to force learning hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"vnoremap <up> <nop>
"vnoremap <down> <nop>
"vnoremap <left> <nop>
"vnoremap <right> <nop>

" navigating long lines
nnoremap j gj
nnoremap k gk

" kill ex mode once and for all
nnoremap Q <nop>

" make search results appear in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" open vertical split and go there
nnoremap <leader>w <C-w>v<C-w>l

" moving between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" clear search highlight
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" buffer navigation, needs to be fixed for terminal use
" TODO maybe mimick spacemacs navigation here
noremap <C-S-tab> :bprevious<CR>
noremap <C-tab> :bnext<CR>
noremap <C-F4> :bdelete<CR>
noremap <C-w> :bdelete<CR>

" directories
nnoremap <silent> <Leader>cd :cd %:p:h<CR>
nnoremap <silent> <Leader>ho :cd /home/helge/<CR>
"set autochdir

" reselect pasted text
nnoremap <leader>v `[v`]

" open vimrc
com Vimrc :tabnew ~/.vimrc

" enter cml w/o shift
" nnoremap ; :

" quick esc
inoremap fd <ESC>

" mark and delete trailing whitespace
nnoremap <F4> :/\s\+$<CR>
nnoremap <silent> <S-F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" insert current date, filename, dir path
inoremap <F10> <C-R>=strftime("%Y-%m-%d")<CR>
iab <expr> dts strftime("%c")
inoremap <leader>fn <C-R>=expand("%:t")<CR>
inoremap <leader>fd <C-R>=expand("%:p:h")<CR>

" rewrap text
nnoremap <leader>q gwap
"nnoremap <leader>q gqip
nnoremap <leader>gq Vgq
" TODO latex conscious rewrap

" map Y to yank until end of line (different due to yankring)
function! YRRunAfterMaps()
    nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction
nnoremap Y y$


" find lines longer than 80
nnoremap <leader>lo /\%>80v.\+<cr>

" minor comment delimiters
nnoremap <silent> <leader>hel 020i%<Esc>a<Space><Esc>$a<Space><Esc>60a%<Esc>80\|D0
nnoremap <silent> <leader>hes 020i*<Esc>a<Space><Esc>$a<Space><Esc>60a*<Esc>80\|D0
nnoremap <silent> <leader>her 020i#<Esc>a<Space><Esc>$a<Space><Esc>60a#<Esc>80\|D0

" TODO major comment delimiters
nnoremap <leader>cp O<Esc>80A#<Esc>80\|D<CR>i##<CR><Esc>80A#<Esc>80\|D<Esc>kA

" comment file headers
nnoremap <leader>cos O<ESC>80A*<Esc>80\|D<CR>i** Filename: <C-R>=expand("%:t")<CR><CR>** Created on: <C-R>=strftime("%c")<CR><CR>** Last modified: <C-R>=strftime("%c")<CR><CR>** Note: <CR><Esc>80A*<Esc>80\|D<Esc>kA
nnoremap <leader>col O<ESC>80A%<Esc>80\|D<CR>i%% Filename: <C-R>=expand("%:t")<CR><CR>%% Created on: <C-R>=strftime("%c")<CR><CR>%% Last modified: <C-R>=strftime("%c")<CR><CR>%% Note: <CR><Esc>80A%<Esc>80\|D<Esc>kA
nnoremap <leader>cov O<ESC>80A"<Esc>80\|D<CR>i"" Filename: <C-R>=expand("%:t")<CR><CR>"" Created on: <C-R>=strftime("%c")<CR><CR>"" Last modified: <C-R>=strftime("%c")<CR><CR>"" Note: <CR><Esc>80A"<Esc>80\|D<Esc>kA
nnoremap <leader>cor O<ESC>80A#<Esc>80\|D<CR>i## Filename: <C-R>=expand("%:t")<CR><CR>## Created on: <C-R>=strftime("%c")<CR><CR>## Last modified: <C-R>=strftime("%c")<CR><CR>## Note: <CR><Esc>80A#<Esc>80\|D<Esc>kA

" jump to the last position when reopening a file
if has("autocmd")
 au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" strip trailing whitespace when saving
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType tex,markdown,mkd,latex,python,r,stata autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

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

" Toggle wrap
function ToggleWrap()
    set wrap!
    echo &wrap ? 'wrap' : 'nowrap'
endfunc
nnoremap <silent> <F11>      :call ToggleWrap()<CR>
vnoremap <silent> <F11> <C-C>:call ToggleWrap()<CR>
inoremap <silent> <F11> <C-O>:call ToggleWrap()<CR>

" Toggle horizontal scrollbar
function ToggleHorizontalScrollbar()
    "set guioptions+=b
    if &go =~# "b"
        set go-=b
    else
        set go+=b
    endif
endfunc
function ToggleHorizontalScrollbar_setKeys()
    nnoremap <silent> <S-F11>      :call ToggleHorizontalScrollbar()<CR>
    vnoremap <silent> <S-F11> <C-C>:call ToggleHorizontalScrollbar()<CR>
    inoremap <silent> <S-F11> <C-O>:call ToggleHorizontalScrollbar()<CR>
endfunc
au GUIEnter * call ToggleHorizontalScrollbar_setKeys()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Plugin/Filetype configurations """""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Nerdtree
noremap <F2> :NERDTreeToggle %:p:h<CR>

" Yankring
nnoremap <silent> <F6> :YRShow<cr>
inoremap <silent> <F6> <ESC>:YRShow<cr>

" Tagbar
nnoremap <leader>tl :TagbarToggle<CR>
" nnoremap <silent> <F9> :TagbarToggle<CR>

" Vim-sneak
let g:sneak#s_next = 1
" let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" MRU
noremap <F3> :MRU<CR>

" CtrLP
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_by_filename = 1
let g:ctrlp_map = '<C-t>'
"let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>m :CtrlPMRU<CR>
" nnoremap <leader>b CtrlPBuffer<CR>
nnoremap <leader>b :CtrlPMixed<CR>
" noremap <F3> :CtrlPMRU<CR>

" NERD commenter
let NERDSpaceDelims=1
" stata comment ignoring endofline ///
nnoremap <leader>cx 0v/\/\/\/<CR>BE:'<,'>call NERDComment('x','comment')<CR>

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Gutentags
" let g:gutentags_ctags_tagfile = '.tags'
" let g:gutentags_project_root = ['.projectile']

" YouCompleteMe
" may need to disable youcompleteme with filteype stata
" due to problems with latin1/iso encoding in spd code files
" let g:ycm_filetype_blacklist = { 'stata': 1 }

"Ale
let g:airline#extensions#ale#enabled = 1

" " Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" nnoremap <S-F6> :SyntasticToggleMode<cr>
" nnoremap <F6> :SyntasticCheck<cr>
" "let g:syntastic_disabled_filetypes=['html,tex,latex']
" " disable by default, for all filetypes
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" " crtl-w E to check and activate at once
" nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

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

" Latex/Vimtex
let g:tex_flavor = "latex"
let g:vimtex_complete_recursive_bib = 1
let g:vimtex_index_split_pos = 'vert rightbelow'
" Disable overfull/underfull \hbox warnings
let g:vimtex_quickfix_latexlog = {'overfull' : 0, 'underfull' : 0}
" mark latex table between toprule/bottomrule
au FileType tex nnoremap <leader>tb /\\toprule<CR>jV/\\bottomrule<CR>k

" Markdown/Pandoc
let g:pandoc#after#modules#enabled = ["supertab", "ultisnips"]

" Nvim-R plugin
let R_nvimpager = "vertical"
let R_clear_line = 1
let R_editor_w = 80
let R_editor_h = 60
let R_in_buffer = 0

" Stata do-file scripts
fun! RunIt()
  w
  "!sh "/home/helge/.rundo.sh" "%:p"
  !sh "/home/helge/dotfiles/rundo.sh" "%:p"
endfun
au FileType stata noremap <F8> :<C-U>call RunIt()<CR><CR>
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
    au VimLeave * silent exe '!del /Q "'.$TEMP.'\*.tmp.do"'
endfun
au FileType stata noremap <F9> :<C-U>call RunDoLines()<CR><CR>
au FileType stata noremap <leader>se :<C-U>call RunDoLines()<CR><CR>
au FileType stata noremap <leader>l <S-v>:<C-U>call RunDoLines()<CR><CR>

" Python-mode
" TODO CLEAN THIS
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


