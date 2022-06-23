let s:save_cpo = &cpo
set cpo&vim

function! operator#partedit#start(_) abort
  call partedit#start(line("'["), line("']"))
endfunction

function! operator#partedit#codeblock(_) abort
  echomsg 'codeblock'
  if getline(line("'[")) =~# '```'
    " case1: contain fence
    if line("'[") + 1 ==# line("']")
      " select codeblock that cantain no code area
      return
    endif
    let l:filetype = matchstr(getline(line("'[")), '\v```\s*\zs[-a-zA-Z0-9]+\ze')
    echomsg 'case1'
    call partedit#start(line("'[")+1, line("']")-1, { 'filetype': l:filetype })
    return
  else
    " case2: not contain fence
    let l:filetype = matchstr(getline(line("'[")-1), '\v```\s*\zs[-a-zA-Z0-9]+\ze')
    echomsg 'case2'
    call partedit#start(line("'["), line("']"), { 'filetype': l:filetype })
    return
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

