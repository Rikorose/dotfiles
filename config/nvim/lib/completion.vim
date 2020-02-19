let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#manual_complete()

imap <silent><expr><S-TAB>
  \ pumvisible() ? "\<C-p>" : "\<S-TAB>"

function! s:check_back_space() abort
let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand)

inoremap <expr><CR>
  \ pumvisible() ? "\<C-y>"
  \ : "\<CR>"

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger='<leader>e'
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

lua << EOF
if vim.lsp then
  local nvim_lsp = require 'nvim_lsp'
  nvim_lsp.texlab.setup{}
  nvim_lsp.bashls.setup{}
  nvim_lsp.jsonls.setup{}
  nvim_lsp.ccls.setup{}
  nvim_lsp.pyls_ms.setup {
    root_dir = nvim_lsp.util.root_pattern(".git") or vim.loop.os_homedir;
    settings = {
      python = {
        jediEnabled = true,
        autocomplete = {
          showAdvancedMembers = false,
          addBrackets = true
        },
        linting = {
          enabled = true,
          pylintEnabled = false,
          flake8Path = vim.fn.exepath("flake8");
          flake8Enabled = true,
          flake8Args = { "--ignore=E501,E203" }
        },
        formatting = {
          provider = "black"
        }
      }
    }
  }
end
EOF

" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
