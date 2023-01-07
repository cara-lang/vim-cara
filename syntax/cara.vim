syntax keyword caraKeywords
  \ if
  \ then
  \ else
  \ case
  \ of
  \ where
  \ test
  \ with
  \ module
  \ private

syntax keyword caraTypes
  \ type
  \ alias
  \ opaque

syntax match caraNumber "\v<-?\d+(_\d+)*>"
syntax match caraNumber "\v<-?\d+(_\d+)*\.\d+(_\d+)*([eE]\d+)?>"
syntax match caraNumber "\v<-?0b[01]+>"
syntax match caraNumber "\v<-?0o[0-7]+>"
syntax match caraNumber "\v<-?0x[0-7a-fA-F]+>"

syntax match caraDelimiter ","
syntax match caraBraces "[()[\]{}]"

syntax region caraString start=/"/ skip=/\\"/ end=/"/ oneline contains=caraInterpolatedWrapper
" TODO interpolation without {}
syntax region caraInterpolatedWrapper start="\v\$\{\s*" end="\v\s*\}" contained containedin=caraString contains=caraInterpolatedString
" TODO this will need more thought:
syntax match caraInterpolatedString "\v\w+" contained containedin=caraInterpolatedWrapper

syntax keyword caraTodo contained TODO FIXME XXX NOTE EDU
syntax match caraCommentLine "//.*$" contains=caraTodo
syntax region caraCommentBlock start="/\*" end="\*/" contains=caraTodo extend

highlight default link caraString String
highlight default link caraInterpolatedWrapper Delimiter
highlight default link caraNumber Number
highlight default link caraKeywords Keyword
highlight default link caraTypes Type
highlight default link caraCommentLine Comment
highlight default link caraCommentBlock Comment
highlight default link caraTodo Todo
highlight default link caraDelimiter Delimiter
highlight default link caraBraces Delimiter

" TODO nested comment blocks?

" TODO shebang
" TODO markers(?)
" TODO booleans
" TODO operators
" TODO attributes(?)
" TODO structures(?)
" TODO imports
" TODO preprocessor(?)
