let g:deoplete#enable_smart_case = 1
set completeopt+=noinsert

" inoremap <silent><expr> <TAB>
"   \ pumvisible() ? "\<C-n>" :
"   \ neosnippet#expandable_or_jumpable() ?
"   \  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

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
  -- In case I'm reloading.
  vim.lsp.stop_all_clients()

  -- Mappings and settings
  local function lsp_setup(_)
    local function focusable_popup()
      local popup_win
      return function(winnr)
        if popup_win and nvim.win_is_valid(popup_win) then
          if nvim.get_current_win() == popup_win then
            nvim.ex.wincmd "p"
          else
            nvim.set_current_win(popup_win)
          end
          return
        end
        popup_win = winnr
      end
    end

    local diagnostic_popup = focusable_popup()
    local mappings = {
      ["K"]    = map_cmd [[call lsp#text_document_hover()]];
      ["ld"]   = map_cmd [[call lsp#text_document_definition()]];
      ["lD"]   = { function()
        local _, winnr = vim.lsp.util.show_line_diagnostics()
        diagnostic_popup(winnr)
      end };
      ["lp"]   = { function()
        local params = vim.lsp.protocol.make_text_document_position_params()
        local callback = vim.lsp.builtin_callbacks["textDocument/peekDefinition"]
        vim.lsp.buf_request(0, 'textDocument/definition', params, callback)
      end };
    }
    nvim.bo.omnifunc = "lsp#omnifunc"
    nvim_apply_mappings(mappings, { buffer = true; silent = true; })
  end

  local nvim_lsp = require 'nvim_lsp'
  nvim_lsp.pyls.setup {
    root_dir = nvim_lsp.util.root_pattern(".git") or vim.loop.os_homedir;
    settings = {
      pyls = {
        configurationSources = {"flake8"};
      }
    }
  }
end
EOF

autocmd Filetype python setl omnifunc=v:lua.vim.lsp.omnifunc
autocmd CompleteDone * pclose
