#!/bin/bash

# Load python module
module load python

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/local/python3.7-Anaconda3-2019.07/installation/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/local/python3.7-Anaconda3-2019.07/installation/etc/profile.d/conda.sh" ]; then
		. "/local/python3.7-Anaconda3-2019.07/installation/etc/profile.d/conda.sh"
	else
		export PATH="/local/python3.7-Anaconda3-2019.07/installation/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Load npm manually
export PATH=$PATH:/local/node/bin
export MANPATH=$MANPATH:/local/node/share/man
