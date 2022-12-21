syntax keyword caraKeywords
  \ if
  \ then
  \ else
  \ case
  \ of
  \ type
  \ where

syntax match caraNumber "\v<\d+>"
syntax match caraNumber "\v<\d+\.\d+>"
" TODO scientific notation
" TODO 0x
" TODO 0o
" TODO 0b

syntax region caraString start=/"/ skip=/\\"/ end=/"/ oneline contains=caraInterpolatedWrapper
" TODO interpolation without {}
syntax region caraInterpolatedWrapper start="\v\$\{\s*" end="\v\s*\}" contained containedin=caraString contains=caraInterpolatedString
" TODO this will need more thought:
syntax match caraInterpolatedString "\v\w+" contained containedin=caraInterpolatedWrapper

highlight default link caraString String
highlight default link caraInterpolatedWrapper Delimiter
highlight default link caraNumber Number
highlight default link caraKeywords Keyword
" TODO TODOs
" TODO comments
" TODO shebang
" TODO markers(?)
" TODO booleans
" TODO operators
" TODO attributes(?)
" TODO structures(?)
" TODO types
" TODO imports
" TODO preprocessor(?)
