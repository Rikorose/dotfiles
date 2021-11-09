if !has('nvim-0.5')
  echohl Error
  echomsg "nvim-lua requires neovim > v0.5, no config will be loaded"
  echohl clear
  " do not load any plugins, equivalent to '--noplugin'
  set nolpl
  " use our embark color scheme
  set termguicolors
  colorscheme embark
  " no further configuration
  finish
end

lua require 'init'
