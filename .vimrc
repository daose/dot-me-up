source $VIMRUNTIME/defaults.vim

""" => fzf
nnoremap <C-p> :Files<CR>
nnoremap <leader>f :Rg<space>
nnoremap <leader>b :Buffers<CR>
nnoremap <silent> <leader>s :Rg <C-r><C-w><CR>
let g:fzf_preview_window = ['up,75%', 'ctrl-/']
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
