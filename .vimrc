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
" Plugin 'edkolev/promptline.vim'
" Plugin 'majutsushi/tagbar'
Plugin 'nvie/vim-flake8'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
" Plugin 'jceb/vim-editqf'
Plugin 'fisadev/vim-isort'
Plugin 'groenewege/vim-less'
Plugin 'rking/ag.vim'
Plugin 'chrisbra/csv.vim'

call vundle#end()

filetype plugin indent on

" Programming-language specific completion with
" <CTRL-X><CTRL-O>
"

" Custom movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Inserting blank lines in normal mode (effectively)
" from http://superuser.com/questions/607163
" TODO: Need to figure out how to not make this mess
" up pep8 plugin.
" map <Enter> o<ESC>
" map <S-Enter> O<ESC>

syntax enable
syntax on

au FocusLost * :wa


" For colorscheme and tab indents (\ig)
colorscheme monokai
set background=dark
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

set autoindent
set cindent
set expandtab
set ruler
set smartindent
set softtabstop=4
set shiftwidth=4

" Smartcase overrides ignorecase if uppercase used in string
set ignorecase
set smartcase

set t_Co=256

" Relative/absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
call NumberToggle()

if has("gui_running")
    set guifont=Inconsolata-dz\ for\ Powerline:h12
    set guioptions=egmrt
endif

let g:flake8_max_line_length=99
autocmd BufWritePost *.py call Flake8()

let g:airline#extensions#default#layout = [
    \ [ 'a', 'c' ],
    \ [ 'x', 'z', 'warning' ]
    \ ]

" For git gutter, make colors work properly on start
au VimEnter * highlight clear SignColumn

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

"Highlight search
set hlsearch
" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" vim-airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1

"ctrl-p settings
set wildignore+=*.pyc
