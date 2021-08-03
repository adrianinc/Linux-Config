
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

set hlsearch
set incsearch
set ignorecase
set smartcase

syntax on
set number

filetype on
set ruler
set mouse=a

execute "set <M-y>=\ey"
execute "set <M-e>=\ee"
execute "set <M-k>=\ek"
execute "set <M-j>=\ej"
nnoremap <M-y> 4<C-y>
nnoremap <M-e> 4<C-e>
nnoremap <M-k> 4k 
nnoremap <M-j> 4j

" Search for visually selected text
"   To use the mapping, visually select the characters that are wanted in the search, 
"   then type // to search for the next occurrence of the selected text. Then press n 
"   to search for the next occurrence.
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>


