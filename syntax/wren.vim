if exists("b:current_syntax")
    finish
endif

syntax keyword wrenNull null
syntax keyword wrenBoolean true false
syntax match wrenNumber "\v<\d+(\.\d+)?>|\.\d+>"

syntax match wrenEscape "\v\\\"|\\\\|\\a|\\b|\\f|\\n|\\r|\\t|\\v|\\u[[:xdigit:]]{4}"
syntax region wrenString contains=wrenEscape start=/\v"/ skip=/\v\\"/ end=/\v"/

syntax keyword wrenConditional else if
syntax keyword wrenRepeat break for while
syntax keyword wrenKeyword class in is new return super this var
syntax keyword wrenStatic static contained containedin=wrenMethod

syntax match wrenMethod "\v^\s*\zs(static\s+)?\w+\ze\s*(\([^)]*\))?\s*\{"

syntax match wrenOperator "\V!\|~\|-\|==\?\|!=\|<=\?\|>=\?\|...\?\||\|&\|+\|-\|*\|/\|%"

syntax keyword wrenTodo contained TODO FIXME XXX
syntax match wrenComment contains=wrenTodo "\v//.*$"
syntax region wrenComment contains=wrenTodo,wrenComment start=#\v/\*# end=#\*/#

highlight def link wrenNull Constant
highlight def link wrenBoolean Boolean
highlight def link wrenNumber Number
highlight def link wrenString String
highlight def link wrenEscape SpecialChar
highlight def link wrenConditional Conditional
highlight def link wrenRepeat Repeat
highlight def link wrenKeyword Keyword
highlight def link wrenStatic Keyword
highlight def link wrenMethod Function
highlight def link wrenOperator Operator
highlight def link wrenComment Comment
highlight def link wrenTodo Todo

let b:current_syntax = "wren"
