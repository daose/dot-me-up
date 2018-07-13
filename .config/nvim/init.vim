call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " needed for fugitive :Gbrowse
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'SirVer/ultisnips', { 'for': ['ruby'] }
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular', { 'for': ['markdown'] }
Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
Plug 'vim-ruby/vim-ruby'
Plug 'larrylv/vim-vroom', { 'for': ['ruby'] } " for compatability with pay test
Plug 'majutsushi/tagbar'

Plug 'ryanoasis/vim-devicons' "Requires this font: http://nerdfonts.com/, keep at bottom

" https://github.com/mhinz/vim-startify

call plug#end()

""" => vim-fold-rspec
let g:fold_rspec_foldlevel=999
""" => vim-gitgutter
set updatetime=500
""" => vim-rhubarb
let g:github_enterprise_urls = ['https://git.corp.stripe.com']

""" => vim-fugitive
nnoremap <silent> <leader>gst :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
""" => tagbar
" Configure Tagbar to use ripper-tags with ruby
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'f:methods',
        \ 'F:singleton methods',
        \ 'C:constants',
        \ 'a:aliases'
    \ ],
    \ 'ctagsbin':  'ripper-tags',
    \ 'ctagsargs': '--fields=+n -f -'
\ }
nnoremap <silent> <C-t> :TagbarToggle<CR>
""" => vroom
let g:vroom_use_terminal = 1
let g:vroom_use_bundle_exec = 0
let g:vroom_test_unit_command = 'pay test '

""" => vim-markdown
let g:vim_markdown_folding_level = 2
let g:vim_markdown_new_list_item_indent = 2

""" => deoplete
let g:deoplete#enable_at_startup = 1
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/local/bin/python3'
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" only show maximum 10
call deoplete#custom#option('max_list', 10)

""" => gruvbox
colorscheme gruvbox
set background=dark

""" => ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger = '<C-j>'

""" => ale
let g:airline#extensions#ale#enabled = 1 " integrate with airline
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" lint only when I save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_ruby_rubocop_executable = '/Users/bc/stripe/pay-server/scripts/bin/rubocop'

""" => goyo + limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nnoremap <C-a> :Goyo<CR>
let g:goyo_width = 100

""" => polyglot
let g:polyglot_disabled = ['latex']

""" => nerdtree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <leader>m :NERDTree %<CR>
" quit vim if nerdtree is the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""" => ale
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1

"
""" => fzf
nnoremap <C-p> :Files<CR>
"nnoremap gd :Tags <C-r><C-w><CR>
nnoremap <silent> gd :call fzf#vim#tags(expand('<cword>'))<CR>
let g:fzf_tags_command = 'ripper-tags -R --exclude=.git --exclude=log --exclude=build --exclude=target --force --fields=+n'

let s:horiz_preview_layout = 'right:50%'
let s:ag_opts = {"options": ["-d:"]}
command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'rg --smart-case --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview(s:ag_opts, 'down:50%')
  \           : fzf#vim#with_preview(s:ag_opts, s:horiz_preview_layout, '?'),
  \   <bang>0)

nnoremap <leader>a :Ag 
nnoremap <silent> <leader>s :Ag <C-r><C-w><CR>
""" => airline
" requires terminal to load patched fonts: https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1
" performance reasons
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#hunks#enabled = 0

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
nnoremap <leader>n :Tags 
" clear highlight when starting a new one
nnoremap / :noh<CR>/
" copy filename into clipboard
nnoremap <silent> <leader>yf :let @+=expand("%")<CR>

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

let g:tex_flavor = "latex"  " default to LaTeX not plaintex
" no line number in terminals
autocmd TermOpen * setlocal nonumber

""" => filetype specific settings
autocmd FileType java setlocal ts=4 sw=4
autocmd FileType sh setlocal ts=4 sw=4

"" vim:fdm=expr:fdl=0
"" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='
