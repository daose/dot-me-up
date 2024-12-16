colorscheme retrobox
set noswapfile
set tabstop=2
set shiftwidth=2
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
set hidden             " allow unsaved buffers
set number
set autoread           " auto reload file if changed on disk
set clipboard+=unnamedplus
set signcolumn=yes
set scrolloff=5

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
nnoremap <leader>m :Explore<CR>
nnoremap <C-n> :e .<CR>
" clear highlight when starting a new one
nnoremap / :noh<CR>/
" copy filename into clipboard
nnoremap <silent> <leader>yf :let @+=expand("%")<CR>
" copy pay test command
nnoremap <silent> <leader>yt :let @+="pay test ".expand("%")." -l ".line(".")<CR>
" copy file into clipboard
nnoremap <silent> <leader>yc :%y+<CR>
" Format JSON using python
command! JSONFormat %!python -m json.tool %

""" => fzf
nnoremap <leader>f :Rg<space>
nnoremap <leader>b :Buffers<CR>
nnoremap <silent> <leader>s :Rg <C-r><C-w><CR>

let g:fzf_preview_window = ['hidden,up,75%', '?']
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" cache list of files by commit
nnoremap <C-p> :CFiles<CR>
"" proximity-sort to sort it w.r.t working directory
" function! s:list_cmd()
"   let base = fnamemodify(expand('%'), ':h:.:S')
"   # return base == '.' ? 'fd -t f' : printf('fd -t f | proximity-sort %s', expand('%'))
"   return 'fdfind -t f'
" endfunction
" 
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
"   \                               'options': '--tiebreak=index'}, <bang>0)

function! s:cache_list_cmd()
  " are we in a git folder
  let ref = system('git symbolic-ref -q HEAD 2>/dev/null')
  if ref == ''
    return $FZF_DEFAULT_COMMAND
  endif

  " trim the newline output from rev-parse
  let head_commit = system('git rev-parse HEAD | tr -d "\n"')
  let cache_file = '/tmp/'.head_commit.'.files'
  if !filereadable(expand(cache_file))
    execute 'silent !fdfind -t f > '.cache_file
  endif

  let base = fnamemodify(expand('%'), ':h:.:S')
  return printf('cat %s', cache_file)
  " return base == '.' ?
  "   \ printf('cat %s', cache_file) :
  "   \ printf('cat %s | proximity-sort %s', cache_file, expand('%'))
endfunction

command! -bang -nargs=? -complete=dir CFiles
  \ call fzf#vim#files(<q-args>, {'source': s:cache_list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)

""" => vim-fugitive
nnoremap <leader>ga :Git add %<CR>
nnoremap <leader>gd :Git difftool<CR>
xnoremap <silent> <leader>gy :GBrowse! master-passing-tests:%<CR>
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

""" coc.nvim
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> <leader><space> :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>l  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')
nmap <leader>l :Format<CR>

" Use <c-space> to trigger completion
nnoremap <c-space> <Plug>(coc-codeaction-cursor)

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
