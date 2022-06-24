if get(g:, 'loaded_operator_partedit', v:false)
  finish
endif
let g:loaded_operator_partedit = v:true

let s:save_cpo = &cpo
set cpo&vim

call operator#user#define('partedit-start', 'operator#partedit#start')
call operator#user#define('partedit-codeblock', 'operator#partedit#codeblock')

let &cpo = s:save_cpo
unlet s:save_cpo

