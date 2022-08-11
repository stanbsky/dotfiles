let g:python3_host_prog = '/usr/bin/python3'
let g:airline_powerline_fonts = 1
" https://github.com/vim-airline/vim-airline/issues/1779
let g:airline_highlighting_cache = 1

set clipboard=unnamed

set pastetoggle=<leader>P
noremap <leader>V :e ~/.config/nvim/init.vim<CR>
noremap <leader>VV :e ~/.config/nvim/local_init.vim<CR>
noremap <leader>VS :source ~/.config/nvim/init.vim<CR>

noremap <leader>S :set scrollbind!<CR>

set backupdir=~/.nvim/tmp/backup//
set directory=~/.nvim/tmp/swp//
set undodir=~/.nvim/tmp/undo//

let g:seoul256_background = 234
silent! colorscheme seoul256
let g:airline_theme='seoul256'

let g:doge_doc_standard_python = 'google'
noremap <Leader>D :DogeGenerate<CR>

nnoremap <leader>t oimport pdb;pdb.set_trace()<Esc>
" delete buffer without closing split
nnoremap <leader>c :bp\|bd # <cr>

" vim performance profiling
nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>DP :exe ":profile pause"<cr>
nnoremap <silent> <leader>DC :exe ":profile continue"<cr>
nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>

let g:slime_target = "neovim"

" fix highlighting
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" SYS3
noremap <F5> <Esc>:w<bar>!source code/smake week34<CR>
inoremap <F5> <C-o>:w<bar>!source code/smake week34<CR>

inoremap '' `

" Start a repl for vim-slime
fun! StartREPL(repl)
  execute 'terminal '.a:repl
  " execute 'terminal ghci'
  setlocal nonumber
  let t:term_id = b:terminal_job_id
  wincmd p
  execute 'let b:slime_config = {"jobid": "'.t:term_id . '"}'
endfun

noremap <silent> tp :vsplit<bar>:call StartREPL('ipython')<CR>
noremap <silent> th :vsplit<bar>:call StartREPL('ghci')<CR>

tnoremap <Esc> <C-\><C-n>

