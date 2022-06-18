" Read configuration from .vimrc directory for comaptability
" with vim

set runtimepath^=~/.vim runtimepath +=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc
