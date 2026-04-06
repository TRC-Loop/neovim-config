if exists("b:current_syntax")
  finish
endif

syn keyword cclKeyword
  \ var const function return if else for in while
  \ import from as break continue class extends self super
  \ try catch throw with and or not range fixed
  \ public private

syn keyword cclType
  \ string int sint float bool list array dict

syn keyword cclBool true false

syn match   cclNumber   "\<\d\+\(\.\d\+\)\?\>"
syn region  cclString   start='"' skip='\\"' end='"'
syn region  cclFString  start='f"' skip='\\"' end='"'
syn match   cclComment  "//.*$"
syn region  cclComment  start="/\*" end="\*/"

syn match   cclOperator "[+\-*/%=<>!]"
syn match   cclOperator "==\|!=\|<=\|>="

hi def link cclKeyword  Keyword
hi def link cclType     Type
hi def link cclBool     Boolean
hi def link cclNumber   Number
hi def link cclString   String
hi def link cclFString  String
hi def link cclComment  Comment
hi def link cclOperator Operator

let b:current_syntax = "ccl"
