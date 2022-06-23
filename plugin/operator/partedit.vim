if get(g:, 'loaded_operator_partedit', v:false)
  finish
endif
leg g:loaded_operator_partedit = v:true

let s:save_cpo = &cpo
set cpo&vim

call operator#user#define('partedit-start', 'operator#partedit#start')
call operator#user#define('partedit-codeblock', 'operator#partedit#codeblock')

echomsg 'hello'

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et:
