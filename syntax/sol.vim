syn match solComment "#.*$"
syn match trueStatement "^.*T$"
syn match shockStatement "^.*[1-2]/6 T$"
syn match falseStatement "^.*F$"

let b:current_syntax = "sol"

hi def link solComment Comment
hi def link trueStatement Identifier
hi def link shockStatement Underlined
hi def link falseStatement Ignore
