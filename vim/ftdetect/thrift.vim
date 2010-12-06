" Thrift file detection
"
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/syntax/thrift.vim
