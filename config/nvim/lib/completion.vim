let g:neosnippet#snippets_directory='~/.config/nvim/snippets/'

imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

imap <expr><S-TAB>
 \ pumvisible() ? "\<C-p>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<S-TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
set shortmess+=c

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

let g:completion_enable_snippet = 'Neosnippet'
let g:completion_word_min_length = 1
let g:completion_trigger_on_delete = 1
let g:completion_matching_strategy_list = ['exact', 'fuzzy']

function! s:check_back_space() abort
let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'buffers', 'path', 'snippets']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]
let g:completion_auto_change_source = 1


let g:completion_items_priority = {
        \ 'Field': 8,
        \ 'Function': 8,
        \ 'Variable': 9,
        \ 'Method': 8,
        \ 'Interfaces': 6,
        \ 'Constant': 6,
        \ 'Class': 6,
        \ 'Struct': 6,
        \ 'Keyword': 5,
        \ 'Treesitter': 4,
        \ 'Neosnippet' : 0,
        \ 'snippets' : 0,
        \ 'Buffers' : 2,
        \ 'Path' : 2,
        \}

" inoremap <C-n> <Plug>(completion_next_source)
" inoremap <C-p> <Plug>(completion_prev_source)

lua << EOF
function print_attach(client, bufnr)
  print('attach' .. bufnr)
end
local lsp = require 'lspconfig'
local util = require 'lspconfig/util'
-- print(vim.loop.getcwd())
lsp.pyright.setup{
  settings = {
    pyright = { useLibraryCodeForTypes = false; };
    python = {
      analysis = { 
        useLibraryCodeForTypes = false;
        autoSearchPaths = true;
      };
      venvPath = vim.loop.os_homedir() .. "/.virtualenvs";
    } 
  }
}
-- lsp.jedi_language_server.setup {
--   root_dir = function(fname)
--     return util.find_git_ancestor(fname) or util.root_pattern("setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt") or vim.loop.os_homedir()
--   end;
-- };
lsp.texlab.setup{
  settings = {
    latex = {
      build = {
        onSave = true;
      }
    }
  }
};
lsp.gopls.setup{}
lsp.rust_analyzer.setup{}
EOF

" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> <leader>lf    <cmd>lua vim .lsp.buf.formatting(nil)<CR>
nnoremap <silent> dn <cmd>lua vim.lsp.diagnostic.goto_next { wrap = true }<CR>
nnoremap <silent> dp <cmd>lua vim.lsp.diagnostic.goto_prev { wrap = true }<CR>
