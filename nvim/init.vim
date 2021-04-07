set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
"source ~/.vimrc
set nocompatible  " turn off vi compatibility:
set noerrorbells  " no sounds
filetype indent on " load filetype-specific indent files
syntax enable           " enable syntax processing
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab " tabs are spaces
set smartindent
set shiftwidth=4
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
set smartcase " sets if searches are case sensitive if capital letter is present
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
set timeoutlen=400
highlight ColorColumn ctermbg=0 guibg=grey
set showcmd " display leader
" add angle brackets to be supported by % hotkey
set mps+=<:>

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set wildignore+=**/.idea/*
set wildignore+=**/.pytest_cache/*

" load plugins with Plug
call plug#begin('~/.vim/plugged')
" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree'
" replaced by telescope
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'stsewd/fzf-checkout.vim'
Plug 'vim-utils/vim-man'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" treesitter stuff
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" test in test
Plug 'vim-test/vim-test'

" Initialize plugin system
call plug#end()

lua require("my_inits")

"lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" apply color theme
set bg=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = 0
colorscheme gruvbox

if executable('rg')
    let g:rg_derive_root='true'
endif

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
"nnoremap <leader>ps :Rg<SPACE>
" turn off search highlight
nnoremap <leader>/ :nohlsearch<CR>


"nnoremap <leader>o :FZF!<CR>
nnoremap <leader>t :Lexplore<CR>
" map NERDTree keys
"nnoremap <leader>n :NERDTree<CR>
"nnoremap <leader>t :NERDTreeToggle<CR>
"nnoremap <leader>f :NERDTreeFind<CR>

nnoremap <leader>u :UndotreeToggle<CR>
" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" copy/paste things
vnoremap <leader>p "_dP
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

au InsertEnter * set cursorline
au InsertLeave * set nocursorline
" useful stuff
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})
augroup END

augroup MY_GROUP_666
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

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

:lua << EOF
        local pid = vim.fn.getpid()
        local omnisharp_bin = os.getenv("HOME") .. "/bin/omnisharp-osx/run"
        require'lspconfig'.omnisharp.setup{
        on_attach=require'completion'.on_attach;
        cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
        }
EOF

:lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }

" experimental bindings
nnoremap <A-B> :!dotnet build<cr>
nnoremap <A-T> :!dotnet test<cr>
nnoremap <A-R> :!dotnet run<cr>

nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tv :TestVisit<CR>
let test#enabled_runners = ["csharp#dotnettest"]

