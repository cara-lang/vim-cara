setlocal indentexpr=CaraIndent()

function! CaraIndent()
  let line = getline(v:lnum)

  let previousNum = prevnonblank(v:lnum - 1)
  let previous = getline(previousNum)

  let prepreNum = prevnonblank(v:lnum - 2)
  let prepre = getline(prepreNum)

  if previous =~ " then\\s*$"
    return indent(previousNum) + &tabstop
  endif

  if prepre =~ " then\\s*$" && previous !~ " else\\s*$"
    return indent(previousNum) - &tabstop
  endif

  if previous =~ " else\\s*$"
    return indent(previousNum) + &tabstop
  endif

  if previous =~ " of\\s*$"
    return indent(previousNum) + &tabstop
  endif

  if previous =~ " ->\\s*$"
    return indent(previousNum) + &tabstop
  endif

  if previous =~ " where\\s*$"
    return indent(previousNum) + &tabstop
  endif

  if previous =~ " =\\s*$"
    return indent(previousNum) + &tabstop
  endif

  return indent(previousNum)

endfunction
