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

" Ignore case in searching by default.
set ignorecase

" Show number of matches and the current match in a search.
set shortmess-=S
" Show the current command and selection information.
set showcmd

" Make Vim use the system clipboard for copy and paste.
set clipboard=unnamedplus

" Set the default shell for :terminal and :shell to zsh
set shell=/bin/zsh

" Moving in entire pages isn't very nice. Half-pages are better. So, rebind
" page up/down for occasional convenience when browsing files.
noremap <PageUp> <C-u>
noremap <PageDown> <C-d>

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

" We rarely, if ever, want x to copy to the clipboard. Leave that to d and c
" and suchlike instead.
nnoremap x "_x
vnoremap x "_x

" Similarly, we don't want p to copy the text that was pasted over.
vnoremap p P
vnoremap P p

" We want to make searches very not magic by default, and only do a very magic
" regex search if explicitly requested with ?. Case sensitivity (and word
" word boundary matching for *) is enabled with g prefix. Additionally,
" make # do a search based on the current selection.
nnoremap / /\V
nnoremap g/ /\V\C
nnoremap ? /\v\C
nnoremap * /\V<C-r>=escape(expand('<cword>'), '/\')<Enter><Enter>
nnoremap g* /\V\C\<<C-r>=escape(expand('<cword>'), '/\')<Enter>\><Enter>
nnoremap # v"zy/\V<C-r>=escape(@z, '/\')<Enter><Enter>
nnoremap g# v"zy/\V\C<C-r>=escape(@z, '/\')<Enter><Enter>

vnoremap / /\V
vnoremap g/ /\V\C
vnoremap ? /\v\C
vnoremap * /\V<C-r>=escape(expand('<cword>'), '/\')<Enter><Enter>
vnoremap g* /\V\C\<<C-r>=escape(expand('<cword>'), '/\')<Enter>\><Enter>
vnoremap # "zy/\V<C-r>=escape(@z, '/\')<Enter><Enter>
vnoremap g# "zy/\V\C<C-r>=escape(@z, '/\')<Enter><Enter>

" For global substitution, emulate the functionality of the search commands
" with a prefix of M.
noremap M <nop>
noremap gM <nop>
command M call feedkeys('``')

nnoremap M/ m`:%s/\V/g<Bar>M<Left><Left><Left><Left>
nnoremap gM/ m`:%s/\V\C/g<Bar>M<Left><Left><Left><Left>
nnoremap M? m`:%s/\v\C/g<Bar>M<Left><Left><Left><Left>
nnoremap M* m`:%s/\V<C-r>=escape(expand('<cword>'), '/\')<Enter>//g<Bar>M<Left><Left><Left><Left>
nnoremap gM* m`:%s/\V\C\<<C-r>=escape(expand('<cword>'), '/\')<Enter>\>//g<Bar>M<Left><Left><Left><Left>
nnoremap M# m`v"zy:%s/\V<C-r>=escape(@z, '/\')<Enter>//g<Bar>M<Left><Left><Left><Left>
nnoremap gM# m`v"zy:%s/\V\C<C-r>=escape(@z, '/\')<Enter>//g<Bar>M<Left><Left><Left><Left>

vnoremap M/ m`:s/\%V\V/g<Bar>M<Left><Left><Left><Left>
vnoremap gM/ m`:s/\%V\V\C/g<Bar>M<Left><Left><Left><Left>
vnoremap M? m`:s/\%V\v\C/g<Bar>M<Left><Left><Left><Left>
vnoremap M* m`:s/\%V\V<C-r>=escape(expand('<cword>'), '/\')<Enter>//g<Bar>M<Left><Left><Left><Left>
vnoremap gM* m`:s/\%V\V\C\<<C-r>=escape(expand('<cword>'), '/\')<Enter>\>//g<Bar>M<Left><Left><Left><Left>
vnoremap M# m`"zy:%s/\V<C-r>=escape(@z, '/\')<Enter>//g<Bar>M<Left><Left><Left><Left>
vnoremap gM# m`"zy:%s/\V\C<C-r>=escape(@z, '/\')<Enter>//g<Bar>M<Left><Left><Left><Left>

" For a single substitution, do the same as above but with a prefix of m.
noremap gm <nop>
command E let @/=@/[11:]<Bar>call feedkeys('``n``')

nnoremap m/ m`:s/\v(%#.*)@<=\V/e<Bar>E<Left><Left><Left><Left>
nnoremap gm/ m`:s/\v(%#.*)@<=\V\C/e<Bar>E<Left><Left><Left><Left>
nnoremap m? m`:s/\v(%#.*)@<=\v\C/e<Bar>E<Left><Left><Left><Left>
nnoremap m* m`:s/\v(%#.*)@<=\V<C-r>=escape(expand('<cword>'), '/\')<Enter>//e<Bar>E<Left><Left><Left><Left>
nnoremap gm* m`:s/\v(%#.*)@<=\V\C\<<C-r>=escape(expand('<cword>'), '/\')<Enter>\>//e<Bar>E<Left><Left><Left><Left>
nnoremap m# m`v"zy:s/\v(%#.*)@<=\V<C-r>=escape(@z, '/\')<Enter>//e<Bar>E<Left><Left><Left><Left>
nnoremap gm# m`v"zy:s/\v(%#.*)@<=\V\C<C-r>=escape(@z, '/\')<Enter>//e<Bar>E<Left><Left><Left><Left>

vnoremap m/ m`:s/\v(%#.*)@<=\V/e<Bar>E<Left><Left><Left><Left>
vnoremap gm/ m`:s/\v(%#.*)@<=\V\C/e<Bar>E<Left><Left><Left><Left>
vnoremap m? m`:s/\v(%#.*)@<=\v\C/e<Bar>E<Left><Left><Left><Left>
vnoremap m* m`:s/\v(%#.*)@<=\V<C-r>=escape(expand('<cword>'), '/\')<Enter>//e<Bar>E<Left><Left><Left><Left>
vnoremap gm* m`:s/\v(%#.*)@<=\V\C\<<C-r>=escape(expand('<cword>'), '/\')<Enter>\>//e<Bar>E<Left><Left><Left><Left>
vnoremap m# m`"zy:s/\v(%#.*)@<=\V<C-r>=escape(@z, '/\')<Enter>//e<Bar>E<Left><Left><Left><Left>
vnoremap gm# m`"zy:s/\v(%#.*)@<=\V\C<C-r>=escape(@z, '/\')<Enter>//e<Bar>E<Left><Left><Left><Left>

" Finally, define Ctrl-n, which can be used to repeat a subsitution.
nnoremap <C-n> m`:&&<Bar>M<Enter>
vnoremap <C-n> m`:&&<Bar>M<Enter>

" Quicker shortcuts for opening a terminal horizontally and vertically.
noremap <C-w>t :vertical rightbelow term<CR>
noremap <C-w>T :horizontal rightbelow term<CR>

" We don't want pesky double spaces after periods when word wrapping with gw.
set nojoinspaces

" Set the appropriate custom syntax highlighting for each file type.
au BufRead,BufNewFile *.z80 set filetype=z80

" Make the highlight color for matching parentheses dark magenta.
hi MatchParen ctermbg=darkmagenta guibg=darkmagenta

" Make it easier to switch between different indentation sizes.
command -nargs=1 Spaces set expandtab tabstop=<args> shiftwidth=<args>
command -nargs=1 Tabs set noexpandtab tabstop=<args> shiftwidth=<args>

" In normal mode, we want to highlight trailing whitespace in red. Don't do it
" in insert mode because that can get distracting.
hi TrailingSpace ctermbg=red guibg=red

function MatchTrailingSpace()
	call matchadd("TrailingSpace", '\v\s+$', -1, 50)
endfunction

call MatchTrailingSpace()
au InsertEnter * silent! call matchdelete(50)
au InsertLeave * silent! call MatchTrailingSpace()

" In insert mode, highlight leading space in green and all tabs with a
" strikethrough. This allows us to easily tell when a file is using different
" conventions than desired.
hi LeadingSpaces ctermbg=darkgreen guibg=darkgreen
hi TabsAnywhere cterm=strikethrough gui=strikethrough

au InsertEnter * silent! call matchadd("LeadingSpaces", '\v(^\zs +\ze)|(\t\zs +\ze)', -1, 51)
au InsertLeave * silent! call matchdelete(51)

au InsertEnter * silent! call matchadd("TabsAnywhere", '\v\t', -1, 52)
au InsertLeave * silent! call matchdelete(52)
