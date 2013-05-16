call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set rtp+=$GOROOT/misc/vim
filetype on
filetype plugin indent on
syntax on
set tags=.tags,~/.tags,~/code/opensource/tags

" line numberings
set number
set t_Co=256
colorscheme blazer
set nocompatible
set history=10000
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smartindent

set backspace=indent,eol,start
set winwidth=79
set showcmd
set cmdheight=1
" case-sensitive search online if query contains uppercase
set smartcase
set incsearch
" highlighted search: hit return to kill the current highlight
set hlsearch
nnoremap <CR> :noh<CR>
highlight Search ctermbg=white ctermfg=black cterm=underline

set laststatus=2
set statusline=%<%f\ (%{&ft})\ %{fugitive#statusline()}\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" hashrocket (cribbed from DAS screencast)
imap <c-l> <space>=><space>

" go to last position when reopening file
if has("autocmd")
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
endif

" switch off MatchParen, it's annoying
let g:loaded_matchparen = 0

" installs Shell command to run commands into a scratch window
function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize ' . line('$')
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)
