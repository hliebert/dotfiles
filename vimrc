"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Filename: .vimrc
"" Created on: Thu 02 Nov 2017 07:30:54 PM CET
"" Last modified: Wed 07 Mar 2018 06:30:15 PM CET
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
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
" Plug 'godlygeek/tabular'
Plug 'vim-scripts/Align'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-gtfo'
Plug 'justinmk/vim-sneak'
"""""""""""""""""""" Completion """""""""""""""""""""""""""""""""""""""""""""""
" Plug 'lifepillar/vim-mucomplete'
Plug 'ervandew/supertab'
" Plug 'roxma/nvim-completion-manager'
" if !has('nvim')
    " Plug 'roxma/vim-hug-neovim-rpc'
" endif
Plug 'gaalcaras/ncm-R'
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
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'Shougo/denite.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yegappan/mru'
Plug 'andymass/vim-matchup'
Plug 'chrisbra/csv.vim'
"""""""""""""""""""" Language support """""""""""""""""""""""""""""""""""""""""
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
set guioptions+=b
set guioptions+=r
set guioptions+=a
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
set clipboard=unnamedplus
" set clipboard+=unnamedplus
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

" map Y to yank until end of line (different due to yankring)
function! YRRunAfterMaps()
    nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction
nnoremap Y y$

" preserve clipboard content after pasting over text in visual mode
function! YRRunAfterMaps()                                                                                                      
    " From Steve Losh, Preserve the yank post selection/put.    
    vnoremap p :<c-u>YRPaste 'p', 'v'<cr>gv:YRYankRange 'v'<cr> 
endfunction  

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

" " CtrLP
" let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
" let g:ctrlp_by_filename = 1
" let g:ctrlp_map = '<C-t>'
" "let g:ctrlp_cmd = 'CtrlPMixed'
" " nnoremap <leader>t :CtrlP<CR>
" nnoremap <leader>p :CtrlP<CR>
" " nnoremap <C-t> :CtrlP<CR>
" nnoremap <leader>m :CtrlPMRU<CR>
" " nnoremap <leader>b CtrlPBuffer<CR>
" nnoremap <leader>b :CtrlPMixed<CR>
" " noremap <F3> :CtrlPMRU<CR>

" denite.nvim
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
nnoremap <leader>t :<C-u>Denite file_rec<CR>
nnoremap <leader>s :<C-u>Denite buffer<CR>
nnoremap <leader><Space>s :<C-u>DeniteBufferDir buffer<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>/ :<C-u>Denite grep:.<CR>
" nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <leader><Space>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
nnoremap <leader>d :<C-u>DeniteBufferDir file_rec<CR>

" fzf
" nnoremap <mapleader>t :<C-u>FZF<CR>
nnoremap <C-t> :<C-u>FZF<CR>
" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)
" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
" command! -bang -nargs=* Ag
  " \ call fzf#vim#ag(<q-args>,
  " \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  " \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  " \                 <bang>0)
" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" Likewise, Files command with preview window
" command! -bang -nargs=? -complete=dir Files
  " \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" NERD commenter
let NERDSpaceDelims=1

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Gutentags
" let g:gutentags_ctags_tagfile = '.tags'
" let g:gutentags_project_root = ['.projectile']

" " nvim-completion-manager
" " suppress |ins-completion-menu| messages
" set shortmess+=c
" " <Enter> still starts a new line when pressed while the popup menu is visible
" " inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" " example for expanding snippet in the popup menu with <Enter> key. Suppose you use the <C-U> key for expanding snippet.
" imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
" imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"\<CR>")
" "When using CTRL-C key to leave insert mode, it does not trigger the autocmd InsertLeave. You should use CTRL-[, or map the <c-c> to <ESC>.
" inoremap <c-c> <ESC>
" "Use <TAB> to select the popup menu:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" " Configuration for vimtex
" augroup my_cm_setup
  " autocmd!
  " autocmd User CmSetup call cm#register_source({
        " \ 'name' : 'vimtex',
        " \ 'priority': 8,
        " \ 'scoping': 1,
        " \ 'scopes': ['tex'],
        " \ 'abbreviation': 'tex',
        " \ 'cm_refresh_patterns': g:vimtex#re#ncm,
        " \ 'cm_refresh': {'omnifunc': 'vimtex#complete#omnifunc'},
        " \ })
" augroup END

" UtilSnips
" for nvim completion manager
" let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
" let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
" let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
" let g:UltiSnipsRemoveSelectModeMappings = 0
" else
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger	= "<tab>"
let g:UltiSnipsJumpBackwardTrigger	= "<S-tab>"
" optional
" inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"Ale
" let g:airline#extensions#ale#enabled = 1
nmap <F7> <Plug>(ale_toggle)
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_enabled = 0


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


