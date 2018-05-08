function fish_compgen
  source $HOME/.config/fish/config.fish
  find $PATH -type f -printf "%f\n" ;and functions | tr ', ' '\n'
end
