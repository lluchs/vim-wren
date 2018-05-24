if exists("b:current_syntax")
    finish
endif

syntax keyword wrenNull null
syntax keyword wrenBoolean true false
syntax match wrenNumber "\v<\d+(\.\d+)?>|\.\d+>"
syntax match wrenNumber "\v<0x[[:xdigit:]]+>"

syntax match wrenEscape "\v\\0|\\\"|\\\\|\\a|\\b|\\f|\\n|\\r|\\t|\\v|\\u[[:xdigit:]]{4}|\\x[[:xdigit:]]{2}"
syntax region wrenString contains=wrenEscape start=/\v"/ skip=/\v\\"/ end=/\v"/
syntax region wrenExpression start=+%(+ end=+)+ skip=+\\)+ contains=wrenString containedin=wrenString

syntax keyword wrenConditional else if
syntax keyword wrenRepeat break for while
syntax keyword wrenKeyword class in is new return super this var import
syntax keyword wrenNew new contained containedin=wrenMethod
syntax keyword wrenStatic static contained containedin=wrenMethod,wrenForeignMethod
syntax keyword wrenForeign foreign contained containedin=wrenForeignMethod

syntax match wrenMethod "\v^\s*(static\s+)?\w+\=?\ze\s*(\([^)]*\))?\s*\{"
syntax match wrenForeignMethod "\v^\s*foreign\s+(static\s+)?\w+"

syntax match wrenOperator "\V!\|~\|-\|==\?\|!=\|<=\?\|>=\?\|...\?\||\|&\|+\|-\|*\|/\|%"

syntax match wrenField "\v_\w+" display
syntax match wrenStaticField "\v__\w+" display
syntax match wrenToplevel "\v<[A-Z]\w*" display

syntax keyword wrenTodo contained TODO FIXME XXX
syntax match wrenComment contains=wrenTodo "\v//.*$"
syntax region wrenComment contains=wrenTodo,wrenComment start=#\v/\*# end=#\*/#

syntax keyword wrenMisplacedKeyword static foreign

highlight def link wrenNull Constant
highlight def link wrenBoolean Boolean
highlight def link wrenNumber Number
highlight def link wrenString String
highlight def link wrenEscape SpecialChar
highlight def link wrenConditional Conditional
highlight def link wrenRepeat Repeat
highlight def link wrenKeyword Keyword
highlight def link wrenNew Keyword
highlight def link wrenStatic Keyword
highlight def link wrenForeign Keyword
highlight def link wrenMethod Function
highlight def link wrenForeignMethod Function
highlight def link wrenOperator Operator
highlight def link wrenIdentifier Identifier
highlight def link wrenStaticField wrenIdentifier
highlight def link wrenField wrenIdentifier
highlight def link wrenToplevel wrenIdentifier
highlight def link wrenComment Comment
highlight def link wrenTodo Todo
highlight def link wrenMisplacedKeyword Error

let b:current_syntax = "wren"
