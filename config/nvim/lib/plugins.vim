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
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/deoplete-lsp'
  let g:deoplete#enable_at_startup = 1
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  "Plug 'honza/vim-snippets'
  Plug 'neovim/nvim-lsp'
  Plug 'jiangmiao/auto-pairs'
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " }}}

  " FZF {{{
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " }}}

  " Text {{{
  let g:tex_flavor = "latex"
  " Markdown preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
  " Grammar plugin for latex
  Plug 'rhysd/vim-grammarous'
  " }}}
  
  " Tmux integration {{{
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'wellle/tmux-complete.vim'
  " }}}

call plug#end()

" enable full plugin support
filetype plugin on
syntax enable
