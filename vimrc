execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set list
set listchars=tab:?\ ,eol:¬

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

au FocusLost * :wa

inoremap jj <ESC>


au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


syntax on
filetype plugin on
au BufNewFile,BufRead *.vh set filetype=verilog
au BufNewFile,BufRead *.sv set filetype=verilog
au BufNewFile,BufRead *.vpp set filetype=verilog
au BufNewFile,BufRead *.t  set filetype=verilog
au BufNewFile,BufRead *.vemacs  set filetype=verilog
au BufNewFile,BufRead *.vemacspp  set filetype=verilog
au BufNewFile,BufRead *.sdc set filetype=tcl
au BufNewFile,BufRead *.xcfg set filetype=xml
au BufNewFile,BufRead *.xenv set filetype=xml
au BufNewFile,BufRead *.xdef set filetype=xml
au BufNewFile,BufRead *.xdut set filetype=xml
au BufNewFile,BufRead *.xtest set filetype=xml
au BufNewFile,BufRead *.xpkg set filetype=xml

autocmd FileType make setlocal noexpandtab


map <S-K> :bnext<cr>
map <S-J> :bprevious<cr>

runtime macros/matchit.vim

command! -nargs=? -range Dec2hex call s:Dec2hex(<line1>, <line2>, '<args>')
function! s:Dec2hex(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    else
      let cmd = 's/\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No decimal number found'
    endtry
  else
    echo printf('%x', a:arg + 0)
  endif
endfunction

command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')
function! s:Hex2dec(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
    else
      let cmd = 's/0x\x\+/\=submatch(0)+0/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No hex number starting "0x" found'
    endtry
  else
    echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
  endif
endfunction

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim

" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

