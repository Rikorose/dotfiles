set -gx PATH $PATH /sbin/
set -gx PATH $HOME/.local/bin/ $PATH
set -gx PATH $HOME/miniconda3/bin $PATH
source (conda info --root)/etc/fish/conf.d/conda.fish

export _JAVA_AWT_WM_NONREPARENTING=1

set -U EDITOR nvim

fish_vi_mode
