:syn on
:set softtabstop=2
:set shiftwidth=2
:set expandtab
:set ai
:set hls
:set is
":set guifont=-b&h-lucidatypewriter-medium-r-normal-*-*-100-*-*-m-*-iso8859-1
:set guifont=bitstream\ vera\ sans\ mono\ 9
":set guifont=monospace\ 8
:set go=agimrLt

colorscheme oceandeep

function! CPlusPlusComment()
  map - 0i// <ESC>j
  map _ :s/^\s*\/\/ \=//g<CR>j
  set nocindent comments=:\/\/
endfunction

function! CComment()
  map - $a */<ESC>0i/* <ESC><CR>
  map _ :s/^\s*\/\* \=//g<CR>:s/ \=\*\/[ \t]*$//g<CR>j
  set nocindent comments=sr:/*,mb:*,ex:*/,://
endfunction

function! PoundComment()
  map - 0i# <ESC>j
  map _ :s/^\s*# \=//g<CR>j
  set comments=:#
endfunction

function! LaTeXComment()
  map - 0i% <ESC>j
  map _ :s/^\s*% \=//g<CR>j
  set comments=:%
endfunction  

autocmd BufEnter * doautocmd FileType

if &filetype == ""
  setfiletype text
endif

autocmd Filetype c                  call CComment()
autocmd Filetype cpp                call CPlusPlusComment()
autocmd Filetype java               call CPlusPlusComment()
autocmd Filetype perl               call PoundComment()
autocmd Filetype python             call PoundComment()
autocmd Filetype csh                call PoundComment()
autocmd Filetype sh                 call PoundComment()
autocmd Filetype make               call PoundComment()
autocmd Filetype conf               call PoundComment()
autocmd Filetype tex		    call LaTeXComment()
autocmd Filetype bbl		    call LaTeXComment()
