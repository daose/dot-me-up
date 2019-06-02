call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'simeji/winresizer'

Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'

call plug#end()

""" => vim-fugitive
nnoremap <leader>gst :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>

""" => vim-lsp
" if executable('cquery')
"   au User lsp_setup call lsp#register_server({
"         \ 'name': 'cquery',
"         \ 'cmd': {server_info->['cquery']},
"         \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
"         \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
"         \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
"         \ })
" endif
"
" if executable('pyls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python'],
"         \ })
" endif

""" => ale
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = { 'python': ['pyls'] }
let g:ale_fixers = { 'python': ['isort', 'yapf'] }

nnoremap <leader>r :ALEFix<CR>
nnoremap gd :ALEGoToDefinition<CR>

""" => fzf
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>

""" => deoplete
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog="/usr/bin/python3.6m"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

""" => custom colorscheme
set background=dark
highlight VertSplit ctermbg=Gray ctermfg=Black
highlight LineNr ctermfg=DarkGray
highlight CursorLine cterm=NONE ctermbg=DarkGray

highlight TabLineFill ctermfg=Black
highlight TabLine ctermbg=Black ctermfg=DarkGray
highlight TabLineSel ctermbg=Black
highlight Title ctermbg=Black ctermfg=None

""" => nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>m :NERDTree %<CR>

""" => vim mappings
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>
" map 0 to the first char of the line
map 0 ^
nnoremap <leader>t :tabnew<CR>
" clear highlight when starting a new search
nnoremap / :noh<CR>/

""" => vim settings
filetype plugin indent on
set autoindent
set autoread
set backspace=indent,eol,start
set belloff=all
set display=lastline
set encoding=utf-8
set nofsync
set history=10000
set hlsearch
set ignorecase
set incsearch
set langnoremap
set laststatus=2
set lazyredraw
set linebreak
set nocompatible
set noswapfile
set number
set ruler
set scrolloff=7
set sidescroll=1
set smartcase
set ttimeoutlen=50
set wildmenu

" tabs
set expandtab
set shiftwidth=2
set smarttab
set tabstop=2

""" => filetype specific settings
autocmd FileType java setlocal ts=4 sw=4

"" vim:fdm=expr:fdl=0
"" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='
