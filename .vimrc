set nocompatible                      " Disable vi-compatibility (must come before other options)

set autoindent                        " keep indentation when starting new lines
set backspace=indent,start,eol        " allow unrestricted backspacing in insert mode
set expandtab                         " always use spaces instead of tabs
set hidden                            " keep undo when changing buffers
set hlsearch                          " highlight search strings
set ignorecase                        " ignore case when searching
set nu                                " enable number lines
set shiftwidth=2                      " spaces per tab (when shifting)
set tabstop=2                         " spaces per tab
set whichwrap=b,h,l,s,<,>,[,],~       " allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
set wildignore+=*.o,.git,tmp,log      " patterns to ignore during file-navigation

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Vertical line at 80 characters
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Allow clicking to move cursor
if has('mouse')
  set mouse=a
endif

" Ruby
autocmd FileType ruby set shiftwidth=2 | set smartindent | set tabstop=2

" C
autocmd FileType c set shiftwidth=4 | set tabstop=4

" Objective-C
let filetype_m='objc'
autocmd FileType objc set shiftwidth=4 | set tabstop=4

" Prolog
let filetype_pl='prolog'
autocmd FileType prolog set shiftwidth=2 | set tabstop=2

" RSpec
autocmd BufNewFile,BufRead *_spec.rb set ft=ruby.spec

" Jasmine
autocmd BufNewFile,BufRead *_spec.js set ft=javascript.jasmine

" automatic, language-dependent indentation, syntax coloring and other
" functionality
filetype indent plugin on
syntax on

" pathogen stuff
call pathogen#runtime_append_all_bundles()  " add .vim/bundle subdirs to runtime path
call pathogen#helptags()                    " wasteful, but no shortage of grunt available

" ack
set grepprg=ack\ --column
set grepformat=%f:%l:%c:%m
autocmd QuickFixCmdPost [^l]* nested cw
autocmd QuickFixCmdPost l* nested lw

function! AckGrep(command)
  cexpr system("ack --column " . a:command)
  cw
endfunction

function! LackGrep(command)
  lexpr system("ack --column " . a:command)
  lw
endfunction

command! -nargs=+ -complete=file Ack call AckGrep(<q-args>)
nnoremap <leader>a :Ack<space>

" Command-T
let g:CommandTMatchWindowReverse   = 1
let g:CommandTMaxHeight            = 10
let g:CommandTMaxFiles             = 30000
let g:CommandTMaxCachedDirectories = 10
let g:CommandTScanDotDirectories   = 1
nnoremap <leader>f :CommandTFlush<CR>
nnoremap <silent> <leader>j :CommandTJump<CR>
nnoremap <leader>g :CommandTTag<CR>
if &term =~ "screen" || &term =~ "xterm"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-k>', '<ESC>OA']
endif

" prevent Align.vim from defining a bunch of maps starting with <leader>t
" and introducing an annoying delay when opening Command-T
let g:loaded_AlignMapsPlugin = "v41"

" Convert hashrockets to Ruby 1.9
nmap <leader>rh :%s/\v(:)@<!:([a-zA-Z_][a-zA-Z_0-9]*)(\s*)\=\>\s?/\2:\3/gc<cr>

" Solarized
colorscheme solarized
set background=dark
set t_Co=16

" Powerline
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'

" Map ctrl+space to autocomplete
inoremap <Nul> <C-n>
