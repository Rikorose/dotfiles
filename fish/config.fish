set -gx PATH /sbin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/miniconda3/bin $PATH
source (conda info --root)/etc/fish/conf.d/conda.fish

export _JAVA_AWT_WM_NONREPARENTING=1

set -x QT_QPA_PLATFORMTHEME qt5ct

set -U EDITOR nvim

fish_vi_key_bindings
