runtime defaults.vim

" Make quite sure that Vim never uses compatibility mode.
set nocompatible

" You'd think that everyone would enable these by default, but nooooo...
syntax on
set mouse=a

" Show line numbers and set column length limit lines.
set number
set colorcolumn=80,90,100
hi ColorColumn ctermbg=darkgray guibg=lightgrey

" We want four-space tabs for everything by default. Also, there are almost no
" situations where we don't want auto-indentation, so enable it by default.
set tabstop=4
set shiftwidth=4
set autoindent

" Always keep the cursor five lines away from the top or bottom of the screen.
set scrolloff=5

" Ignore case in searching by default.
set ignorecase

" Show number of matches and the current match in a search.
set shortmess-=S
" Show the current command and selection information.
set showcmd

" Tab completion for opening files should emulate the way shells do it.
set wildmode=list:longest

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
" regex search if explicitly requested with ?. Case sensitivity (plus word
" word boundary matching for *) is enabled with g prefix, except for regex
" searches with ? where it is always enabled. Additionally, we have # do a
" search based on the current selection. Both * and # escape any slashes in
" the input. Note that the ? and # commands override the normal backwards
" searches, but using N to find the previous match is generally fine.
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

" For global substitution, imitate the functionality of the search commands
" with a prefix of M. After executing the substitution, we want to place the
" cursor back at its original position to make editing more seamless. Since
" doing so may remove the message showing how many substitutions occurred,
" we need to reshow the message again afterwards. Unfortunately, the message
" sometimes doesn't appear in the first place, so we need to echo a blank line
" into the message history first so that we don't show a nonsensical message.
noremap M <nop>
noremap gM <nop>
command M call feedkeys('``:1messages<Enter>')

nnoremap M/ m`:echom ""<Enter>:%s/\V/g<Bar>M<Left><Left><Left><Left>
nnoremap gM/ m`:echom ""<Enter>:%s/\V\C/g<Bar>M<Left><Left><Left><Left>
nnoremap M? m`:echom ""<Enter>:%s/\v\C/g<Bar>M<Left><Left><Left><Left>
nnoremap M* m`:echom ""<Enter>:%s/\V<C-r>=escape(expand('<cword>'), '/\')<Enter>//g<Bar>M<Left><Left><Left><Left>
nnoremap gM* m`:echom ""<Enter>:%s/\V\C\<<C-r>=escape(expand('<cword>'), '/\')<Enter>\>//g<Bar>M<Left><Left><Left><Left>
nnoremap M# m`v"zy:echom ""<Enter>:%s/\V<C-r>=escape(@z, '/\')<Enter>//g<Bar>M<Left><Left><Left><Left>
nnoremap gM# m`v"zy:echom ""<Enter>:%s/\V\C<C-r>=escape(@z, '/\')<Enter>//g<Bar>M<Left><Left><Left><Left>

vnoremap M/ m`:<BS><BS><BS><BS><BS>echom ""<Enter>:'<,'>s/\%V\V/g<Bar>M<Left><Left><Left><Left>
vnoremap gM/ m`:<BS><BS><BS><BS><BS>echom ""<Enter>:'<,'>s/\%V\V\C/g<Bar>M<Left><Left><Left><Left>
vnoremap M? m`:<BS><BS><BS><BS><BS>echom ""<Enter>:'<,'>s/\%V\v\C/g<Bar>M<Left><Left><Left><Left>
vnoremap M* m`:<BS><BS><BS><BS><BS>echom ""<Enter>:'<,'>s/\%V\V<C-r>=escape(expand('<cword>'), '/\')<Enter>//g<Bar>M<Left><Left><Left><Left>
vnoremap gM* m`:<BS><BS><BS><BS><BS>echom ""<Enter>:'<,'>s/\%V\V\C\<<C-r>=escape(expand('<cword>'), '/\')<Enter>\>//g<Bar>M<Left><Left><Left><Left>
vnoremap M# m`"zy:echom ""<Enter>:%s/\V<C-r>=escape(@z, '/\')<Enter>//g<Bar>M<Left><Left><Left><Left>
vnoremap gM# m`"zy:echom ""<Enter>:%s/\V\C<C-r>=escape(@z, '/\')<Enter>//g<Bar>M<Left><Left><Left><Left>

" For a single substitution, do the same as above but with a prefix of m.
" These regexes are more disgusting because we need to check that the cursor
" precedes the searched text, since the substitution will otherwise replace
" matching text that precedes the cursor in the current line. After executing
" the substitution, we need to trim off this backreference and set that as the
" search string since the backreference prevents searching backwards with N.
noremap gm <nop>
command E let @/=@/[14:]<Bar>M

nnoremap m/ m`:echom ""<Enter>:s/\%(\%#.*\)\@<=\V/e<Bar>E<Left><Left><Left><Left>
nnoremap gm/ m`:echom ""<Enter>:s/\%(\%#.*\)\@<=\V\C/e<Bar>E<Left><Left><Left><Left>
nnoremap m? m`:echom ""<Enter>:s/\%(\%#.*\)\@<=\v\C/e<Bar>E<Left><Left><Left><Left>
nnoremap m* m`:echom ""<Enter>:s/\%(\%#.*\)\@<=\V<C-r>=escape(expand('<cword>'), '/\')<Enter>//e<Bar>E<Left><Left><Left><Left>
nnoremap gm* m`:echom ""<Enter>:s/\%(\%#.*\)\@<=\V\C\<<C-r>=escape(expand('<cword>'), '/\')<Enter>\>//e<Bar>E<Left><Left><Left><Left>
nnoremap m# m`v"zy:echom ""<Enter>:s/\%(\%#.*\)\@<=\V<C-r>=escape(@z, '/\')<Enter>//e<Bar>E<Left><Left><Left><Left>
nnoremap gm# m`v"zy:echom ""<Enter>:s/\%(\%#.*\)\@<=\V\C<C-r>=escape(@z, '/\')<Enter>//e<Bar>E<Left><Left><Left><Left>

vnoremap m/ m`:<BS><BS><BS><BS><BS>echom ""<Enter>:'<,'>s/\%(\%#.*\)\@<=\V/e<Bar>E<Left><Left><Left><Left>
vnoremap gm/ m`:<BS><BS><BS><BS><BS>echom ""<Enter>:'<,'>s/\%(\%#.*\)\@<=\V\C/e<Bar>E<Left><Left><Left><Left>
vnoremap m? m`:<BS><BS><BS><BS><BS>echom ""<Enter>:'<,'>s/\%(\%#.*\)\@<=\v\C/e<Bar>E<Left><Left><Left><Left>
vnoremap m* m`:<BS><BS><BS><BS><BS>echom ""<Enter>:'<,'>s/\%(\%#.*\)\@<=\V<C-r>=escape(expand('<cword>'), '/\')<Enter>//e<Bar>E<Left><Left><Left><Left>
vnoremap gm* m`:<BS><BS><BS><BS><BS>echom ""<Enter>:'<,'>s/\%(\%#.*\)\@<=\V\C\<<C-r>=escape(expand('<cword>'), '/\')<Enter>\>//e<Bar>E<Left><Left><Left><Left>
vnoremap m# m`"zy:echom ""<Enter>:s/\%(\%#.*\)\@<=\V<C-r>=escape(@z, '/\')<Enter>//e<Bar>E<Left><Left><Left><Left>
vnoremap gm# m`"zy:echom ""<Enter>:s/\%(\%#.*\)\@<=\V\C<C-r>=escape(@z, '/\')<Enter>//e<Bar>E<Left><Left><Left><Left>

" Finally, define Ctrl-n, which can be used to repeat a subsitution. If given
" a g prefix, the substitution will be executed across the entire file or
" line selection. Note that the contents of the search register are used in
" the global case, not the search from the last substitution, since we don't
" want to include the backreference from single substitution commands.
nnoremap <C-n> m`:echom ""<Enter>:&&<Bar>M<Enter>
nnoremap g<C-n> m`:echom ""<Enter>:%~&g<Bar>M<Enter>

vnoremap <C-n> m`:<BS><BS><BS><BS><BS>echom ""<Enter>:'<,'>&&<Bar>M<Enter>
vnoremap g<C-n> m`:<BS><BS><BS><BS><BS>echom ""<Enter>:'<,'>~&g<Bar>M<Enter>

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
