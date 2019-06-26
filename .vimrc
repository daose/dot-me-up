call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'simeji/winresizer'
Plug 'sheerun/vim-polyglot'

""" => fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>

""" => nerdtree
Plug 'scrooloose/nerdtree'
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>m :NERDTree %<CR>

""" => ale
Plug 'w0rp/ale'

let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = { 'python': ['pyls'], 'java': ['javac'] }
let g:ale_fixers = { 'python': ['isort', 'yapf'], 'java': ['google_java_format'] }
" ece454 - a1
let g:ale_java_javac_classpath = '/home/bychen/ece454/a1/.:/home/bychen/ece454/a1/gen-java/:/home/bychen/ece454/a1/lib/*:/home/bychen/ece454/a1/jBCrypt-0.4/*'

nnoremap <leader>r :ALEFix<CR>
" nnoremap gd :ALEGoToDefinition<CR>

""" => vim-fugitive
Plug 'tpope/vim-fugitive'
nnoremap <leader>gst :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>

""" => vim-gitgutter
Plug 'airblade/vim-gitgutter'
" how long the plugin will wait after you stop typing before it updates
set updatetime=100

""" => deoplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

let g:deoplete#enable_at_startup = 1
let g:python3_host_prog="/usr/bin/python3.6m"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

""" => vim-lsp
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

" " consider ccls instead of cquery
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

" see: https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Java
if executable('java') && filereadable(expand('~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.400.v20190515-0925.jar'))
    au User lsp_setup call lsp#register_server({
        \ 'name': 'eclipse.jdt.ls',
        \ 'cmd': {server_info->[
        \     'java',
        \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        \     '-Dosgi.bundles.defaultStartLevel=4',
        \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
        \     '-Dlog.level=ALL',
        \     '-noverify',
        \     '-Dfile.encoding=UTF-8',
        \     '-Xmx1G',
        \     '-jar',
        \     expand('~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.400.v20190515-0925.jar'),
        \     '-configuration',
        \     expand('~/lsp/eclipse.jdt.ls/config_linux'),
        \     '-data',
        \     getcwd()
        \ ]},
        \ 'whitelist': ['java'],
        \ })
endif
nnoremap gd :LspDefinition<CR>

""" => custom colorscheme
set background=dark
highlight VertSplit ctermbg=Gray ctermfg=Black
highlight LineNr ctermfg=DarkGray
highlight CursorLine cterm=NONE ctermbg=DarkGray

highlight TabLineFill ctermfg=Black
highlight TabLine ctermbg=Black ctermfg=DarkGray
highlight TabLineSel ctermbg=Black
highlight Title ctermbg=Black ctermfg=None


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
" autocmd FileType java setlocal ts=4 sw=4


call plug#end()

"" vim:fdm=expr:fdl=0
"" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='
