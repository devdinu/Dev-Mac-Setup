# ZSH Configurations
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="random"
export ZSH_CUSTOM="$HOME/Documents/Projects/my-configs/zsh-custom"
plugins=(git)

# Set variables before sourcing as it will load configs accordingly
source $ZSH/oh-my-zsh.sh


# overriding emacs with the new installed emacs 24 version
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw $*'