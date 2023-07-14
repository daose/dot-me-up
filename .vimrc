source $VIMRUNTIME/defaults.vim

""" => fzf
nnoremap <C-p> :Files<CR>
nnoremap <leader>f :Rg<space>
nnoremap <leader>b :Buffers<CR>
nnoremap <silent> <leader>s :Rg <C-r><C-w><CR>
let g:fzf_preview_window = ['hidden,up,75%', '?']
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 1.0 } }

""" => vim-fugitive
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
let g:gitgutter_preview_win_floating = 1
nnoremap <leader>ga :Git add %<CR>
nnoremap <leader>gd :Git difftool<CR>


""" => vim settings
set background=dark
set expandtab
colorscheme retrobox
set noswapfile
set clipboard+=unnamed " Copy and paste outside
set expandtab          " Insert spaces when TAB is pressed
set tabstop=2          " Render TABs using this many spaces
set shiftwidth=2       " Indentation amount
set lbr                " when wrapping, dont break the word in half
set ignorecase         " search case is ignored
set smartcase          " dont ignore case if there are capitals
set hlsearch           " highlight all search results
set nomodeline         " don't read file for settings
set updatetime=100     " update faster
set colorcolumn=99

""" => vim mappings
" Navigate tabs
nmap <C-h> :tabprev<CR>
nmap <C-l> :tabnext<CR>
" map 0 to the first char of the line
map 0 ^
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprev<CR>
" open netrw in current file directory
nnoremap <leader>m :E<CR>
nnoremap <C-n> :e .<CR>
" clear highlight when starting a new one
nnoremap / :noh<CR>/
" copy filename into clipboard
nnoremap <silent> <leader>yf :let @+=expand("%")<CR>
" copy file into clipboard
nnoremap <silent> <leader>yc :%y+<CR>
" Format JSON using python
command! JSONFormat %!python -m json.tool %

""" => vim rust
let g:rust_recommended_style = 1
autocmd FileType rust nnoremap <silent> <leader>l :RustFmt <bar> w<CR>

""" => ale
let g:ale_linters = {'rust': ['analyzer', 'cargo']}
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_completion_enabled = 1

nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <silent> gr :ALEFindReferences<CR>
nnoremap <silent> gt :ALEGoToTypeDefinition<CR>
nnoremap <silent> <leader><space> :ALEHover<CR>
nnoremap <silent> <C-@> :ALECodeAction<CR>
nnoremap <silent> ]e <Plug>(ale_next_wrap)
nnoremap <silent> [e <Plug>(ale_previous_wrap)
let g:ale_floating_preview = 1
let g:ale_detail_to_flating_preview = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_floating_window_border = []
let g:ale_lint_on_text_changed = 'never'
let g:ale_virtualtext_cursor = 0
let g:ale_cursor_detail = 1 " preview window open cursor on issues
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
set completeopt=menu,menuone,popup,noinsert
