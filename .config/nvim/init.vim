call plug#begin('~/.local/share/nvim/plugged')
" Run script below to install junegunn/vim-plug
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rhubarb' " needed for fugitive :Gbrowse
Plug 'sheerun/vim-polyglot'
" Plug 'AndrewRadev/sideways.vim'
Plug 'w0rp/ale'
Plug 'simeji/winresizer' " <C-E> to start resize mode
Plug 'junegunn/vim-easy-align' " visual select, ga<delim>

" Plug 'Valloric/YouCompleteMe', { 'for': ['javascript', 'ruby'], 'do': './install.py' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Plug 'SirVer/ultisnips', { 'for': ['ruby'] }
" Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
" Plug 'godlygeek/tabular', { 'for': ['markdown'] }
" Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }

" Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
" Plug 'larrylv/vim-vroom', { 'for': ['ruby'] } " for compatability with pay test
" Plug 'majutsushi/tagbar', { 'for': ['ruby', 'go'] }

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'sebdah/vim-delve', { 'for': ['go'] }

Plug 'lervag/vimtex', { 'for': ['tex'] }

Plug 'ryanoasis/vim-devicons' "Requires this font: http://nerdfonts.com/, keep at bottom

" https://github.com/mhinz/vim-startify

call plug#end()

""" => vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
""" => vim-go
" let g:go_fmt_command = "goimports"
" let g:go_fmt_fail_silently = 1
" let g:go_gocode_autobuild = 0
" let g:go_highlight_extra_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_generate_tags = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_types = 1
" let g:go_list_type = "quickfix"
""" => vim-delve
" autocmd FileType go nmap <leader>R :DlvTest<CR>
" autocmd FileType go nmap <leader>db :DlvToggleBreakpoint<CR>
" autocmd FileType go nmap <leader>dc :DlvClearAll<CR>

""" => vim-gitgutter
set updatetime=500
""" => vim-rhubarb
" let g:github_enterprise_urls = ['https://git.corp.stripe.com']

""" => vim-fugitive
nnoremap <silent> <leader>gst :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
""" => tagbar
" Configure Tagbar to use ripper-tags with ruby
" let g:tagbar_type_ruby = {
"     \ 'kinds' : [
"         \ 'm:modules',
"         \ 'c:classes',
"         \ 'f:methods',
"         \ 'F:singleton methods',
"         \ 'C:constants',
"         \ 'a:aliases'
"     \ ],
"     \ 'ctagsbin':  'ripper-tags',
"     \ 'ctagsargs': '--fields=+n -f -'
" \ }
" let g:tagbar_type_go = {
" 	\ 'ctagstype' : 'go',
" 	\ 'kinds'     : [
" 		\ 'p:package',
" 		\ 'i:imports:1',
" 		\ 'c:constants',
" 		\ 'v:variables',
" 		\ 't:types',
" 		\ 'n:interfaces',
" 		\ 'w:fields',
" 		\ 'e:embedded',
" 		\ 'm:methods',
" 		\ 'r:constructor',
" 		\ 'f:functions'
" 	\ ],
" 	\ 'sro' : '.',
" 	\ 'kind2scope' : {
" 		\ 't' : 'ctype',
" 		\ 'n' : 'ntype'
" 	\ },
" 	\ 'scope2kind' : {
" 		\ 'ctype' : 't',
" 		\ 'ntype' : 'n'
" 	\ },
" 	\ 'ctagsbin'  : 'gotags',
" 	\ 'ctagsargs' : '-sort -silent'
" \ }
" nnoremap <silent> <C-t> :TagbarToggle<CR>
""" => vroom
" let g:vroom_use_terminal = 1
" let g:vroom_use_bundle_exec = 0
" let g:vroom_test_unit_command = 'pay test '

""" => vim-markdown
" let g:vim_markdown_folding_level = 2
" let g:vim_markdown_new_list_item_indent = 2

""" => deoplete
let g:deoplete#enable_at_startup = 1
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/local/bin/python3'
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" only show maximum 10
call deoplete#custom#option('max_list', 10)

""" => colorscheme
set background=dark

""" => ultisnips
" let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
" let g:UltiSnipsExpandTrigger = '<C-j>'

""" => neosnippet
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Snippet location
let g:neosnippet#snippets_directory=[$HOME.'/.config/nvim/neosnippet']

" For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif

""" => ale
let g:airline#extensions#ale#enabled = 1 " integrate with airline
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" ale javascript
let g:ale_javascript_eslint_executable = 'eslint_d'
" use eslint_d instead of project eslint
let g:ale_javascript_eslint_use_global = 1
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1
" lint only when I save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" turn off linting for java
let g:ale_linters = {'java': []}
" Use c++17 for cs343
let g:ale_cpp_gcc_options = '-std=c++17 -Wall'
let g:ale_cpp_clang_options = '-std=c++17 -Wall'


""" => polyglot
let g:polyglot_disabled = ['latex']

""" => nerdtree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <leader>m :NERDTree %<CR>
" quit vim if nerdtree is the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" => fzf
nnoremap <C-p> :Files<CR>
nnoremap <silent> gd :call fzf#vim#tags(expand('<cword>'))<CR>

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

""" => custom colorscheme
highlight VertSplit ctermbg=Gray ctermfg=Black
highlight LineNr ctermfg=DarkGray
highlight CursorLine cterm=NONE ctermbg=DarkGray

highlight TabLineFill ctermfg=Black
highlight TabLine ctermbg=Black ctermfg=DarkGray
highlight TabLineSel ctermbg=Black
highlight Title ctermbg=Black ctermfg=None

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

let g:tex_flavor = "latex"  " default to LaTeX not plaintex
" no line number in terminals
autocmd TermOpen * setlocal nonumber

""" => filetype specific settings
autocmd FileType java setlocal ts=4 sw=4
autocmd FileType cpp setlocal ts=4 sw=4
autocmd FileType sh setlocal ts=4 sw=4

"" vim:fdm=expr:fdl=0
"" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='
