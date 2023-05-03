runtime defaults.vim

" Make quite sure that Vim never uses compatibility mode.
set nocompatible

" Show line numbers and set column length limit lines.
set number
set colorcolumn=80,90,100
hi ColorColumn ctermbg=darkgray guibg=lightgrey

" We want four-space tabs for everything by default.
set tabstop=4
set shiftwidth=4

" Always keep the cursor five lines away from the top or bottom of the screen.
set scrolloff=5

" Ignore case in searching (use \C to turn it back on)
set ignorecase
"
" Show number of matches and the current match in a search.
set shortmess-=S
" Show the current command and selection information.
set showcmd

" Make Vim use the system clipboard for copy and paste.
set clipboard=unnamedplus

" Set the default shell for :terminal and :shell to zsh
set shell=/bin/zsh

" Moving in entire pages isn't very nice. Half-pages are better. So, rebind
" page up/down for the occasional usage.
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>

" By default, move up and down between partial word-wrapped lines rather than
" always up and down a full line.
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

vnoremap j gj
vnoremap gj j
vnoremap k gk
vnoremap gk k

" Ampersand is hard to type for replace, but your hand is already on n; hence,
" use Ctrl-n instead.
nnoremap <C-n> &

" Shortcut for opening a terminal vertically.
nnoremap <C-w>t :vertical rightbelow term<CR>

" Set the appropriate custom syntax highlighting for each file type.
au BufRead,BufNewFile *.z80 set filetype=z80

" Make the highlight color for matching parentheses dark magenta.
hi MatchParen ctermbg=darkmagenta guibg=darkmagenta

" We rarely, if ever, want x to copy to the clipboard. Leave that to d instead.
nnoremap x "_x

" In normal mode, we want to highlight trailing whitespace in red. Don't do it
" in insert mode because that can get distracting.
hi TrailingSpace ctermbg=red guibg=red

function MatchTrailingSpace()
	call matchadd("TrailingSpace", '\v\s+$', -1, 50)
endfunction

call MatchTrailingSpace()
au InsertEnter * silent! call matchdelete(50)
au InsertLeave * silent! call MatchTrailingSpace()

" In insert mode, highlight leading space in blue and all tabs with a
" strikethrough. This allows us to easily tell when a file is using different
" conventions than desired.
hi LeadingSpaces ctermbg=darkgreen guibg=darkgreen
hi TabsAnywhere cterm=strikethrough gui=strikethrough

au InsertEnter * silent! call matchadd("LeadingSpaces", '\v(^\zs +\ze)|(\t\zs +\ze)', -1, 51)
au InsertLeave * silent! call matchdelete(51)

au InsertEnter * silent! call matchadd("TabsAnywhere", '\v\t', -1, 52)
au InsertLeave * silent! call matchdelete(52)
