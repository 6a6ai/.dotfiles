set nocompatible  " turn off vi compatibility:
set noerrorbells  " no sounds
filetype indent on " load filetype-specific indent files
syntax enable           " enable syntax processing
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab " tabs are spaces
set number relativenumber " show line numbers
set ruler " show ruler (line,col)
set nocursorline          " no highlight current line
set wildmenu " visual autocomplete for command menu
set nolazyredraw " redraw only when we need to.
set showmatch " highlight matching [{()}]
set foldenable " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level
set smartcase " sets if searches are case sensitive if capital letter is presents
set ignorecase " just ignore case when searching
set incsearch " search as characters are entered
set hlsearch " highlight matches
set noswapfile " no swapping files around
set nobackup
set undodir=~/.vim/undodir
set undofile
set colorcolumn=120
set nowrap
set signcolumn
"highlight ColorColumn ctermgb=0 guibg=lightgrey
set showcmd " display leader
" add angle brackets to be supported by % hotkey
set mps+=<:>

" load plugins with Plug
call plug#begin('~/.vim/plugged')
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-utils/vim-man'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Initialize plugin system
call plug#end()

" apply color theme
set bg=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = 0
colorscheme gruvbox

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:netrw_banner=0
let g:netrw_winsize=25
let g:ctrlp_use_caching=0
let g:fzf_layout={'window': {'width':0.8, 'height':0.8}}
let $FZF_DEFAULT_OPTS='--reverse'

" ******** tune nerdcommenter ********
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" use jj to quit insert mode
imap jj <ESC>
" highlight last inserted text
nnoremap gV `[v`]

" set leader map to space
nnoremap <SPACE> <Nop>
let mapleader=" "
" project-wide search
nnoremap <leader>ps :Rg<SPACE>
" turn off search highlight
nnoremap <leader>/ :nohlsearch<CR>

" map NERDTree keys
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" toggle graphical undo provided by gundo plugin - see Plug section below
nnoremap <leader>u :GundoToggle<CR>
" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>o :FZF!<CR>
nnoremap oo o<ESC>
nnoremap OO O<ESC>

au InsertEnter * set cursorline
au InsertLeave * set nocursorline

"*************************
"**** code completion ****
"*************************

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

nnoremap <leader>gh :diffget //3<cr>
nnoremap <leader>gf :diffget //2<cr>
nnoremap <leader>gs :G<cr>
nnoremap <leader>gc :GBranches<CR>
