""" => fzf
nnoremap <C-p> :Files<CR>
nnoremap <leader>f :Rg<space>
nnoremap <leader>b :Buffers<CR>
nnoremap <silent> <leader>s :Rg <C-r><C-w><CR>
let g:fzf_preview_window = ['up,75%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 1.0 } }

""" => custom colorscheme
set termguicolors

""" => coq
let g:coq_settings = {
      \ 'auto_start': v:true,
      \ 'keymap.recommended': v:false,
      \ 'display.pum.fast_close': v:false,
      \ 'keymap.manual_complete': v:null,
      \ 'keymap.jump_to_mark': '<C-j>',
      \ }
" recommended keymaps, except for <Esc>
" When selected, <Esc> will confirm + visual mode
ino <silent><expr> <Esc>   pumvisible() ? (complete_info().selected != -1 ? "\<C-y><Esc>" : "\<C-e><Esc>") : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

""" => floaterm
let g:floaterm_width=0.9
let g:floaterm_height=0.9
nnoremap <silent> ` :FloatermToggle<CR>
tnoremap <silent> ` <C-\><C-n>:FloatermToggle<CR>

""" => lua init
lua << EOF
require('gitsigns').setup {
  signs = {
    -- use "+" otherwise only colour is different between add and modify
    add = {hl = 'GitSignsAdd', text = '+', numhl='GitSignsAddNr', linehl='GitSignsAddLn'},
  }
}

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true
  }
}

-- LSP setup with coq
local coq = require "coq"
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '[e', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']e', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.diagnostic.config({
  virtual_text = false -- disable inline diagnostic, use ]e to navigate + show in popup window
})
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader><space>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>l', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-space>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-t>', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end
local servers = { 'rust_analyzer' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup(coq.lsp_ensure_capabilities({
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy"
        }
      }
    }
  }))
end
EOF

""" => gitsigns
nnoremap <leader>hp :Gitsigns preview_hunk<CR>
nnoremap <leader>hs :Gitsigns stage_hunk<CR>
nnoremap <leader>hu :Gitsigns reset_hunk<CR>
nnoremap ]c :Gitsigns next_hunk<CR>
nnoremap [c :Gitsigns prev_hunk<CR>

""" => vim-fugitive
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
nnoremap <leader>ga :Git add %<CR>
nnoremap <leader>gd :Git difftool<CR>

""" => nvim mappings
" Navigate tabs
nmap <C-h> :tabprev<CR>
nmap <C-l> :tabnext<CR>
" map 0 to the first char of the line
map 0 ^
" remove trailing spaces, turn off highlighting from search, then save
nnoremap <leader>dt :%s/\s\+$//e <bar> :noh <bar> :w<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprev<CR>
" open netrw in current file directory
nnoremap <leader>m :E<CR>
" clear highlight when starting a new one
nnoremap / :noh<CR>/
" copy filename into clipboard
nnoremap <silent> <leader>yf :let @+=expand("%")<CR>
" copy file into clipboard
nnoremap <silent> <leader>yc :%y+<CR>
nnoremap <silent> <leader>R :tabnew term://RUST_LOG=debug\ cargo\ test<CR>
" exit terminal with escape
tnoremap <silent> <Esc> <C-\><C-n>:FloatermToggle<CR>

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
" auto drop into insert mode
autocmd TermOpen * startinsert

""" => filetype specific settings
autocmd FileType java setlocal ts=4 sw=4
autocmd FileType sh setlocal ts=4 sw=4
autocmd FileType php setlocal ts=4 sw=4
autocmd FileType kotlin setlocal ts=4 sw=4
autocmd FileType rust setlocal cc=99
autocmd FileType javascript setlocal cc=80

command! JSONFormat %!python -m json.tool %
" command! MD2HTML !npx showdown makehtml -i % -o %:r.html && open %:r.html
