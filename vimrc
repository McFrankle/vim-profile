" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " For html, css, javascript, and PowerShell files, indent two spaces.
  autocmd FileType html setlocal shiftwidth=2 tabstop=2
  autocmd FileType css setlocal shiftwidth=2 tabstop=2
  autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
  autocmd FileType ps1 setlocal shiftwidth=2 tabstop=2

  " For C++ files, indent five spaces.
  autocmd FileType cpp setlocal shiftwidth=5 tabstop=5

  " For java files, indent three spaces.
  autocmd FileType java setlocal shiftwidth=3 tabstop=3
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Move various files which are auto-created by Vim.
set backupdir=~/.vimbackups//
set directory=~/.vimbackups//
set undodir=~/.vimbackups//
