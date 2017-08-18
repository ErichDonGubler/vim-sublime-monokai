" File:       monokai.vim
" Maintainer: Erich Gubler (erichdongubler)
" URL:        https://github.com/erichdongubler/vim-sublime-monokai
" License:    MIT

" Initialisation
" --------------

if !has("gui_running") && &t_Co < 256
  finish
endif

if ! exists("g:monokai_gui_italic")
    let g:monokai_gui_italic = 1
endif

if ! exists("g:monokai_term_italic")
    let g:monokai_term_italic = 0
endif

let g:monokai_termcolors = 256 " does not support 16 color term right now.

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "monokai"

function! s:h(group, style)
  let s:ctermformat = "NONE"
  let s:guiformat = "NONE"
  if has_key(a:style, "format")
    let s:ctermformat = a:style.format
    let s:guiformat = a:style.format
  endif
  if g:monokai_term_italic == 0
    let s:ctermformat = substitute(s:ctermformat, ",italic", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic,", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic", "", "")
  endif
  if g:monokai_gui_italic == 0
    let s:guiformat = substitute(s:guiformat, ",italic", "", "")
    let s:guiformat = substitute(s:guiformat, "italic,", "", "")
    let s:guiformat = substitute(s:guiformat, "italic", "", "")
  endif
  if g:monokai_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")      ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")      ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")      ? a:style.sp.gui   : "NONE")
    \ "gui="     (!empty(s:guiformat) ? s:guiformat   : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (!empty(s:ctermformat) ? s:ctermformat   : "NONE")
endfunction

" Palettes
" --------

let s:bright_white = { "gui": "#FFFFFF", "cterm": "231" }
let s:white        = { "gui": "#E8E8E3", "cterm": "252" }
let s:black        = { "gui": "#272822", "cterm": "234" }
let s:lightblack   = { "gui": "#2D2E27", "cterm": "235" }
let s:lightblack2  = { "gui": "#383a3e", "cterm": "236" }
let s:darkblack    = { "gui": "#211F1C", "cterm": "233" }
let s:grey         = { "gui": "#8F908A", "cterm": "243" }
let s:lightgrey    = { "gui": "#575b61", "cterm": "237" }
let s:darkgrey     = { "gui": "#64645e", "cterm": "239" }
let s:warmgrey     = { "gui": "#75715E", "cterm": "59" }

let s:pink        = { "gui": "#F92772", "cterm": "197" }
let s:green       = { "gui": "#A6E22D", "cterm": "148" }
let s:aqua        = { "gui": "#66d9ef", "cterm": "81" }
let s:yellow      = { "gui": "#E6DB74", "cterm": "186" }
let s:orange      = { "gui": "#FD9720", "cterm": "208" }
let s:purple      = { "gui": "#ae81ff", "cterm": "141" }
let s:red         = { "gui": "#e73c50", "cterm": "196" }
let s:darkred     = { "gui": "#5f0000", "cterm": "52" }

let s:addfg       = { "gui": "#d7ffaf", "cterm": "193" }
let s:addbg       = { "gui": "#5f875f", "cterm": "65" }
let s:delbg       = { "gui": "#f75f5f", "cterm": "167" }
let s:changefg    = { "gui": "#d7d7ff", "cterm": "189" }
let s:changebg    = { "gui": "#5f5f87", "cterm": "60" }

" Highlighting
" ------------

" editor
call s:h("Normal",       { "fg": s:white,      "bg": s:black })
call s:h("ColorColumn",  { "bg": s:lightblack })
call s:h("CursorColumn", { "bg": s:lightblack2 })
call s:h("CursorLine",   { "bg": s:lightblack2 })
call s:h("NonText",      { "fg": s:lightgrey })
call s:h("StatusLine",   { "fg": s:warmgrey,   "bg": s:black,        "format": "reverse" })
call s:h("StatusLineNC", { "fg": s:darkgrey,   "bg": s:warmgrey,     "format": "reverse" })
call s:h("TabLine",      { "fg": s:white,      "bg": s:darkgrey })
call s:h("TabLineFill",  { "fg": s:grey,       "bg": s:darkgrey })
call s:h("TabLineSel",   { "fg": s:bright_white,      "bg": s:grey })
call s:h("Visual",       { "bg": s:lightgrey })
call s:h("Search",       { "fg": s:black,      "bg": s:yellow })
call s:h("MatchParen",   { "fg": s:black,      "bg": s:purple })
call s:h("Question",     { "fg": s:yellow })
call s:h("ModeMsg",      { "fg": s:yellow })
call s:h("MoreMsg",      { "fg": s:yellow })
call s:h("ErrorMsg",     { "fg": s:black,      "bg": s:red,          "format": "standout" })
call s:h("WarningMsg",   { "fg": s:red })
call s:h("VertSplit",    { "fg": s:darkgrey,   "bg": s:darkblack })
call s:h("LineNr",       { "fg": s:grey,       "bg": s:lightblack })
call s:h("CursorLineNr", { "fg": s:orange,     "bg": s:lightblack })
call s:h("SignColumn",   { "bg": s:lightblack })

" misc
call s:h("SpecialKey", { "fg": s:lightblack2 })
call s:h("Title",      { "fg": s:yellow })
call s:h("Directory",  { "fg": s:aqua })

" match NoHighLight /\s\+/
" call s:h("NoHighLight",   { "fg": s:lightblack, "bg": s:lightblack2 })

" diff
call s:h("diffFile",      { "fg": s:warmgrey })
call s:h("diffIndexLine", { "fg": s:warmgrey })
call s:h("diffRemoved",   { "fg": s:pink })
call s:h("diffSubname",   { "fg": s:warmgrey })
call s:h("DiffAdd",       { "fg": s:addfg,      "bg": s:addbg })
call s:h("DiffDelete",    { "fg": s:black,      "bg": s:delbg })
call s:h("DiffChange",    { "fg": s:changefg,   "bg": s:changebg })
call s:h("DiffText",      { "fg": s:black,      "bg": s:aqua })

" fold
call s:h("Folded",        { "fg": s:warmgrey,   "bg": s:darkblack })
call s:h("FoldColumn",    {                     "bg": s:darkblack })
"        Incsearch"

" popup menu
call s:h("Pmenu",         { "fg": s:lightblack, "bg": s:white })
call s:h("PmenuSel",      { "fg": s:aqua,       "bg": s:black,        "format": "reverse,bold" })
call s:h("PmenuThumb",    { "fg": s:lightblack, "bg": s:grey })
"        PmenuSbar"

call s:h("Conceal",      { "fg": s:lightgrey })

" Generic Syntax Highlighting
" ---------------------------

call s:h("Constant",      { "fg": s:purple })
call s:h("Number",        { "fg": s:purple })
call s:h("Float",         { "fg": s:purple })
call s:h("Boolean",       { "fg": s:purple })
call s:h("Character",     { "fg": s:yellow })
call s:h("String",        { "fg": s:yellow })

call s:h("Type",          { "fg": s:aqua })
call s:h("Structure",     { "fg": s:aqua })
call s:h("StorageClass",  { "fg": s:pink })
call s:h("Typedef",       { "fg": s:aqua })

call s:h("Identifier",    { "fg": s:green })
call s:h("Function",      { "fg": s:green })

call s:h("Statement",     { "fg": s:white })
call s:h("Operator",      { "fg": s:pink })
call s:h("Label",         { "fg": s:pink })
call s:h("Keyword",       { "fg": s:pink })
"        Conditional"
"        Repeat"
"        Exception"

call s:h("CommentURL",    { "fg": s:grey, "format": "italic" })

call s:h("PreProc",       { "fg": s:green })
call s:h("Include",       { "fg": s:white })
call s:h("Define",        { "fg": s:pink })
call s:h("Macro",         { "fg": s:green })
call s:h("PreCondit",     { "fg": s:white })

call s:h("Special",       { "fg": s:purple })
call s:h("SpecialChar",   { "fg": s:pink })
call s:h("Delimiter",     { "fg": s:pink })
call s:h("SpecialComment",{ "fg": s:aqua })
call s:h("Tag",           { "fg": s:pink })
"        Debug"

call s:h("Todo",          { "fg": s:orange,   "format": "bold,italic" })
call s:h("Comment",       { "fg": s:warmgrey, "format": "italic" })

call s:h("Underlined",    { "fg": s:green })
call s:h("Ignore",        {})
call s:h("Error",         { "fg": s:red, "bg": s:darkred })

" NerdTree
" --------

call s:h("NERDTreeOpenable",        { "fg": s:yellow })
call s:h("NERDTreeClosable",        { "fg": s:yellow })
call s:h("NERDTreeHelp",            { "fg": s:yellow })
call s:h("NERDTreeBookmarksHeader", { "fg": s:pink })
call s:h("NERDTreeBookmarksLeader", { "fg": s:black })
call s:h("NERDTreeBookmarkName",    { "fg": s:yellow })
call s:h("NERDTreeCWD",             { "fg": s:pink })
call s:h("NERDTreeUp",              { "fg": s:white })
call s:h("NERDTreeDirSlash",        { "fg": s:grey })
call s:h("NERDTreeDir",             { "fg": s:grey })

" Syntastic
" ---------

hi! link SyntasticErrorSign Error
call s:h("SyntasticWarningSign",    { "fg": s:lightblack, "bg": s:orange })

" Language highlight
" ------------------

" Java properties
call s:h("javaCommentTitle", { "fg": s:grey })
call s:h("javaConditional", { "fg": s:pink })
call s:h("javaDocParam", { "fg": s:grey })
call s:h("javaDocTags", { "fg": s:pink })
call s:h("javaExceptions", { "fg": s:pink })
call s:h("javaRepeat", { "fg": s:pink })
call s:h("javaSpecialChar", { "fg": s:purple })
call s:h("javaStatement", { "fg": s:pink })
call s:h("jpropertiesIdentifier",   { "fg": s:pink })

" Vim command
call s:h("vimCommand",              { "fg": s:pink })
call s:h("vimEnvvar",               { "fg": s:aqua })
call s:h("vimFBVar",                { "fg": s:white })
call s:h("vimIsCommand",            { "fg": s:aqua })
call s:h("vimUserFunc",             { "fg": s:aqua })
call s:h("vimFunction",             { "fg": s:green })
call s:h("vimFuncName",             { "fg": s:aqua })
call s:h("vimFuncNameTag",          { "fg": s:aqua })
call s:h("vimFuncVar",              { "fg": s:orange, "format": "italic" })
call s:h("vimMapModKey",            { "fg": s:aqua })
call s:h("vimMapRhs",               { "fg": s:yellow })
call s:h("vimNotation",             { "fg": s:aqua })
" call s:h("vimOperParen",            { "fg": s:orange, "format": "italic" })
call s:h("vimOption",               { "fg": s:aqua })
call s:h("vimParenSep",             { "fg": s:white })
call s:h("vimScriptFuncTag",        { "fg": s:pink })
call s:h("vimSet",                  { "fg": s:pink })
call s:h("vimSetEqual",             { "fg": s:pink })
call s:h("vimVar",                  { "fg": s:white })

" Javascript
call s:h("jsArgsObj",           { "fg": s:aqua })
call s:h("jsArrowFunction",     { "fg": s:pink })
call s:h("jsBlockLabelKey",     { "fg": s:aqua })
call s:h("jsBuiltins",          { "fg": s:aqua })
call s:h("jsCatch",             { "fg": s:pink })
call s:h("jsConditional",       { "fg": s:pink })
call s:h("jsDocTags",           { "fg": s:aqua,   "format": "italic" })
call s:h("jsException",         { "fg": s:pink })
call s:h("jsExceptions",        { "fg": s:aqua,   "format": "italic" })
call s:h("jsExport",            { "fg": s:pink })
call s:h("jsFinally",           { "fg": s:pink })
call s:h("jsFrom",              { "fg": s:pink })
call s:h("jsFuncArgRest",       { "fg": s:purple, "format": "italic" })
call s:h("jsFuncArgs",          { "fg": s:orange, "format": "italic" })
call s:h("jsFuncCall",          { "fg": s:aqua })
call s:h("jsFuncName",          { "fg": s:green })
call s:h("jsFunctionKey",       { "fg": s:green })
call s:h("jsFutureKeys",        { "fg": s:pink }) " FIXME: FutureKeys includes a bit too much. It had some type names, which should be aqua, but most of the keywords that might actually get used would be pink (keywords like public, abstract).
call s:h("jsGlobalObjects",     { "fg": s:aqua,   "format": "italic" })
call s:h("jsImport",            { "fg": s:pink })
call s:h("jsModuleAs",          { "fg": s:pink })
call s:h("jsModuleAsterisk",    { "fg": s:pink })
call s:h("jsNan",               { "fg": s:purple })
call s:h("jsNull",              { "fg": s:purple })
call s:h("jsObjectFuncName",    { "fg": s:green })
call s:h("jsPrototype",         { "fg": s:aqua })
call s:h("jsRegexpCharClass",   { "fg": s:purple })
call s:h("jsRegexpBackRef",     { "fg": s:pink })
call s:h("jsRegexpMod",         { "fg": s:pink }) " Technically this is extra from Sublime, but it looks nice.
call s:h("jsRegexpOr",          { "fg": s:pink })
call s:h("jsRepeat",            { "fg": s:pink })
call s:h("jsReturn",            { "fg": s:pink })
call s:h("jsStatement",         { "fg": s:pink })
call s:h("jsStatic",            { "fg": s:aqua })
call s:h("jsStorageClass",      { "fg": s:aqua })
call s:h("jsSuper",             { "fg": s:orange, "format": "italic" })
call s:h("jsThis",              { "fg": s:orange, "format": "italic" })
call s:h("jsTry",               { "fg": s:pink })
call s:h("jsUndefined",         { "fg": s:purple })

" Html
call s:h("htmlTag",             { "fg": s:white })
call s:h("htmlEndTag",          { "fg": s:white })
call s:h("htmlTagName",         { "fg": s:pink })
call s:h("htmlArg",             { "fg": s:green })
call s:h("htmlSpecialChar",     { "fg": s:purple })
call s:h("htmlSpecialTagName",  { "fg": s:pink })

" Xml
call s:h("xmlTag",              { "fg": s:pink })
call s:h("xmlEndTag",           { "fg": s:pink })
call s:h("xmlTagName",          { "fg": s:orange })
call s:h("xmlAttrib",           { "fg": s:green })

" CSS
call s:h("cssAttributeSelector",{ "fg": s:white })
call s:h("cssBorderAttr",       { "fg": s:aqua })
call s:h("cssBraces",           { "fg": s:white })
call s:h("cssClassName",        { "fg": s:green })
call s:h("cssClassNameDot",     { "fg": s:pink })
call s:h("cssColor",            { "fg": s:purple })
call s:h("cssCommonAttr",       { "fg": s:pink })
call s:h("cssFunctionName",     { "fg": s:aqua })
call s:h("cssProp",             { "fg": s:aqua, "format": "italic" })
call s:h("cssPseudoClassId",    { "fg": s:pink })
call s:h("cssSelectorOp2",      { "fg": s:pink })
call s:h("cssTagName",          { "fg": s:pink })
call s:h("cssUnitDecorators",   { "fg": s:pink })
call s:h("cssUIAttr",           { "fg": s:aqua })
call s:h("cssURL",              { "fg": s:orange, "format": "underline,italic" })
call s:h("cssValueLength",      { "fg": s:purple })

" LESS
call s:h("lessVariable",        { "fg": s:green })

" SASS
call s:h("sassAmpersand",    { "fg": s:pink })
call s:h("sassClass",        { "fg": s:green })
call s:h("sassCssAttribute", { "fg": s:aqua })
call s:h("sassInclude",      { "fg": s:pink })
call s:h("sassMixinName",    { "fg": s:aqua }) " FIXME: Definitions aren't green!
call s:h("sassMixing",       { "fg": s:pink })
call s:h("sassProperty",     { "fg": s:aqua })
call s:h("sassSelectorOp",   { "fg": s:pink })
call s:h("sassVariable",     { "fg": s:white })


" ruby
call s:h("rubyInterpolationDelimiter",  {})
call s:h("rubyInstanceVariable",        {})
call s:h("rubyGlobalVariable",          {})
call s:h("rubyClassVariable",           {})
call s:h("rubyPseudoVariable",          {})
call s:h("rubyFunction",                { "fg": s:green })
call s:h("rubyStringDelimiter",         { "fg": s:yellow })
call s:h("rubyRegexp",                  { "fg": s:yellow })
call s:h("rubyRegexpDelimiter",         { "fg": s:yellow })
call s:h("rubySymbol",                  { "fg": s:purple })
call s:h("rubyEscape",                  { "fg": s:purple })
call s:h("rubyInclude",                 { "fg": s:pink })
call s:h("rubyOperator",                { "fg": s:pink })
call s:h("rubyControl",                 { "fg": s:pink })
call s:h("rubyClass",                   { "fg": s:pink })
call s:h("rubyDefine",                  { "fg": s:pink })
call s:h("rubyException",               { "fg": s:pink })
call s:h("rubyRailsARAssociationMethod",{ "fg": s:orange })
call s:h("rubyRailsARMethod",           { "fg": s:orange })
call s:h("rubyRailsRenderMethod",       { "fg": s:orange })
call s:h("rubyRailsMethod",             { "fg": s:orange })
call s:h("rubyConstant",                { "fg": s:aqua })
call s:h("rubyBlockArgument",           { "fg": s:orange })
call s:h("rubyBlockParameter",          { "fg": s:orange })

" eruby
call s:h("erubyDelimiter",              {})
call s:h("erubyRailsMethod",            { "fg": s:aqua })

" c
call s:h("cLabel",                      { "fg": s:pink })
call s:h("cStructure",                  { "fg": s:pink })
call s:h("cStorageClass",               { "fg": s:pink })
call s:h("cInclude",                    { "fg": s:pink })
call s:h("cDefine",                     { "fg": s:green })

" C++
call s:h("cppSTLfunction", { "fg": s:aqua })
call s:h("cppSTLios",      { "fg": s:aqua })

" D
call s:h("dExternal", { "fg": s:pink })

" Rust
call s:h("rustCommentLineDoc", { "fg": s:grey })
call s:h("rustConditional",    { "fg": s:pink })
call s:h("rustFuncCall",       { "fg": s:aqua })
call s:h("rustIdentifier",     { "fg": s:white })
call s:h("rustMacro",          { "fg": s:aqua })
call s:h("rustModPathSep",     { "fg": s:white })
call s:h("rustQuestionMark",   { "fg": s:pink })
call s:h("rustRepeat",         { "fg": s:pink })

" Makefile
call s:h("makeCommands",    { "fg": s:white })
call s:h("makeCmdNextLine", { "fg": s:white })

" Bash
call s:h("shConditional",               { "fg": s:pink })
call s:h("shDerefOff",                  { "fg": s:white })
call s:h("shDerefSimple",               { "fg": s:aqua })
call s:h("shDerefVar",                  { "fg": s:aqua })
call s:h("shFunctionKey",               { "fg": s:pink })
call s:h("shLoop",                      { "fg": s:pink })

" Python
call s:h("pythonConditional",           { "fg": s:pink })
call s:h("pythonStatement", { "fg": s:aqua })
call s:h("pythonInclude", { "fg": s:pink })
call s:h("pythonException", { "fg": s:pink })
call s:h("pythonParam", { "fg": s:orange })
call s:h("pythonBuiltInObj", { "fg": s:purple })
