# ZSH Configurations
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="random"
source $ZSH/oh-my-zsh.sh

plugins=(git)

# overriding emacs with the new installed emacs 24 version 
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw $*'
alias subl='/Applications/Sublime2.app/Contents/SharedSupport/bin/subl'
