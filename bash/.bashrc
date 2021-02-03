scripts_dir=${BASH_SOURCE%/*}
promts_file="$scripts_dir/prompt.bash"
aliases_file="$scripts_dir/aliases.bash"
path_exports_file="$scripts_dir/path_exports.bash"

# source common files
[ -f "$promts_file" ] && source "$promts_file" 
[ -f "$aliases_file" ] && source "$aliases_file" 
[ -f "$path_exports_file" ] && source "$path_exports_file" 

#source fzf commands
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
