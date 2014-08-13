set nocompatible   " Disable vi-compatibility
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bling/vim-airline'
Plugin 'nvie/vim-flake8'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'fisadev/vim-isort'
Plugin 'groenewege/vim-less'
Plugin 'rking/ag.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'tomasr/molokai'

call vundle#end()

filetype plugin indent on

if has("gui_running")
    set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h12
    set guioptions=egmt
endif

syntax enable
syntax on

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

let mapleader = ","

" Change colorcolumn color
highlight ColorColumn guibg=#404040
" Highlight 80th column
set wrap
set textwidth=79
set formatoptions=qrn1
" set colorcolumn=73,80
execute "set colorcolumn=73," . join(range(80,335), ',')

" Custom movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Disable arrowkeys and make j&k visual
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
nnoremap <tab> %
vnoremap <tab> %

" Accidentally hitting f1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Convenience
nnoremap ; :
inoremap jj <ESC>

"Save on lost focus
au FocusLost * :wa

" For colorscheme and tab indents (\ig)
colorscheme molokai
let g:rehash256 = 1
set background=dark
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
set t_Co=256

" Autoindent
set autoindent
set cindent
set ruler
set smartindent

"Tab changes (4 space tabs)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Smartcase overrides ignorecase if uppercase used in string
set ignorecase
set smartcase

"Disable arrow keys (except for up and down in insert mode for autocomplete)
noremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"Use tab to navigate bracket pairs
nnoremap <tab> %
vnoremap <tab> %

"Relative line numbers
set nonumber
set relativenumber

"Tab changes (4 space tabs)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Map command-[ and command-] to indenting or outdenting
"while keeping the original selection in visual mode
vmap <D-]> >gv
vmap <D-[> <gv

nmap <D-]> >>
nmap <D-[> <<

omap <D-]> >>
omap <D-[> <<

imap <D-]> <Esc>>>i
imap <D-[> <Esc><<

"Display whitespace
:set listchars=tab:>-,trail:⋅,extends:>,precedes:<
:set list

"Auto Flake8 on save
let g:flake8_max_line_length=99
autocmd BufWritePost *.py call Flake8()

let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'z', 'warning' ]
    \ ]

" For git gutter, make colors work properly on start
au VimEnter * highlight clear SignColumn

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

"Highlight search
set hlsearch
set showmatch
" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"vim-airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1

"ctrl-p settings
set wildignore+=*.pyc

"Stop 'existing swap files' warning
set shortmess+=A

command Cdgmp execute "cd ~/Documents/_Andre/Projects/Node/Gridmp"
