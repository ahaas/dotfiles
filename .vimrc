" This prevents other shells from breaking vim
set shell=/bin/bash

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
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
" Plugin 'fisadev/vim-isort'
Plugin 'groenewege/vim-less'
Plugin 'digitaltoad/vim-jade'
Plugin 'chrisbra/csv.vim'
" themes
Plugin 'tomasr/molokai'
Plugin 'w0ng/vim-hybrid'
Plugin 'chriskempson/vim-tomorrow-theme'

call vundle#end()

filetype plugin indent on

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

"Save on lost focus
au FocusLost * :wa

" For colorscheme and tab indents (\ig)
colorscheme molokai
let g:rehash256 = 1
set background=dark
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
set t_Co=256

if has("gui_running")
    set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h14
    set guioptions=egmt
endif

" Autoindent
set autoindent
set cindent
set ruler
set smartindent

"Tab changes (2 space tabs)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2

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
"Automatically run Flake8 on save
"autocmd BufWritePost *.py call Flake8()

"For git gutter, make colors work properly on start
au VimEnter * highlight clear SignColumn

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

"Search settings
set hlsearch
set showmatch
set incsearch
set ignorecase
set smartcase

" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"vim-airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

" These airline elements will disappear at these widths
let g:airline#extensions#default#section_truncate_width = {
      \ }

let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'z', 'warning' ]
    \ ]

"ctrl-p settings
set wildignore+=*.pyc
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_cache_dir='$HOME/.cache/ctrlp'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"Stop 'existing swap files' warning
set shortmess+=A
