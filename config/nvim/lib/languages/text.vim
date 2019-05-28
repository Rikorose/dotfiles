let g:pencil#wrapModeDefault = 'soft'

set statusline=%<%f\ %h%m%r%w\ \ %{PencilMode()}\ %=\ col\ %c%V\ \ line\ %l\,%L\ %P
set rulerformat=%-12.(%l,%c%V%)%{PencilMode()}\ %P

augroup vimrc-languages-text
  autocmd!
  autocmd FileType text call pencil#init()

augroup END
