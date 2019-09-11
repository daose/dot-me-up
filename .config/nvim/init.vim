call plug#begin('~/.local/share/nvim/plugged')
" Run script below to install junegunn/vim-plug
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

""" => javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

""" => coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
set hidden
set nowritebackup
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> <leader><space> :call CocAction('doHover')<CR>
nnoremap <silent> <C-t> :CocList outline<CR>
nnoremap <silent> <leader>n :CocList symbols<CR>
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" see diagnostic errors
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

""" => fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
" nnoremap <silent> gd :call fzf#vim#tags(expand('<cword>'))<CR>
let s:horiz_preview_layout = 'right:50%'
let s:ag_opts = {"options": ["-d:"]}
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --smart-case --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview(s:ag_opts, 'down:50%')
  \           : fzf#vim#with_preview(s:ag_opts, s:horiz_preview_layout, '?'),
  \   <bang>0)

nnoremap <leader>f :Rg<space>
nnoremap <silent> <leader>s :Rg <C-r><C-w><CR>

""" => vim-gitgutter
Plug 'airblade/vim-gitgutter'
nnoremap <silent> <leader>gst :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>

""" => vimtex
Plug 'lervag/vimtex', { 'for': ['tex'] }
let g:tex_flavor = "latex"  " default to LaTeX not plaintex

""" => ale
Plug 'w0rp/ale'
let g:ale_fixers = {'rust': ['rustfmt'], 'php': ['php_cs_fixer']}
let g:ale_linters = {'php': []}
nnoremap <silent> <leader>r :ALEFix<CR>
" let g:airline#extensions#ale#enabled = 1 " integrate with airline
" " nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" " nmap <silent> <C-j> <Plug>(ale_next_wrap)
" " ale javascript
" let g:ale_javascript_eslint_executable = 'eslint_d'
" " use eslint_d instead of project eslint
" let g:ale_javascript_eslint_use_global = 1
" let g:ale_linters = {'java': []}
" let g:ale_fix_on_save = 1
" " lint only when I save
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
" " Use c++17 for cs343
" let g:ale_cpp_gcc_options = '-std=c++17 -Wall'
" let g:ale_cpp_clang_options = '-std=c++17 -Wall'

Plug 'tpope/vim-fugitive'
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

Plug 'tpope/vim-rhubarb' " needed for fugitive :Gbrowse
" let g:github_enterprise_urls = ['https://git.corp.stripe.com']

Plug 'simeji/winresizer' " <C-E> to start resize mode

""" => nerdtree
" Plug 'scrooloose/nerdtree'
" nnoremap <silent> <C-n> :NERDTreeToggle<CR>
" nnoremap <silent> <leader>m :NERDTree %<CR>
" quit vim if nerdtree is the only thing left
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" => airline
" Plug 'vim-airline/vim-airline'
" requires terminal to load patched fonts: https://github.com/powerline/fonts
" let g:airline_powerline_fonts = 1
" performance reasons
" let g:airline#extensions#tagbar#enabled = 0
" let g:airline#extensions#hunks#enabled = 0


""" => polyglot
" Plug 'sheerun/vim-polyglot'
" let g:polyglot_disabled = ['latex']

" Plug 'AndrewRadev/sideways.vim'

""" => vim-easy-align
" Plug 'junegunn/vim-easy-align' " visual select, ga<delim>
" Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

""" => deoplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" let g:deoplete#enable_at_startup = 1
" let g:loaded_python_provider = 0
" let g:python3_host_prog = '/usr/local/bin/python3'
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" only show maximum 10
" call deoplete#custom#option('max_list', 10)

""" => neosnippet
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-j>     <Plug>(neosnippet_expand_or_jump)
" smap <C-j>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-j>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Snippet location
" let g:neosnippet#snippets_directory=[$HOME.'/.config/nvim/neosnippet']

" Plug 'tpope/vim-surround'
" Plug 'godlygeek/tabular', { 'for': ['markdown'] }

" Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }

" Plug 'larrylv/vim-vroom', { 'for': ['ruby'] } " for compatability with pay test
""" => vroom
" let g:vroom_use_terminal = 1
" let g:vroom_use_bundle_exec = 0
" let g:vroom_test_unit_command = 'pay test '


""" => tagbar
" Plug 'majutsushi/tagbar', { 'for': ['ruby', 'go'] }
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

""" => vim-go
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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
" Plug 'sebdah/vim-delve', { 'for': ['go'] }
" autocmd FileType go nmap <leader>R :DlvTest<CR>
" autocmd FileType go nmap <leader>db :DlvToggleBreakpoint<CR>
" autocmd FileType go nmap <leader>dc :DlvClearAll<CR>

" Plug 'ryanoasis/vim-devicons' "Requires this font: http://nerdfonts.com/, keep at bottom

call plug#end()

""" => custom colorscheme
set background=dark
highlight VertSplit ctermbg=Gray ctermfg=Black
highlight LineNr ctermfg=DarkGray
highlight CursorLine cterm=NONE ctermbg=DarkGray
highlight ColorColumn ctermbg=DarkGray

highlight TabLineFill cterm=None
highlight TabLine ctermbg=Black ctermfg=DarkGray
highlight TabLineSel ctermbg=Black
highlight Title ctermbg=Black ctermfg=None

highlight StatusLine cterm=NONE ctermbg=NONE ctermfg=LightGray
highlight StatusLineNC cterm=NONE ctermbg=NONE ctermfg=DarkGray

highlight Pmenu ctermbg=None ctermfg=LightGray
highlight PmenuSel ctermbg=DarkGray ctermfg=White
highlight PmenuThumb ctermbg=White
highlight PmenuSbar ctermbg=DarkGray

""" => netrw mappings
let g:netrw_liststyle = 3 " tree like view
nnoremap <silent> <C-n> :Explore<CR>
let g:netrw_banner = 0 " get rid of banner
autocmd FileTYpe netrw nnoremap <BS> :Rexplore<CR>

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

" no line number in terminals
autocmd TermOpen * setlocal nonumber

""" => filetype specific settings
autocmd FileType java setlocal ts=4 sw=4
autocmd FileType sh setlocal ts=4 sw=4
autocmd FileType php setlocal ts=4 sw=4
autocmd FileType rust setlocal cc=80

"" vim:fdm=expr:fdl=0
"" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='
