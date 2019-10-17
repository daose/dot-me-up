call plug#begin('~/.local/share/nvim/plugged')
" Run script below to install junegunn/vim-plug
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " needed for fugitive :Gbrowse
Plug 'simeji/winresizer' " <C-E> to start resize mode
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'SirVer/ultisnips'
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
" Plug 'fatih/vim-go'
""" => polyglot
Plug 'sheerun/vim-polyglot'
" Plug 'AndrewRadev/sideways.vim'

call plug#end()

""" => tagbar
nnoremap <C-t> :TagbarToggle<CR>

""" => startify
let g:startify_bookmarks = [{'a': '~/dev/s2-clean/SpatialUnity/'}, {'b': '~/dev/kinect-client'}]


""" => ultisnip
let g:UltiSnipsSnippetDirectories=['~/.ultisnips']
" Let coc.nvim handle tab
let g:UltiSnipsExpandTrigger = "<nop>"

""" => coc
set hidden
set nowritebackup
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> <leader><space> :call CocAction('doHover')<CR>
nnoremap <silent> <leader>r :call CocAction('format')<CR>
" nnoremap <silent> <leader>n :CocList symbols<CR>
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" see diagnostic errors
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

""" => fzf
nnoremap <C-p> :GFiles<CR>
" nnoremap <silent> gd :call fzf#vim#tags(expand('<cword>'))<CR>

nnoremap <leader>f :Rg<space>
nnoremap <silent> <leader>s :Rg <C-r><C-w><CR>

""" => vim-gitgutter
nnoremap <silent> <leader>gst :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>

""" => ale
" nnoremap <silent> <leader>r :ALEFix<CR>
" let g:airline#extensions#ale#enabled = 1 " integrate with airline
" " nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" " nmap <silent> <C-j> <Plug>(ale_next_wrap)
" " ale javascript
" let g:ale_javascript_eslint_executable = 'eslint_d'
" " use eslint_d instead of project eslint
" let g:ale_javascript_eslint_use_global = 1
let g:ale_linters = {'cs': [''], 'go': ['']}
" let g:ale_fix_on_save = 1
" " lint only when I save
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
" " Use c++17 for cs343
" let g:ale_cpp_gcc_options = '-std=c++17 -Wall'
" let g:ale_cpp_clang_options = '-std=c++17 -Wall'

" Plug 'tpope/vim-fugitive'
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

""" => nerdtree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <leader>m :NERDTree %<CR>
" quit vim if nerdtree is the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" => gruvbox
colorscheme gruvbox

" """ => custom colorscheme
" set background=dark
" highlight VertSplit ctermbg=Gray ctermfg=Black
" highlight LineNr ctermfg=DarkGray
" highlight CursorLine cterm=NONE ctermbg=DarkGray
" highlight ColorColumn ctermbg=DarkGray
"
" highlight TabLineFill cterm=None
" highlight TabLine ctermbg=Black ctermfg=DarkGray
" highlight TabLineSel ctermbg=Black
" highlight Title ctermbg=Black ctermfg=None
"
" highlight StatusLine cterm=NONE ctermbg=NONE ctermfg=LightGray
" highlight StatusLineNC cterm=NONE ctermbg=NONE ctermfg=DarkGray
"
" highlight Pmenu ctermbg=None ctermfg=LightGray
" highlight PmenuSel ctermbg=DarkGray ctermfg=White
" highlight PmenuThumb ctermbg=White
" highlight PmenuSbar ctermbg=DarkGray

""" => netrw mappings
" let g:netrw_liststyle = 3 " tree like view
" nnoremap <silent> <C-n> :Explore<CR>
" let g:netrw_banner = 0 " get rid of banner
" autocmd FileTYpe netrw nnoremap <BS> :Rexplore<CR>

""" => nvim mappings
" Navigate tabs
nmap <C-h> :tabprev<CR>
nmap <C-l> :tabnext<CR>
" map 0 to the first char of the line
map 0 ^
" remove trailing spaces, turn off highlighting from search, then save
nnoremap <leader>dt :%s/\s\+$//e <bar> :noh <bar> :w<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
" clear highlight when starting a new one
nnoremap / :noh<CR>/
" copy filename into clipboard
nnoremap <silent> <leader>yf :let @+=expand("%")<CR>
" copy file into clipboard
nnoremap <silent> <leader>yc :%y+<CR>

""" => nvim settings
set clipboard+=unnamedplus  " Copy and paste outside
set number                  " Show line numbers
set expandtab               " Insert spaces when TAB is pressed
set tabstop=2               " Render TABs using this many spaces
set shiftwidth=2            " Indentation amount
set lbr                     " when wrapping, dont break the word in half
set scrolloff=7             " minimal number of screen lines to keep above/below cursor
set ignorecase              " search case is ignored
set smartcase               " dont ignore case if there are capitals
set nocursorline            " do not highlight the screen line of the cursor (perf. issues)
set noswapfile              " no swap file to recover
set updatetime=300          " update faster for things like gitgutter
set nomodeline
let g:python3_host_prog="~/AppData/Local/Programs/Python/Python37-32/python.exe"

" no line number in terminals
autocmd TermOpen * setlocal nonumber

""" => filetype specific settings
autocmd FileType java setlocal ts=4 sw=4
autocmd FileType sh setlocal ts=4 sw=4
autocmd FileType php setlocal ts=4 sw=4
autocmd FileType cs setlocal ts=4 sw=4
autocmd FileType rust setlocal cc=80
autocmd FileType cs setlocal cc=120
