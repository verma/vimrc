" Vala specific properties
"
" Only do this when not done yet for this buffer
if exists("b:loaded_py_ftplugin")
  finish
endif
let b:loaded_py_ftplugin = 1

" setup indentation the way we like it
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab

