if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

" 'smartindent' works well enough.
setlocal autoindent smartindent nocindent indentexpr=
setlocal cinwords=if,else,while,for
