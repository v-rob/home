" Highlight a few more JavaScript keywords consistently.
syn keyword javaScriptNumber NaN Infinity
syn keyword javaScriptReserved var let const
syn keyword javaScriptOperator in of
syn keyword javaScriptStatement yield
syn keyword javaScriptReserved constructor get set

" Be more selective about which identifiers should be highlighted.
syn keyword javaScriptGlobal globalThis document
syn keyword javaScriptMember self top parent location
syn keyword javaScriptDeprecated status

" Highlight identifiers with a leading capital, excepting object properties.
syn match javaScriptType "\(\.\s*\)\@<!\<[[:upper:]]\w*\>\(\s*:\)\@!"

" Fix certain highlights that don't have the correct corresponding colors.
hi link javaScriptSpecialCharacter Special
hi link javaScriptNumber Number
hi link javaScrParenError Error
hi link javaScriptNull Constant

" Make all identifiers have the same color or none at all, depending.
hi link javaScriptMessage Identifier
hi link javaScriptGlobal Identifier

hi link javaScriptMember None
hi link javaScriptDeprecated None
