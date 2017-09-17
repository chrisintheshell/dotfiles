" gui colors if running iTerm
"if $TERM_PROGRAM =~ "iTerm"
"  set termguicolors
"  set t_8f=[38;2;%lu;%lu;%lum
"  set t_8b=[48;2;%lu;%lu;%lum
"endif

" This must be first, because it changes other options as side effect
"set nocompatible

" For macOS pasteboard using pbcopy/pbpaste
set clipboard=unnamed

" ======================== General Config ========================

set laststatus=2                "Required for VIM Airline
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

nmap <silent> <leader>p :set paste<CR>"*p:set nopaste<CR>

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Turn on syntax highlighting
syntax on
filetype plugin indent on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" ======================== Indentation ========================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab


" Display tabs and trailing spaces visually
set list
set listchars=tab:>-,trail:·,extends:#,nbsp:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Change Vim cursor shape in different modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Enable mouse scrolling
set mouse=a
set ttymouse=xterm

" Set Color Scheme
set background=dark
colorscheme solarized
"colorscheme solarized8_dark

" Adjust contrast for solarized8 theme
"fun! Solarized8Contrast(delta)
"    let l:schemes = map(["_low", "_flat", "", "_high"], '"solarized8_".(&background).v:val')
"      exe "colors" l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 4 + 4) % 4]
"    endf
"
"    nmap <leader>- :<c-u>call Solarized8Contrast(-v:count1)<cr>
"    nmap <leader>+ :<c-u>call Solarized8Contrast(+v:count1)<cr>

" Set cursor line and line number color
"set cursorline
"highlight clear CursorLine
"highlight clear CursorLineNr

let NERDTreeShowHidden=1

" Settings for VIM Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_theme='solarized'
