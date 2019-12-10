set rtp+=~/.vim/bundle/neobundle.vim/

autocmd Filetype gitcommit setlocal spell textwidth=72

set ttimeoutlen=0
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI = "\<Esc>]50;CursorShape=1\x7"

map y% :let @+ = expand("%")<cr>
