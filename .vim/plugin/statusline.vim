" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
if has('statusline')
  set statusline=%n    " buffer number
  set statusline+=:    " (literal)
  set statusline+=%<   " truncation point, if not enough width available
  set statusline+=%f   " relative path to file
  set statusline+=\    " space
  set statusline+=%1*  " switch to User1 highlight group (italics)

  " needs to be all on one line:
  "   %(                   start item group
  "   %M                   modified flag: ,+/,- (modified/unmodifiable) or nothing
  "   %R                   read-only flag: ,RO or nothing
  "   %{statusline#ft()}   filetype (not using %Y because I don't want caps)
  "   %{statusline#fenc()} file-encoding if not UTF-8
  "   %)                   end item group
  set statusline+=%(%M%R%{statusline#ft()}%{statusline#fenc()}%)

  set statusline+=%*   " reset highlight group
  set statusline+=%=   " split point for left and right groups
  set statusline+=\    " space
  set statusline+=%1*  " switch to User1 highlight group (italics)
  set statusline+=%p   " percentage through buffer
  set statusline+=%%   " literal %
  set statusline+=%*   " reset highlight group
  set statusline+=\    " space
  set statusline+=%l   " current line number
  set statusline+=/    " (literal)
  set statusline+=%L   " number of lines in buffer
  set statusline+=\    " space
  set statusline+=@    " (literal)
  set statusline+=\    " space
  set statusline+=%c   " current column number
  set statusline+=%V   " current virtual column number (-n), if different

  augroup LencioniStatusline
    autocmd!
    autocmd ColorScheme * call statusline#update_user1()
  augroup END
endif
