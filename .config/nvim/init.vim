call plug#begin('~/.local/share/nvim/plugged')
" Run script below to install junegunn/vim-plug
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

""" => tagbar alternative
" https://github.com/liuchengxu/vista.vim

""" => javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

""" => coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""" => fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'lervag/vimtex', { 'for': ['tex'] }
Plug 'w0rp/ale'

Plug 'tpope/vim-rhubarb' " needed for fugitive :Gbrowse

Plug 'simeji/winresizer' " <C-E> to start resize mode

" Plug 'scrooloose/nerdtree'
" Plug 'vim-airline/vim-airline'
" Plug 'sheerun/vim-polyglot'
" Plug 'AndrewRadev/sideways.vim'
" Plug 'tpope/vim-surround'
" Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
" Plug 'larrylv/vim-vroom', { 'for': ['ruby'] } " for compatability with pay test
" Plug 'majutsushi/tagbar', { 'for': ['ruby', 'go'] }
" Plug 'ryanoasis/vim-devicons' "Requires this font: http://nerdfonts.com/, keep at bottom
call plug#end()

""" => coc
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

""" => vim-fugitive
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
nnoremap <silent> <leader>gst :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>

""" => vimtex
let g:tex_flavor = "latex"  " default to LaTeX not plaintex

""" => ale
let g:ale_fixers = {'rust': [], 'php': ['php_cs_fixer']}
let g:ale_linters = {'php': [], 'rust': []}
nnoremap <silent> <leader>r :ALEFix<CR>

""" => vim-rhubarb
" let g:github_enterprise_urls = ['https://git.corp.stripe.com']


""" => nerdtree
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
" let g:polyglot_disabled = ['latex']

""" => vim-easy-align
" Plug 'junegunn/vim-easy-align' " visual select, ga<delim>
" Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

""" => vroom
" let g:vroom_use_terminal = 1
" let g:vroom_use_bundle_exec = 0
" let g:vroom_test_unit_command = 'pay test '

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
