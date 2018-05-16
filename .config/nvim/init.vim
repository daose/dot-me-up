call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons' "Requires this font: http://nerdfonts.com/
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe', { 'for': ['javascript', 'ruby'], 'do': './install.py --js-completer' }
Plug 'wincent/ferret' " use ripgrep if need more speed
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'

" https://github.com/mhinz/vim-startify
" https://github.com/airblade/vim-gitgutter

call plug#end()

""" => ferret
nnoremap <C-f> :Ack

""" => ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger = '<C-j>'

""" => ale
let g:airline#extensions#ale#enabled = 1 " integrate with airline

""" => YouCompleteMe
let g:python_host_prog  = '/usr/bin/python' " requires python support

""" => goyo + limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nnoremap <C-a> :Goyo<CR>

""" => polyglot
let g:polyglot_disabled = ['latex']

""" => nerdtree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <C-m> :NERDTree %<CR>
" quit vim if nerdtree is the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" => onedark
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme onedark

""" => ale
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1

""" => vimtex
" don't show compiler errors from latex
let g:vimtex_compiler_latexmk = {'callback' : 0}

""" => fzf
nnoremap <C-p> :GFiles<CR>

""" => airline
let g:airline_theme='onedark'
" requires terminal to load patched fonts: https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1

""" => nvim mappings
" Navigate tabs
nmap <C-h> :tabprev<CR>
nmap <C-l> :tabnext<CR>
" Navigate buffers
nnoremap <C-b> <nop>
nnoremap <C-b>h :bprevious<CR>
nnoremap <C-b>l :bnext<CR>
" map 0 to the first char of the line
map 0 ^
" remove trailing spaces, turn off highlighting from search, then save
nnoremap <leader>dt :%s/\s\+$//e <bar> :noh <bar> :w<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>q :q<CR>
" clear highlight when starting a new one
nnoremap / :noh<CR>/

""" => nvim settings
set clipboard+=unnamedplus  " Copy and paste outside
set number                  " Show line numbers
set expandtab               " Insert spaces when TAB is pressed
set tabstop=2               " Render TABs using this many spaces
set shiftwidth=2            " Indentation amount
set lbr                     " when wrapping, dont break the word in half
set so=7                    " minimal number of screen lines to keep above/below cursor
set ignorecase              " search case is ignored
set smartcase               " dont ignore case if there are capitals
set cursorline              " highlight the screen line of the cursor
set noswapfile              " no swap file to recover

let g:tex_flavor = "latex"  " default to LaTeX not plaintex

""" => filetype specific settings
autocmd FileType java setlocal ts=4 sw=4
autocmd FileType sh setlocal ts=4 sw=4

"" vim:fdm=expr:fdl=0
"" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='
