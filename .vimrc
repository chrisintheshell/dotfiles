" gui colors if running iTerm
"if $TERM_PROGRAM =~ "iTerm"
"  set termguicolors
"  set t_8f=[38;2;%lu;%lu;%lum
"  set t_8b=[48;2;%lu;%lu;%lum
"endif

" Change mapleader to ","
let mapleader=","

" General settings {{{

filetype plugin indent on
syntax on                       "Turn on syntax highlighting
set shortmess=atI               "Disable welcome screen
set clipboard=unnamed           "macOS pasteboard using pbcopy/pbpaste
set laststatus=2                "Required for VIM Airline
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set hidden                      "Hides buffers instead of closing
set nobackup noswapfile         "No backup or swap files
set nocompatible ignorecase smartcase
set nocindent noautoindent nosmartindent indentexpr= "disable autoindents
set tabstop=4 shiftwidth=4 expandtab "setup default tab/shift/expand
set nowrap                      "Don't wrap lines
set list
set hlsearch                    "Highlight search terms
set incsearch                   "Show search matches as you type
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·

" Set Color Scheme
set background=dark
colorscheme solarized
"colorscheme nord

" Use italic font for code comments
highlight Comment cterm=italic gui=italic

" Change line number background color
highlight LineNr ctermbg=8

" }}}

" Shortcuts and remappings {{{

"wrap lines"
nmap <silent> <leader>w :set nowrap!<CR>

"remap x to delete but not update default register"
noremap x "_x

" }}}

let NERDTreeShowHidden=1

" Increase max file limit for Command-T
let g:CommandTMaxFiles=400000

" Settings for VIM Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_theme='solarized'
"let g:airline_theme='nord'
