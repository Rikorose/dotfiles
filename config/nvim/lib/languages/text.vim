let g:pencil#wrapModeDefault = 'soft'

set statusline=%<%f\ %h%m%r%w\ \ %{PencilMode()}\ %=\ col\ %c%V\ \ line\ %l\,%L\ %P
set rulerformat=%-12.(%l,%c%V%)%{PencilMode()}\ %P

augroup pencil
  autocmd!
  autocmd FileType text         call pencil#init()
  autocmd FileType markdown,mkd call pencil#init()
  autocmd Filetype git,gitsendemail,*commit*,*COMMIT*
                            \   call pencil#init({'textwidth': 72})
                            \ | setl spell spl=en_us et sw=2 ts=2 noai
  autocmd FileType latex,tex    call pencil#init()
augroup END
