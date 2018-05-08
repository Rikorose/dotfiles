function! functions#StatuslineTag()
  if exists('b:git_dir')
    " Shitty unicode character w/o patched fonts
    return "‡".fugitive#head(7)
  else
    return fnamemodify(getwinvar(0, 'getcwd', getcwd()), ':t')
  endif
endfunction

" Use different status line for active vs. inactive buffers
function! functions#UpdateStatusLine(status)
  if &filetype=="qf"
    let &l:statusline=g:quickfixStatusLine
  elseif &filetype=="help" || &filetype=="netrw"
    let &l:statusline=&filetype
  elseif a:status
    let &l:statusline=g:activeStatusLine
  else
    " Just show filename & modified when inactive
    let &l:statusline='%f %{&modified ? "+" : ""}'
  endif
endfunction

" Helper for visual search
function! functions#VisualSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" Change to git root of current file (if in a repo)
function! functions#FindGitRootCD()
  let root = systemlist('git -C ' . expand('%:p:h') . ' rev-parse --show-toplevel')[0]
  if v:shell_error
    return ''
  else
    return {'dir': root}
  endif
endfunction

function! functions#GitRootCD()
  let result = functions#FindGitRootCD()
  if type(result) == type({})
    execute 'lcd' fnameescape(result['dir'])
    echo 'Now in '.result['dir']
  else
    echo 'Not in git repo!'
  endif
endfunction
