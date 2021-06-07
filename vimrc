"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Filename: .vimrc
"" Created on: Thu 02 Nov 2017 07:30:54 PM CET
"" Last modified: Do 07 Jan 2021 18:22:15
"" Note: My vimrc. Mostly cleaned now.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" vim-plug: load plugins """""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" " Install vim-plug if not found
" if empty(glob('~/.vim/autoload/plug.vim'))
  " silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    " \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" endif
" " Run PlugInstall if there are missing plugins
" autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  " \| PlugInstall --sync | source $MYVIMRC
" \| endif

" Call vim-plug
call plug#begin('~/.vim/plugged')
"""""""""""""""""""" Appearance """""""""""""""""""""""""""""""""""""""""""""""
"Plug 'flazz/vim-colorschemes'
Plug 'molok/vim-vombato-colorscheme'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'drmikehenry/vim-fontsize'
Plug 'mgee/lightline-bufferline'
Plug 'ryanoasis/vim-devicons'
"""""""""""""""""""" Editing """"""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/YankRing.vim'
" Plug 'bfredl/nvim-miniyank'
" Plug 'Shougo/neoyank.vim'
" Plug 'svermeulen/vim-yoink'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
" Plug 'godlygeek/tabular'
Plug 'vim-scripts/Align'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-gtfo'
Plug 'justinmk/vim-sneak'
Plug 'alptertuna/vim-header'
"""""""""""""""""""" Completion """""""""""""""""""""""""""""""""""""""""""""""
Plug 'lifepillar/vim-mucomplete'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'ncm2/ncm2'
" if !has('nvim')
    " Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-tagprefix'
" Plug 'filipekiss/ncm2-look.vim'
" " Plug 'Shougo/neco-vim'
" " Plug 'Shougo/neco-syntax'
" " Plug 'ncm2/ncm2-syntax'
" " Plug 'ncm2/ncm2-neoinclude'
" Plug 'yuki-ycino/ncm2-dictionary'
" " Plug 'fgrsnau/ncm2-aspell'
" Plug 'fgrsnau/ncm2-otherbuf', { 'branch': 'ncm2' }
" Plug 'ncm2/ncm2-jedi'
" Plug 'ncm2/ncm2-vim'
" Plug 'gaalcaras/ncm-R'
" Plug 'ncm2/ncm2-ultisnips'
" Plug 'ncm2/ncm2-match-highlight'
"""""""""""""""""""" Feature support """"""""""""""""""""""""""""""""""""""""""
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'tweekmonster/fzf-filemru'
Plug 'yegappan/mru'
Plug 'andymass/vim-matchup'
Plug 'chrisbra/csv.vim'
"""""""""""""""""""" Language support """""""""""""""""""""""""""""""""""""""""
" Plug 'thinca/vim-quickrun'
Plug 'lervag/vimtex'
Plug 'gauteh/vim-evince-synctex'
Plug 'jalvesaq/Nvim-R'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'vim-pandoc/vim-pandoc-after'
" Plug 'vim-pandoc/vim-rmarkdown'
Plug 'klen/python-mode'
Plug 'hdima/python-syntax'
"Plug 'airblade/vim-gitgutter'
"Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
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
" set guifont=Fira\ Mono\ for\ Powerline\ 11
" set guifont=Fura\ Mono\ Nerd\ Font\ 11
set guifont=Fura\ Code\ Nerd\ Font\ 11
" set guifont=Source\ Code\ Pro\ for\ Powerline\ 11

set background=dark
" set background=light
" colorscheme vombato
" colorscheme onedark
" colorscheme one
" colorscheme nord
colorscheme palenight
let g:palenight_terminal_italics = 1

" Airline (alternative: lightline)
" let g:airline_theme='wombat'
" let g:airline_theme='onedark'
" let g:airline_theme='one'
" let g:airline_theme='nord'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
" let g:airline_left_sep=''
" let g:airline_right_sep=''
" if !exists('g:airline_symbols')
  " let g:airline_symbols = {}
" endif
" " unicode symbols
" let g:Powerline_symbols='unicode'
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
" let g:airline_symbols.maxlinenr = ''
" " let g:airline_symbols.linenr = '☰'
" " let g:airline_symbols.maxlinenr = ''"

" Lightline
" let g:lightline = {
      " \ 'colorscheme': 'wombat',
      " \ 'separator': { 'left': '', 'right': '' },
      " \ 'subseparator': { 'left': '', 'right': '' }
      " \ }
" Lots of customization to get a bufferline/tabline. If I knew before this
" would be missing and this messy, I'd have stayed with airline.

" Config
" always show tabline
au VimEnter * :set showtabline=2
if has('gui_running')
  set guioptions-=e
endif

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
		  \   'right': [ [ 'lineinfo' ],
		  \              [ 'percent' ],
		  \              [ 'fileformat', 'fileencoding', 'filetype' ],
		  \              [ 'linter_errors', 'linter_warnings'] ]
      \ },
      \ 'tabline': {
      \   'left': [ [ 'buffers' ], ],
      \   'right': [ [ 'close' ], ],
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive',
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'buffers': 'tabsel',
      \ },
      \ }

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Basic settings  """"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype plugin on
filetype indent on
syntax on

set guioptions-=T
set guioptions-=m
" set guioptions+=b
" set guioptions+=r
" set guioptions+=a
set guioptions+=P
set stal=1
set number
set relativenumber
set scrolloff=3
" set nowrap
set autoindent
set autochdir
" autocmd BufEnter * silent! lcd %:p:h
set showmode
set showcmd
set hidden
set novisualbell
set noerrorbells
set shortmess+=c 
set belloff+=ctrlg
set cursorline
set ttyfast
" set lazyredraw
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
" set clipboard=unnamed
" set clipboard=unnamedplus
" set clipboard=unnamedplus,unnamed
set encoding=utf-8
" format and wrap
set wrap
set textwidth=80
" set textwidth=79
"set linebreak=79
"set colorcolumn=85
set formatoptions=qrnj
autocmd FileType markdown,mkd,tex setlocal formatoptions+=tc2
" set formatoptions=tcqron12j
" set formatoptions=tcqron12ja
" set formatoptions=qrn1
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

" both mappings now configured with yankring
" map Y to yank until end of line (different due to yankring)
" nnoremap Y y$

" fix visual mode paste such that register is not overwritten
" similar mappings
" https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text
" https://stackoverflow.com/questions/290465/how-to-paste-over-without-overwriting-register
" xnoremap <expr> p 'pgv"'.v:register.'y`>' 
" xnoremap p "_dP
" xnoremap <silent> p p:let @+=@0<CR>:let @"=@0<CR>


" find lines longer than 80
nnoremap <leader>lo /\%>80v.\+<cr>

" minor comment delimiters
au FileType tex nnoremap <silent> <leader>he 020i%<Esc>a<Space><Esc>$a<Space><Esc>60a%<Esc>80\|D0
au FileType stata nnoremap <silent> <leader>he 020i*<Esc>a<Space><Esc>$a<Space><Esc>60a*<Esc>80\|D0
au FileType r,rmd,rnoweb nnoremap <silent> <leader>he 020i#<Esc>a<Space><Esc>$a<Space><Esc>60a#<Esc>80\|D0

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

" Toggle vertical scrollbar
function ToggleVerticalScrollbar()
    "set guioptions+=b
    if &go =~# "r"
        set go-=r
    else
        set go+=r
    endif
endfunc
function ToggleVerticalScrollbar_setKeys()
    nnoremap <silent> <C-S-F11>      :call ToggleVerticalScrollbar()<CR>
    vnoremap <silent> <C-S-F11> <C-C>:call ToggleVerticalScrollbar()<CR>
    inoremap <silent> <C-S-F11> <C-O>:call ToggleVerticalScrollbar()<CR>
endfunc
au GUIEnter * call ToggleVerticalScrollbar_setKeys()

" * and # search for next/previous of selected text when used in visual mode
xno * :<c-u>cal<SID>VisualSearch()<cr>/<cr>
xno # :<c-u>cal<SID>VisualSearch()<cr>?<cr>

fun! s:VisualSearch()
  let old = @" | norm! gvy
  let @/ = '\V'.substitute(escape(@", '\'), '\n', '\\n', 'g')
  let @" = old
endf

" mark duplicate lines appearing in the same buffer, like ^\(.*\)\n\ze\%(.*\n\)*\1$
function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

" word counts in tex file
function! WC()
    let filename = expand("%")
    " let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
    " let result = system(cmd)
    " echo result . " words"
    let cmd = "detex " . filename . " | wc -m -w"
    let result = system(cmd)
    echo result . " words characters"
endfunction

command WC call WC()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Plugin/Filetype configurations """""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Gundo
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
nnoremap <F5> :GundoToggle<CR>

" Nerdtree
noremap <F2> :NERDTreeToggle %:p:h<CR>

" Yankring
" nnoremap <silent> <F6> :YRShow<cr>
" inoremap <silent> <F6> <ESC>:YRShow<cr>
let g:yankring_paste_visual_reset_default_register = 1
function! YRRunAfterMaps()
    " Make Y yank to end of line.
    nnoremap Y :<C-U>YRYankCount 'y$'<CR>
endfunction

" Vim Yoink
" nmap <C-n> <plug>(YoinkPostPasteSwapBack)
" nmap <C-p> <plug>(YoinkPostPasteSwapForward)
" nmap p <plug>(YoinkPaste_p)
" nmap P <plug>(YoinkPaste_P)
" nmap [y <plug>(YoinkRotateBack)
" nmap ]y <plug>(YoinkRotateForward)
" nnoremap <silent> <F6> :Yanks<cr>

" miniyank
" map p <Plug>(miniyank-autoput)
" map P <Plug>(miniyank-autoPut)
" " map <leader>p <Plug>(miniyank-startput)
" " map <leader>P <Plug>(miniyank-startPut)
" map <C-n> <Plug>(miniyank-cycle)
" map <C-p> <Plug>(miniyank-cycleback)

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

" fzf
nnoremap <mapleader>t :<C-u>FZF<CR>
nnoremap <C-t> :<C-u>FZF<CR>
nnoremap <C-f> :<C-u>FZF<CR>
" nnoremap <F3> :<C-u>History<CR>
nnoremap <C-h> :<C-u>History<CR>
" nnoremap <C-s> :<C-u>Ag<CR>
" nnoremap <C-S-s> :<C-u>Ag!<CR>
" nnoremap <F10> :<C-u>Ag<CR>
" nnoremap <S-F10> :<C-u>Ag!<CR>
nnoremap <C-s> :<C-u>Rg<CR>
" nnoremap <C-S-s> :<C-u>Rg!<CR>
nnoremap <F10> :<C-u>Rg<CR>
nnoremap <S-F10> :<C-u>Rg!<CR>
" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)
" Augmenting Ag command using fzf#vim#with_preview function
  " :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
  " :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" NERD commenter
let NERDSpaceDelims=1

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" " Completor
" " Use Tab to trigger completion (disable auto trigger)
" let g:completor_auto_trigger = 0
" inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"
" " Use Tab to select completion
" " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" " MUcomplete
set completeopt+=menu,preview,menuone,noselect
let g:jedi#popup_on_dot = 0  " It may be 1 as well
let g:mucomplete#enable_auto_at_startup = 1
" nnoremap <F7> :MUcompleteAutoToggle

" " NCM2
" " enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
" " IMPORTANT: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect
" " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" " found' messages
" set shortmess+=c
" " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
" inoremap <C-c> <ESC>
" " When the <Enter> key is pressed while the popup menu is visible, it only
" " hides the menu. Use this mapping to close the menu and also start a new
" " line.
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" " Use <TAB> to select the popup menu:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" " wrap existing omnifunc
" " Note that omnifunc does not run in background and may probably block the
" " editor. If you don't want to be blocked by omnifunc too often, you could
" " add 180ms delay before the omni wrapper:
" " "  'on_complete': ['ncm2#on_complete#delay', 180,
" " "               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
" " au User Ncm2Plugin call ncm2#register_source({
        " " \ 'name' : 'css',
        " " \ 'priority': 9, 
        " " \ 'subscope_enable': 1,
        " " \ 'scope': ['css','scss'],
        " " \ 'mark': 'css',
        " " \ 'word_pattern': '[\w\-]+',
        " " \ 'complete_pattern': ':\s*',
        " " \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        " " \ })

" " ncm2 match highlight
" " let g:ncm2#match_highlight = 'bold'

" " ncm2 setup for vimtex
" augroup my_cm_setup
  " autocmd!
  " autocmd BufEnter * call ncm2#enable_for_buffer()
  " autocmd Filetype tex call ncm2#register_source({
          " \ 'name' : 'vimtex-cmds',
          " \ 'priority': 8, 
          " \ 'complete_length': -1,
          " \ 'scope': ['tex'],
          " \ 'matcher': {'name': 'prefix', 'key': 'word'},
          " \ 'word_pattern': '\w+',
          " \ 'complete_pattern': g:vimtex#re#ncm2#cmds,
          " \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
          " \ })
  " autocmd Filetype tex call ncm2#register_source({
          " \ 'name' : 'vimtex-labels',
          " \ 'priority': 8, 
          " \ 'complete_length': -1,
          " \ 'scope': ['tex'],
          " \ 'matcher': {'name': 'combine',
          " \             'matchers': [
          " \               {'name': 'substr', 'key': 'word'},
          " \               {'name': 'substr', 'key': 'menu'},
          " \             ]},
          " \ 'word_pattern': '\w+',
          " \ 'complete_pattern': g:vimtex#re#ncm2#labels,
          " \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
          " \ })
  " autocmd Filetype tex call ncm2#register_source({
          " \ 'name' : 'vimtex-files',
          " \ 'priority': 8, 
          " \ 'complete_length': -1,
          " \ 'scope': ['tex'],
          " \ 'matcher': {'name': 'combine',
          " \             'matchers': [
          " \               {'name': 'abbrfuzzy', 'key': 'word'},
          " \               {'name': 'abbrfuzzy', 'key': 'abbr'},
          " \             ]},
          " \ 'word_pattern': '\w+',
          " \ 'complete_pattern': g:vimtex#re#ncm2#files,
          " \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
          " \ })
  " autocmd Filetype tex call ncm2#register_source({
          " \ 'name' : 'bibtex',
          " \ 'priority': 8, 
          " \ 'complete_length': -1,
          " \ 'scope': ['tex'],
          " \ 'matcher': {'name': 'combine',
          " \             'matchers': [
          " \               {'name': 'prefix', 'key': 'word'},
          " \               {'name': 'abbrfuzzy', 'key': 'abbr'},
          " \               {'name': 'abbrfuzzy', 'key': 'menu'},
          " \             ]},
          " \ 'word_pattern': '\w+',
          " \ 'complete_pattern': g:vimtex#re#ncm2#bibtex,
          " \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
          " \ })
" augroup END

" UtilSnips
" Press enter key to trigger snippet expansion
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
" c-j c-k for moving in snippet
" let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger	= "<tab>"
" let g:UltiSnipsJumpBackwardTrigger	= "<S-tab>"
" optional
" inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
" inoremap <silent> <Tab> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Ale
" let g:airline#extensions#ale#enabled = 1
nmap <F7> <Plug>(ale_toggle)
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_enabled = 0

" Latex/Vimtex
let g:tex_flavor = "latex"
let g:vimtex_complete_recursive_bib = 1
let g:vimtex_index_split_pos = 'vert rightbelow'
" let g:matchup_override_vimtex = 1
" Set compiler to latexrun
" let g:vimtex_compiler_method = 'latexrun'
" Disable continous compilation
" let g:vimtex_compiler_latexmk = {'continuous' : 0}
" enable shell escape
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'jobs',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 0,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-pdf',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-shell-escape',
    \ ],
    \}
" quickfix window becomes active window if opened
" let g:vimtex_quickfix_mode = 1
" alternatively, jump to error (do not use with 'continous'
let g:vimtex_quickfix_autojump = 1
" Disable overfull/underfull \hbox warnings
let g:vimtex_quickfix_latexlog = {
      \ 'default' : 1,
      \ 'general' : 1,
      \ 'references' : 1,
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \ 'font' : 0,
      \}
" forward search
" let g:vimtex_view_general_viewer = 'qpdfview'
            " let g:vimtex_view_general_options
              " \ = '--unique @pdf\#src:@tex:@line:@col'
            " let g:vimtex_view_general_options_latexmk = '--unique'
" in qpdfview add as source editor
" gvim --remote +%2<Enter>zz %1
" disable switching windows
let g:vimtex_view_automatic = 0

" vim-evince-synctex
" Bind forward search
nnoremap <leader>lf :VimtexForwardSearch<CR>
" Overwrite vimtex binding
nnoremap <leader>lv :VimtexForwardSearch<CR>

" mark latex table between toprule/bottomrule
au FileType tex nnoremap <leader>tb /\\toprule<CR>jV/\\bottomrule<CR>k

" Markdown/Pandoc
" let g:pandoc#after#modules#enabled = ["supertab", "ultisnips"]

" Nvim-R plugin
let R_nvimpager = "vertical"
let R_clear_line = 1
let R_editor_w = 80
let R_editor_h = 60
let R_in_buffer = 0
let R_csv_app = "localc"
let R_csv_delim = ";"

" Stata do-file scripts
fun! RunIt()
  w
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
    exec "!sh /home/helge/dotfiles/rundo.sh " . temp
    au VimLeave * silent exe '!del /Q "'.$TEMP.'\*.tmp.do"'
endfun
au FileType stata noremap <F9> :<C-U>call RunDoLines()<CR><CR>
au FileType stata noremap <leader>se :<C-U>call RunDoLines()<CR><CR>
au FileType stata noremap <C-Enter> :<C-U>call RunDoLines()<CR><CR>
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


