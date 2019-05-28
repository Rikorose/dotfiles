" Automatically download vim-plug, if not present
if !filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
  echo 'vim-plug not installed, downloading'
  !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo 'vim-plug downloaded, will install plugins once vim loads'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

  " Color scheme {{{
  Plug 'rakr/vim-one'
  " }}}

  " Syntax highlighting {{{
  Plug 'sheerun/vim-polyglot'
  let g:polyglot_disabled = ['latex']
  Plug 'nathanaelkane/vim-indent-guides'
  " }}}

  " Git integration {{{
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-signify'
  " }}}
  
  " Language plugin {{{
  Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install() } }
  " }}}
  
  " FZF {{{
  if executable('fzf')
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
  end
  " }}}
  
  " Latex {{{
  Plug 'reedes/vim-pencil'
  let g:tex_flavor = "latex"
  Plug 'lervag/vimtex', { 'for': ['tex', 'latex'] }
  let g:vimtex_compiler_progname = 'nvr'
  let g:vimtex_view_general_viewer = 'zathura'
  let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
  " Grammar plugin for latex
  Plug 'rhysd/vim-grammarous'
  " }}}
  
  " Tmux integration {{{
  Plug 'christoomey/vim-tmux-navigator'
  " }}}

call plug#end()

" enable full plugin support
filetype plugin indent on
syntax enable
