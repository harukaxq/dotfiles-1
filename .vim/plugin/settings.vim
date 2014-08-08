set autoindent                   " keep indentation when starting new lines
set autoread                     " automatically load external changes to files that don't have unsaved changes
set backspace=indent,start,eol   " allow unrestricted backspacing in insert mode
set expandtab                    " always use spaces instead of tabs
set hidden                       " keep undo when changing buffers
set history=1000                 " make vim remember more than 20 commands
set nu                           " enable number lines
set scrolloff=6                  " maintain 6 lines of context around the cursor
set shiftwidth=2                 " spaces per tab (when shifting)
set softtabstop=2                " spaces per tab (when tabbing/backspacing)
set tabstop=2                    " spaces per tab
set visualbell                   " replace beeping with a visual bell
set whichwrap=b,h,l,s,<,>,[,],~  " allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
set wildignore+=*.o,.git,tmp,log " patterns to ignore during file-navigation

" Searching
set hlsearch   " highlight search strings
set ignorecase " ignore case when searching
set incsearch  " incremental search
set smartcase  " ignore case when searching unless search string contains an uppercase character

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Vertical line at 80 characters
if exists('+colorcolumn')
  set colorcolumn=80
endif
