let g:deoplete#enable_at_startup = 1

function! s:check_back_space() abort
let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

lua << EOF
local nvim_lsp = require 'nvim_lsp'
nvim_lsp.pyls_ms.setup {
  root_dir = nvim_lsp.util.root_pattern(".git") or vim.loop.os_homedir;
  settings = {
    pyls = {
      configurationSources = {"flake8"};
    }
  }
}
EOF

autocmd FileType python setl omnifunc=nvim_lsp#omnifunc
