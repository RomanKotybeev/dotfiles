set shiftwidth=4
if !exists('g:python_indent')
  let g:python_indent = {}
endif
let g:python_indent.open_paren = 'shiftwidth()'
let g:python_indent.closed_paren_align_last_line = v:false
