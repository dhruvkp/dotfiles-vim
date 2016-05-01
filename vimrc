set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
"Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'ryanoasis/vim-devicons'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ScrollColors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set encoding=utf-8
setglobal fileencoding=utf-8
filetype on
filetype indent on
filetype plugin on
set hidden
set omnifunc=syntaxcomplete#Complete
syntax on
set clipboard=unnamed
set number
set mouse=a
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set laststatus=2
"colorscheme jellyx
"set background=dark
"let g:solarized_termcolors=256
let mapleader=" "

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif



"most important mappings
nnoremap ; :
inoremap jj <esc>

" Shortcuts to navigate among split-views
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" leader mappings
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>d :bd<CR>
nnoremap K :bn<CR>
nnoremap J :bp<CR>
nnoremap <leader>o :e<Space>

"GoTo function definition using YcmCompleter
map <f3> :YcmCompleter GoTo<CR>

"""NerdTree open on starting vim"""
"let g:NERDTreeWinPos = "left"
"let g:nerdtree_tabs_open_on_console_startup=1
"let g:nerdtree_tabs_autofind=1
"let NERDTreeQuitOnOpen=1
"nnoremap <leader>t  :NERDTreeToggle<CR>

" snippets trigger
let g:UltiSnipsExpandTrigger="<C-j>"

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'sol'
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

set splitbelow
set splitright

let hour = strftime("%H") " Set the background light from 7am to 7pm
if 7 <= hour && hour < 19
    set background=light
    colorscheme pyte " Use the awesome solarized color scheme
else " Set to dark from 7pm to 7am
    set background=dark
endif
let g:solarized_termcolors = 16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

"" function to list virtualenvs
:fun ReturnVirtualEnvs(A,L,P)
:    return system("ls -d /Users/dhruv/.Envs/*/ \| cut -d'/' -f5")
:endfun

"" changing virtualenv should restart ycmserver
:command -nargs=+ -complete=custom,ReturnVirtualEnvs Venv :VirtualEnvActivate <args> | YcmRestartServer
if has('gui_running')
  set guifont=SauceCodePro\ Nerd\ Font:h13
endif

