
" Vim options I use
set autoread					" reload changed files back (prevents confusion)
set ignorecase					" ignore case in a searched pattern; searched case of normal letters is ignored
set listchars=tab:▷-,eol:⏎,space:·,trail:●,extends:»,precedes:<,conceal:⋯,nbsp:␣	" UTF-8 placeholders for white characters
set smartcase					" further enhances the `ignorecase` option; ignores case when the pattern contains lowercase letters only
set wildignorecase				" case is ignored when completing file names and directories

" The `<leader>` is a universal placeholder that depends on the global Vim settings and usually means pressing: \
nnoremap <c-s> <esc>:update<cr>			" Ctrl-s to save the changed file
nnoremap <leader>h :split			" split window horizontally
nnoremap <leader>r :registers<cr>		" list Vim registers (to show strings to paste)
nnoremap <leader>v :vsplit			" split window vertically
nnoremap <silent><c-l> :nohlsearch<cr><c-l>	" turn off the **highlighted** search string instead of typing `:noh`
nnoremap <silent><leader>c :set list!<cr>	" show/hide white characters, sometimes a source of nasty invisible bugs
nnoremap <silent><leader>s vip:sort<cr>		" sort a paragraph
nnoremap <silent><leader>w :set wrap!<cr>	" wrap/unwrap long lines
noremap <f1> <esc>				" disable annoying help

" Other shortcuts
iabbrev fxm FIXME:
iabbrev tdu TODO:
imap <f1> <esc>		" disable annoying help
