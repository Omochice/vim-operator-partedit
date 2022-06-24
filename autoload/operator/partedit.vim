let s:save_cpo = &cpo
set cpo&vim

function! operator#partedit#start(_) abort
  let l:head_linenr = line("'[")
  let l:tail_linenr = line("']")
  if l:tail_linenr > l:tail_linenr
    return
  endif
  call partedit#start(line("'["), line("']"))
endfunction

function! operator#partedit#codeblock(_) abort
  let l:head_linenr = line("'[")
  let l:tail_linenr = line("']")

  " NOTE: Deny reverced range
  if l:head_linenr > l:tail_linenr
    return
  endif

  if getline(l:head_linenr) =~# '```'
    " case1: contain fence
    if l:head_linenr + 1 ==# l:tail_linenr
      " select codeblock that cantain no code area
      return
    endif
    let l:filetype = matchstr(getline(l:head_linenr), '\v```\s*\zs[-a-zA-Z0-9]+\ze')
    call partedit#start(l:head_linenr+1, l:tail_linenr-1, { 'filetype': l:filetype })
    return
  else
    " case2: not contain fence
    let l:filetype = matchstr(getline(l:head_linenr), '\v```\s*\zs[-a-zA-Z0-9]+\ze')
    call partedit#start(l:head_linenr, l:tail_linenr, { 'filetype': l:filetype })
    return
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

