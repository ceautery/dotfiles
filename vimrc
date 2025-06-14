set rtp+=~/.vim/bundle/neobundle.vim/

runtime! custom_preconfig/*.vim
runtime! common_config/*.vim
runtime! custom_config/*.vim

" for git, add spell checking and automatic wrapping at 72 columns
autocmd Filetype gitcommit setlocal spell textwidth=72

let &t_EI = "\<Esc>]1337;CursorShape=0\x7"
let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
set ttm=0

highlight MatchParen term=underline cterm=underline gui=underline guibg=NONE ctermbg=NONE

" Yank current filename to system pastebin
map y% :let @+ = expand("%")<cr>
