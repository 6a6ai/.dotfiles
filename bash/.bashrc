# source common files
[ -f ./prompt.bash ] && source ./prompt.bash
[ -f ./aliases.bash ] && source ./aliases.bash
[ -f ./path_exports.bash ] && source ./path_exports.bash

# backup current .vimrc and create a symlink to one stored under $HOME/.dotfiles/vim/.vimrc
[ -f ~/.vimrc ] && mv -iv ~/.vimrc ~/.vimrc.custom_backup
ln -sv ~/.dotfiles/vim/.vimrc ~/ 


#source fzf commands
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
