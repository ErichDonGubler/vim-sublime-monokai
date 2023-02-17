" File:       monokai.vim
" Maintainer: Erich Gubler (erichdongubler)
" URL:        https://github.com/erichdongubler/vim-sublime-monokai
" License:    MIT

" Initialisation

if !has('gui_running') && &t_Co < 256
  " Shim this out so code doesn't hard break -- users should notice if this
  " doesn't work.
  fun! g:SublimeMonokaiHighlight(group, style)
  endf
  finish
endif

if !exists('g:sublimemonokai_gui_italic')
  let g:sublimemonokai_gui_italic = 1
endif

if !exists('g:sublimemonokai_term_italic')
  let g:sublimemonokai_term_italic = 0
endif

let g:sublimemonokai_termcolors = 256 " does not support 16 color term right now.

set background=dark
hi clear

if exists('syntax_on')
  syntax reset
endif

let colors_name = 'sublimemonokai'

fun! s:h(group, style)
  let s:ctermformat = 'NONE'
  let s:guiformat = 'NONE'
  if has_key(a:style, 'format')
	let s:ctermformat = a:style.format
	let s:guiformat = a:style.format
  endif
  if g:sublimemonokai_term_italic == 0
	let s:ctermformat = substitute(s:ctermformat, ',italic', '', '')
	let s:ctermformat = substitute(s:ctermformat, 'italic,', '', '')
	let s:ctermformat = substitute(s:ctermformat, 'italic', '', '')
  endif
  if g:sublimemonokai_gui_italic == 0
	let s:guiformat = substitute(s:guiformat, ',italic', '', '')
	let s:guiformat = substitute(s:guiformat, 'italic,', '', '')
	let s:guiformat = substitute(s:guiformat, 'italic', '', '')
  endif
  if g:sublimemonokai_termcolors == 16
	let l:ctermfg = (has_key(a:style, 'fg') ? a:style.fg.cterm16 : 'NONE')
	let l:ctermbg = (has_key(a:style, 'bg') ? a:style.bg.cterm16 : 'NONE')
  else
	let l:ctermfg = (has_key(a:style, 'fg') ? a:style.fg.cterm : 'NONE')
	let l:ctermbg = (has_key(a:style, 'bg') ? a:style.bg.cterm : 'NONE')
  end
  execute 'highlight' a:group
		\ 'guifg='   (has_key(a:style, 'fg')      ? a:style.fg.gui   : 'NONE')
		\ 'guibg='   (has_key(a:style, 'bg')      ? a:style.bg.gui   : 'NONE')
		\ 'guisp='   (has_key(a:style, 'sp')      ? a:style.sp.gui   : 'NONE')
		\ 'gui='     (!empty(s:guiformat) ? s:guiformat   : 'NONE')
		\ 'ctermfg=' . l:ctermfg
		\ 'ctermbg=' . l:ctermbg
		\ 'cterm='   (!empty(s:ctermformat) ? s:ctermformat   : 'NONE')
endfunction

" Expose the more complicated style setting via a global function
fun! g:SublimeMonokaiHighlight(group, style)
  return s:h(a:group, a:style)
endfun

" Palette

" Convenience function to have a convenient script variable name and an
" namespaced global variable
fun! s:create_palette_color(color_name, color_data)
  exec 'let s:' . a:color_name . ' = a:color_data'
  exec 'let g:sublimemonokai_' . a:color_name . ' = a:color_data'
endf

call s:create_palette_color('brightwhite', { 'gui': '#FFFFFF', 'cterm': '231' })
call s:create_palette_color('white',       { 'gui': '#E8E8E3', 'cterm': '252' })
call s:create_palette_color('black',       { 'gui': '#272822', 'cterm': '234' })
call s:create_palette_color('lightblack',  { 'gui': '#2D2E27', 'cterm': '235' })
call s:create_palette_color('lightblack2', { 'gui': '#383a3e', 'cterm': '236' })
call s:create_palette_color('darkblack',   { 'gui': '#211F1C', 'cterm': '233' })
call s:create_palette_color('grey',        { 'gui': '#8F908A', 'cterm': '243' })
call s:create_palette_color('lightgrey',   { 'gui': '#575b61', 'cterm': '237' })
call s:create_palette_color('darkgrey',    { 'gui': '#64645e', 'cterm': '239' })
call s:create_palette_color('warmgrey',    { 'gui': '#75715E', 'cterm': '59'  })

call s:create_palette_color('pink',        { 'gui': '#f92772', 'cterm': '197' })
call s:create_palette_color('green',       { 'gui': '#a6e22d', 'cterm': '148' })
call s:create_palette_color('aqua',        { 'gui': '#66d9ef', 'cterm': '81'  })
call s:create_palette_color('yellow',      { 'gui': '#e6db74', 'cterm': '186' })
call s:create_palette_color('darkyellow',  { 'gui': '#878700', 'cterm': '100' })
call s:create_palette_color('orange',      { 'gui': '#fd9720', 'cterm': '208' })
call s:create_palette_color('purple',      { 'gui': '#ae81ff', 'cterm': '141' })
call s:create_palette_color('red',         { 'gui': '#e73c50', 'cterm': '196' })
call s:create_palette_color('darkred',     { 'gui': '#5f0000', 'cterm': '52'  })

call s:create_palette_color('addfg',       { 'gui': '#d7ffaf', 'cterm': '193' })
call s:create_palette_color('addbg',       { 'gui': '#5f875f', 'cterm': '65'  })
call s:create_palette_color('delbg',       { 'gui': '#f75f5f', 'cterm': '167' })
call s:create_palette_color('changefg',    { 'gui': '#d7d7ff', 'cterm': '189' })
call s:create_palette_color('changebg',    { 'gui': '#5f5f87', 'cterm': '60'  })

" Expose the foreground colors of the Sublime palette as a bunch of
" highlighting groups. This lets us (and users!) get tab completion for the `hi
" link` command, and use more semantic names for the colors we want to assign
" to groups

call s:h('SublimeBrightWhite', { 'fg': s:brightwhite  })
call s:h('SublimeWhite',       { 'fg': s:white        })
call s:h('SublimeBlack',       { 'fg': s:black        })
call s:h('SublimeLightBlack',  { 'fg': s:lightblack   })
call s:h('SublimeLightBlack2', { 'fg': s:lightblack2  })
call s:h('SublimeDarkBlack',   { 'fg': s:darkblack    })
call s:h('SublimeGrey',        { 'fg': s:grey         })
call s:h('SublimeLightGrey',   { 'fg': s:lightgrey    })
call s:h('SublimeDarkGrey',    { 'fg': s:darkgrey     })
call s:h('SublimeWarmGrey',    { 'fg': s:warmgrey     })

call s:h('SublimePink',        { 'fg': s:pink         })
call s:h('SublimeGreen',       { 'fg': s:green        })
call s:h('SublimeAqua',        { 'fg': s:aqua         })
call s:h('SublimeYellow',      { 'fg': s:yellow       })
call s:h('SublimeOrange',      { 'fg': s:orange       })
call s:h('SublimePurple',      { 'fg': s:purple       })
call s:h('SublimeRed',         { 'fg': s:red          })
call s:h('SublimeDarkRed',     { 'fg': s:darkred      })

" Default highlight groups (see ':help highlight-default' or http://vimdoc.sourceforge.net/htmldoc/syntax.html#highlight-groups)

call s:h('ColorColumn',  {                      'bg': s:lightblack2                            })
hi! link Conceal SublimeLightGrey
call s:h('CursorColumn', {                      'bg': s:lightblack2                            })
call s:h('CursorLine',   {                      'bg': s:lightblack2                            })
call s:h('CursorLineNr', { 'fg': s:orange,      'bg': s:lightblack                             })
call s:h('DiffAdd',      { 'fg': s:addfg,       'bg': s:addbg                                  })
call s:h('DiffChange',   { 'fg': s:changefg,    'bg': s:changebg                               })
call s:h('DiffDelete',   { 'fg': s:black,       'bg': s:delbg                                  })
call s:h('DiffText',     { 'fg': s:black,       'bg': s:aqua                                   })
hi! link Directory SublimeAqua
call s:h('ErrorMsg',     { 'fg': s:black,       'bg': s:red,      'format': 'standout'         })
hi! link FoldColumn SublimeDarkBlack
call s:h('Folded',       { 'fg': s:warmgrey,    'bg': s:darkblack                              })
call s:h('IncSearch',    {                                        'format': 'reverse,underline'})
call s:h('LineNr',       { 'fg': s:grey,        'bg': s:lightblack                             })
call s:h('MatchParen',   {                                        'format': 'underline'        })
hi! link ModeMsg SublimeYellow
hi! link MoreMsg SublimeYellow
hi! link NonText SublimeLightGrey
call s:h('Normal',       { 'fg': s:white,       'bg': s:black                                  })
if has('nvim')
  call s:h('NormalFloat',{ 'fg': s:white,       'bg': s:warmgrey                               })
end
call s:h('Pmenu',        { 'fg': s:lightblack,  'bg': s:white                                  })
call s:h('PmenuSbar',    {                                                                     })
call s:h('PmenuSel',     { 'fg': s:aqua,        'bg': s:black,    'format': 'reverse,bold'     })
call s:h('PmenuThumb',   { 'fg': s:lightblack,  'bg': s:grey                                   })
hi! link Question SublimeYellow
call s:h('Search',       {                                        'format': 'reverse,underline'})
hi! link SignColumn LineNr
call s:h('SpecialKey',   { 'fg': s:purple,      'bg': s:darkblack                              })
call s:h('SpellBad',     {                      'bg': s:darkred                                })
call s:h('SpellCap',     {                      'bg': s:darkyellow                             })
call s:h('SpellLocal',   {                      'bg': s:darkyellow                             })
call s:h('SpellRare',    {                      'bg': s:darkyellow                             })
call s:h('StatusLine',   { 'fg': s:warmgrey,    'bg': s:black,    'format': 'reverse'          })
call s:h('StatusLineNC', { 'fg': s:darkgrey,    'bg': s:warmgrey, 'format': 'reverse'          })
call s:h('TabLine',      { 'fg': s:white,       'bg': s:darkgrey                               })
call s:h('TabLineFill',  { 'fg': s:grey,        'bg': s:darkgrey                               })
call s:h('TabLineSel',   { 'fg': s:black,       'bg': s:white                                  })
hi! link Title SublimeYellow
call s:h('VertSplit',    { 'fg': s:darkgrey,    'bg': s:darkblack                              })
call s:h('Visual',       {                      'bg': s:lightgrey                              })
hi! link WarningMsg SublimeRed

" Generic Syntax Highlighting (see reference: 'NAMING CONVENTIONS' at http://vimdoc.sourceforge.net/htmldoc/syntax.html#group-name)

hi! link Comment      SublimeWarmGrey
hi! link Constant     SublimePurple
hi! link String       SublimeYellow
hi! link Character    SublimeYellow
hi! link Number       SublimePurple
hi! link Boolean      SublimePurple
hi! link Float        SublimePurple
hi! link Identifier   SublimeWhite
hi! link Function     SublimeWhite
hi! link Type         SublimeAqua
hi! link StorageClass SublimePink
hi! link Structure    SublimePink
hi! link Typedef      SublimeAqua
hi! link Statement    SublimeWhite
hi! link Conditional  SublimePink
hi! link Repeat       SublimePink
hi! link Label        SublimePink
hi! link Operator     SublimePink
hi! link Keyword      SublimePink
hi! link Exception    SublimePink
call s:h('CommentURL',    { 'fg': s:grey, 'format': 'italic' })

hi! link PreProc        SublimeGreen
hi! link Include        SublimeWhite
hi! link Define         SublimePink
hi! link Macro          SublimeGreen
hi! link PreCondit      SublimeWhite
hi! link Special        SublimePurple
hi! link SpecialChar    SublimePink
hi! link Tag            SublimeGreen
hi! link Delimiter      SublimePink
hi! link SpecialComment SublimeAqua
" call s:h('Debug'          {})
call s:h('Underlined',    { 'format': 'underline' })
" call s:h('Ignore',        {})
call s:h('Error',         { 'fg': s:red, 'bg': s:darkred })
hi! link Todo           Comment

" Some highlighting groups custom to the Sublime Monokai theme

call s:h('SublimeType',   { 'fg': s:aqua, 'format': 'italic' })
call s:h('SublimeContextParam',  { 'fg': s:orange, 'format': 'italic' })
hi! link SublimeDocumentation SublimeGrey
hi! link SublimeFunctionCall SublimeAqua
hi! link SublimeUserAttribute SublimeGrey

" Neovim LSP support

if has('nvim')
  call s:h('LspReferenceText',  { 'bg': s:darkgrey })
  call s:h('LspReferenceRead',  { 'bg': s:addbg })
  call s:h('LspReferenceWrite', { 'bg': s:changebg })

	" TODO: WIP. I haven't tried to get parity with NERDTree yet.
	hi! link NvimTreeFolderIcon Comment
	hi! link NvimTreeGitDeleted SublimeRed
	hi! link NvimTreeGitDirty   SublimeYellow
	hi! link NvimTreeGitMerge   SublimePink
	hi! link NvimTreeGitRenamed SublimeOrange
	hi! link NvimTreeGitStaged  SublimeGreen
endif

" Bash/POSIX shell

hi! link shConditional Conditional
hi! link shDerefOff    Normal
hi! link shDerefSimple SublimeAqua
hi! link shDerefVar    SublimeAqua
hi! link shFunctionKey SublimePink
hi! link shLoop        Keyword
hi! link shQuote       String
hi! link shSet         Keyword
hi! link shStatement   SublimePink
" XXX: Other known deficiencies:
"
" * Can't highlight POSIX builtins right because shStatement is later in the
"     highlight stack
" * Can't override shOption to be "normal" because it could be within a string
"     or substitution. It looks okay anyway. :)
" * shCommandSub can't be override for a similar reason to shOption
" * Boolean operators and subsequent commands don't have the right
"     highlighting

" Batch

hi! link dosbatchImplicit    Keyword
hi! link dosbatchLabel       Normal
" FIXME: This should have its own group, like SublimeEscapedSequence
hi! link dosbatchSpecialChar SublimePurple
hi! link dosbatchSwitch      Normal
" FIXME: Variables don't have their own highlighting in Sublime
" hi! link dosbatchVariable    SublimeAqua
" XXX: string highlight is used for echo commands, but Sublime doesn't
" highlight at all
" XXX: Sublime sets everything to the right of an assignment to be a string
" color, but Vim doesn't

" XXX: Create an extra flag for "nice" stuff
" hi! link dosbatchLabel       Tag
" hi! link dosbatchStatement   Keyword
" hi! link dosbatchSwitch      SublimePurple
" hi! link dosbatchVariable    SublimeAqua

" C

hi! link cAnsiFunction     SublimeFunctionCall
hi! link cDefine           SublimeGreen
hi! link cFormat           Special
hi! link cInclude          SublimePink
hi! link cLabel            SublimePink
hi! link cSpecial          Special
hi! link cSpecialCharacter Special
hi! link cStatement        Keyword
hi! link cStorageClass     SublimePink
hi! link cStructure        SublimeType
hi! link cType             SublimeType
" XXX: Other known deficiencies:
"
" * There's no way to distinguish between function calls and
"     definitions/declarations. :( If you prefer both to be colored, then you
"     can use `hi! link cCustom <color>`.

" CMake

hi! link cmakeCommand                            SublimeAqua
hi! link cmakeKWfind_package                     SublimeContextParam
hi! link cmakeKWproject                          SublimeContextParam
" XXX: Variation: I actually really like making this aqua.
hi! link cmakeVariableValue                      Normal

" pboettch/vim-cmake-syntax plugin
hi! link cmakeBracketArgument                           SublimeAqua
hi! link cmakeKWExternalProject                         SublimeContextParam
hi! link cmakeKWExternalProject                         SublimeContextParam
hi! link cmakeKWadd_compile_definitions                 SublimeContextParam
hi! link cmakeKWadd_compile_definitions                 SublimeContextParam
hi! link cmakeKWadd_compile_options                     SublimeContextParam
hi! link cmakeKWadd_compile_options                     SublimeContextParam
hi! link cmakeKWadd_custom_command                      SublimeContextParam
hi! link cmakeKWadd_custom_command                      SublimeContextParam
hi! link cmakeKWadd_custom_target                       SublimeContextParam
hi! link cmakeKWadd_custom_target                       SublimeContextParam
hi! link cmakeKWadd_definitions                         SublimeContextParam
hi! link cmakeKWadd_definitions                         SublimeContextParam
hi! link cmakeKWadd_dependencies                        SublimeContextParam
hi! link cmakeKWadd_dependencies                        SublimeContextParam
hi! link cmakeKWadd_executable                          SublimeContextParam
hi! link cmakeKWadd_executable                          SublimeContextParam
hi! link cmakeKWadd_library                             SublimeContextParam
hi! link cmakeKWadd_library                             SublimeContextParam
hi! link cmakeKWadd_link_options                        SublimeContextParam
hi! link cmakeKWadd_link_options                        SublimeContextParam
hi! link cmakeKWadd_subdirectory                        SublimeContextParam
hi! link cmakeKWadd_subdirectory                        SublimeContextParam
hi! link cmakeKWadd_test                                SublimeContextParam
hi! link cmakeKWadd_test                                SublimeContextParam
hi! link cmakeKWbuild_command                           SublimeContextParam
hi! link cmakeKWbuild_command                           SublimeContextParam
hi! link cmakeKWcmake_host_system_information           SublimeContextParam
hi! link cmakeKWcmake_host_system_information           SublimeContextParam
hi! link cmakeKWcmake_minimum_required                  SublimeContextParam
hi! link cmakeKWcmake_minimum_required                  SublimeContextParam
hi! link cmakeKWcmake_parse_arguments                   SublimeContextParam
hi! link cmakeKWcmake_parse_arguments                   SublimeContextParam
hi! link cmakeKWcmake_policy                            SublimeContextParam
hi! link cmakeKWcmake_policy                            SublimeContextParam
hi! link cmakeKWconfigure_file                          SublimeContextParam
hi! link cmakeKWconfigure_file                          SublimeContextParam
hi! link cmakeKWconfigure_package_config_file           SublimeContextParam
hi! link cmakeKWconfigure_package_config_file           SublimeContextParam
hi! link cmakeKWconfigure_package_config_file_constants SublimeContextParam
hi! link cmakeKWconfigure_package_config_file_constants SublimeContextParam
hi! link cmakeKWcreate_test_sourcelist                  SublimeContextParam
hi! link cmakeKWcreate_test_sourcelist                  SublimeContextParam
hi! link cmakeKWctest_build                             SublimeContextParam
hi! link cmakeKWctest_build                             SublimeContextParam
hi! link cmakeKWctest_configure                         SublimeContextParam
hi! link cmakeKWctest_configure                         SublimeContextParam
hi! link cmakeKWctest_coverage                          SublimeContextParam
hi! link cmakeKWctest_coverage                          SublimeContextParam
hi! link cmakeKWctest_memcheck                          SublimeContextParam
hi! link cmakeKWctest_memcheck                          SublimeContextParam
hi! link cmakeKWctest_run_script                        SublimeContextParam
hi! link cmakeKWctest_run_script                        SublimeContextParam
hi! link cmakeKWctest_start                             SublimeContextParam
hi! link cmakeKWctest_start                             SublimeContextParam
hi! link cmakeKWctest_submit                            SublimeContextParam
hi! link cmakeKWctest_submit                            SublimeContextParam
hi! link cmakeKWctest_test                              SublimeContextParam
hi! link cmakeKWctest_test                              SublimeContextParam
hi! link cmakeKWctest_update                            SublimeContextParam
hi! link cmakeKWctest_update                            SublimeContextParam
hi! link cmakeKWctest_upload                            SublimeContextParam
hi! link cmakeKWctest_upload                            SublimeContextParam
hi! link cmakeKWdefine_property                         SublimeContextParam
hi! link cmakeKWdefine_property                         SublimeContextParam
hi! link cmakeKWenable_language                         SublimeContextParam
hi! link cmakeKWenable_language                         SublimeContextParam
hi! link cmakeKWenable_testing                          SublimeContextParam
hi! link cmakeKWenable_testing                          SublimeContextParam
hi! link cmakeKWexec_program                            SublimeContextParam
hi! link cmakeKWexec_program                            SublimeContextParam
hi! link cmakeKWexecute_process                         SublimeContextParam
hi! link cmakeKWexecute_process                         SublimeContextParam
hi! link cmakeKWexport                                  SublimeContextParam
hi! link cmakeKWexport                                  SublimeContextParam
hi! link cmakeKWexport_library_dependencies             SublimeContextParam
hi! link cmakeKWexport_library_dependencies             SublimeContextParam
hi! link cmakeKWfile                                    SublimeContextParam
hi! link cmakeKWfile                                    SublimeContextParam
hi! link cmakeKWfind_file                               SublimeContextParam
hi! link cmakeKWfind_file                               SublimeContextParam
hi! link cmakeKWfind_library                            SublimeContextParam
hi! link cmakeKWfind_library                            SublimeContextParam
hi! link cmakeKWfind_package                            SublimeContextParam
hi! link cmakeKWfind_package                            SublimeContextParam
hi! link cmakeKWfind_path                               SublimeContextParam
hi! link cmakeKWfind_path                               SublimeContextParam
hi! link cmakeKWfind_program                            SublimeContextParam
hi! link cmakeKWfind_program                            SublimeContextParam
hi! link cmakeKWfltk_wrap_ui                            SublimeContextParam
hi! link cmakeKWfltk_wrap_ui                            SublimeContextParam
hi! link cmakeKWforeach                                 SublimeContextParam
hi! link cmakeKWforeach                                 SublimeContextParam
hi! link cmakeKWfunction                                SublimeContextParam
hi! link cmakeKWfunction                                SublimeContextParam
hi! link cmakeKWget_cmake_property                      SublimeContextParam
hi! link cmakeKWget_cmake_property                      SublimeContextParam
hi! link cmakeKWget_directory_property                  SublimeContextParam
hi! link cmakeKWget_directory_property                  SublimeContextParam
hi! link cmakeKWget_filename_component                  SublimeContextParam
hi! link cmakeKWget_filename_component                  SublimeContextParam
hi! link cmakeKWget_property                            SublimeContextParam
hi! link cmakeKWget_property                            SublimeContextParam
hi! link cmakeKWget_source_file_property                SublimeContextParam
hi! link cmakeKWget_source_file_property                SublimeContextParam
hi! link cmakeKWget_target_property                     SublimeContextParam
hi! link cmakeKWget_target_property                     SublimeContextParam
hi! link cmakeKWget_test_property                       SublimeContextParam
hi! link cmakeKWget_test_property                       SublimeContextParam
hi! link cmakeKWif                                      SublimeContextParam
hi! link cmakeKWif                                      SublimeContextParam
hi! link cmakeKWinclude                                 SublimeContextParam
hi! link cmakeKWinclude                                 SublimeContextParam
hi! link cmakeKWinclude_directories                     SublimeContextParam
hi! link cmakeKWinclude_directories                     SublimeContextParam
hi! link cmakeKWinclude_external_msproject              SublimeContextParam
hi! link cmakeKWinclude_external_msproject              SublimeContextParam
hi! link cmakeKWinclude_guard                           SublimeContextParam
hi! link cmakeKWinclude_guard                           SublimeContextParam
hi! link cmakeKWinstall                                 SublimeContextParam
hi! link cmakeKWinstall                                 SublimeContextParam
hi! link cmakeKWinstall_files                           SublimeContextParam
hi! link cmakeKWinstall_files                           SublimeContextParam
hi! link cmakeKWinstall_programs                        SublimeContextParam
hi! link cmakeKWinstall_programs                        SublimeContextParam
hi! link cmakeKWinstall_targets                         SublimeContextParam
hi! link cmakeKWinstall_targets                         SublimeContextParam
hi! link cmakeKWlink_directories                        SublimeContextParam
hi! link cmakeKWlink_directories                        SublimeContextParam
hi! link cmakeKWlist                                    SublimeContextParam
hi! link cmakeKWlist                                    SublimeContextParam
hi! link cmakeKWload_cache                              SublimeContextParam
hi! link cmakeKWload_cache                              SublimeContextParam
hi! link cmakeKWload_command                            SublimeContextParam
hi! link cmakeKWload_command                            SublimeContextParam
hi! link cmakeKWmacro                                   SublimeContextParam
hi! link cmakeKWmacro                                   SublimeContextParam
hi! link cmakeKWmark_as_advanced                        SublimeContextParam
hi! link cmakeKWmark_as_advanced                        SublimeContextParam
hi! link cmakeKWmath                                    SublimeContextParam
hi! link cmakeKWmath                                    SublimeContextParam
hi! link cmakeKWmessage                                 SublimeContextParam
hi! link cmakeKWmessage                                 SublimeContextParam
hi! link cmakeKWoption                                  SublimeContextParam
hi! link cmakeKWoption                                  SublimeContextParam
hi! link cmakeKWproject                                 SublimeContextParam
hi! link cmakeKWproject                                 SublimeContextParam
hi! link cmakeKWqt_wrap_cpp                             SublimeContextParam
hi! link cmakeKWqt_wrap_cpp                             SublimeContextParam
hi! link cmakeKWqt_wrap_ui                              SublimeContextParam
hi! link cmakeKWqt_wrap_ui                              SublimeContextParam
hi! link cmakeKWremove                                  SublimeContextParam
hi! link cmakeKWremove                                  SublimeContextParam
hi! link cmakeKWseparate_arguments                      SublimeContextParam
hi! link cmakeKWseparate_arguments                      SublimeContextParam
hi! link cmakeKWset                                     SublimeContextParam
hi! link cmakeKWset                                     SublimeContextParam
hi! link cmakeKWset_directory_properties                SublimeContextParam
hi! link cmakeKWset_directory_properties                SublimeContextParam
hi! link cmakeKWset_property                            SublimeContextParam
hi! link cmakeKWset_property                            SublimeContextParam
hi! link cmakeKWset_source_files_properties             SublimeContextParam
hi! link cmakeKWset_source_files_properties             SublimeContextParam
hi! link cmakeKWset_target_properties                   SublimeContextParam
hi! link cmakeKWset_target_properties                   SublimeContextParam
hi! link cmakeKWset_target_properties                   SublimeContextParam
hi! link cmakeKWset_tests_properties                    SublimeContextParam
hi! link cmakeKWset_tests_properties                    SublimeContextParam
hi! link cmakeKWsource_group                            SublimeContextParam
hi! link cmakeKWsource_group                            SublimeContextParam
hi! link cmakeKWstring                                  SublimeContextParam
hi! link cmakeKWstring                                  SublimeContextParam
hi! link cmakeKWsubdirs                                 SublimeContextParam
hi! link cmakeKWsubdirs                                 SublimeContextParam
hi! link cmakeKWtarget_compile_definitions              SublimeContextParam
hi! link cmakeKWtarget_compile_definitions              SublimeContextParam
hi! link cmakeKWtarget_compile_features                 SublimeContextParam
hi! link cmakeKWtarget_compile_features                 SublimeContextParam
hi! link cmakeKWtarget_compile_options                  SublimeContextParam
hi! link cmakeKWtarget_compile_options                  SublimeContextParam
hi! link cmakeKWtarget_include_directories              SublimeContextParam
hi! link cmakeKWtarget_include_directories              SublimeContextParam
hi! link cmakeKWtarget_link_directories                 SublimeContextParam
hi! link cmakeKWtarget_link_directories                 SublimeContextParam
hi! link cmakeKWtarget_link_libraries                   SublimeContextParam
hi! link cmakeKWtarget_link_libraries                   SublimeContextParam
hi! link cmakeKWtarget_link_options                     SublimeContextParam
hi! link cmakeKWtarget_link_options                     SublimeContextParam
hi! link cmakeKWtarget_sources                          SublimeContextParam
hi! link cmakeKWtarget_sources                          SublimeContextParam
hi! link cmakeKWtry_compile                             SublimeContextParam
hi! link cmakeKWtry_compile                             SublimeContextParam
hi! link cmakeKWtry_run                                 SublimeContextParam
hi! link cmakeKWtry_run                                 SublimeContextParam
hi! link cmakeKWunset                                   SublimeContextParam
hi! link cmakeKWunset                                   SublimeContextParam
hi! link cmakeKWuse_mangled_mesa                        SublimeContextParam
hi! link cmakeKWuse_mangled_mesa                        SublimeContextParam
hi! link cmakeKWvariable_requires                       SublimeContextParam
hi! link cmakeKWvariable_requires                       SublimeContextParam
hi! link cmakeKWvariable_watch                          SublimeContextParam
hi! link cmakeKWvariable_watch                          SublimeContextParam
hi! link cmakeKWwrite_basic_package_version_file        SublimeContextParam
hi! link cmakeKWwrite_basic_package_version_file        SublimeContextParam
hi! link cmakeKWwrite_basic_package_version_file        SublimeContextParam
hi! link cmakeKWwrite_file                              SublimeContextParam
hi! link cmakeKWwrite_file                              SublimeContextParam
hi! link cmakeProperty                                  SublimeContextParam

" XXX: Other known deficiencies:
" * Some special args like `IMPORTED_TARGET` aren't recognized in Vim, but
"     Sublime's `CMake` package recognizes them.

" CSS

hi! link cssAttr              SublimeAqua
hi! link cssAttributeSelector Tag
" XXX: Not sure about this one; it has issues with the following:
"   - calc
"   - colors
hi! link cssAttrRegion      Normal
hi! link cssBraces          Normal
hi! link cssClassName       Tag
hi! link cssColor           Constant
hi! link cssFunctionName    SublimeFunctionCall
hi! link cssIdentifier      Tag
hi! link cssPositioningAttr SublimeAqua
hi! link cssProp            SublimeAqua
" XXX: Variation: might be better as pink, actually
hi! link cssPseudoClassId   Normal
hi! link cssSelectorOp      Normal
hi! link cssStyle           cssAttr
hi! link cssTagName         Keyword
" TODO: Find a way to distinguish unit decorators from color hash
hi! link cssUnitDecorators  SpecialChar
hi! link cssURL             String
hi! link cssValueLength     Constant

" C++

" XXX: This is imperfect, as this highlights the expression for the `#if`s
" too.
hi! link cCppOutWrapper  Keyword
hi! link cppStatement    Keyword
" XXX: This is too inclusive of the `namespace` keyword
hi! link cppStructure    SublimeType
hi! link cppSTLException SublimeType
hi! link cppSTLfunction  SublimeFunctionCall
" XXX: There may be no special highlighting here in Sublime itself
hi! link cppSTLios       SublimeAqua
" XXX: There may be no special highlighting here in Sublime itself
hi! link cppSTLnamespace SublimePurple
hi! link cppType         SublimeType
" XXX: Other known deficiencies:
"
" * There's no way to distinguish between function calls and
"     definitions/declarations. :( If you prefer both to be colored, then you
"     can use `hi! link cCustom <color>`.

" C#

hi! link csClass                SublimeType
hi! link csContextualStatement  Keyword
hi! link csIface                SublimeType
hi! link csMethodTag            SublimeType
hi! link csPreCondit            Keyword
hi! link csTypeDecleration      SublimeType
hi! link csType                 SublimeType
hi! link csUnspecifiedStatement Keyword
hi! link csXmlTag               xmlTagName
hi! link csXmlComment           SublimeDocumentation
" XXX: Other known deficiencies:
"
" *  Need some local links for XML getting set to the right color
" *  Operators aren't red in Vim, but are in Sublime.
" *  Function arguments aren't distinguished with their own highlight group
" *  `namespace` is a type in Sublime's highlighting, but is a `csStorage` in
"     Vim
" *  No function call groups exist in Vim.
" *  Region highlighting has no way to distinguish between region
"     preprocess keyword and region name.

" D

hi! link dExternal Keyword

" `diff` patch files

hi! link diffAdded     SublimeGreen
hi! link diffFile      SublimeWarmGrey
hi! link diffIndexLine SublimeWarmGrey
hi! link diffLine      SublimeWarmGrey
hi! link diffRemoved   SublimePink
hi! link diffSubname   SublimeWarmGrey

" eRuby

" call s:h('erubyDelimiter',              {})
hi! link erubyRailsMethod SublimeAqua

" Git

hi! link gitrebaseCommit  Comment
hi! link gitrebaseDrop    Error
hi! link gitrebaseEdit    Keyword
hi! link gitrebaseExec    Keyword
hi! link gitrebaseFixup   Keyword
" FIXME: Make this cooler in extensions!
hi! link gitrebaseHash    Comment
hi! link gitrebasePick    Keyword
hi! link gitrebaseReword  Keyword
hi! link gitrebaseSquash  Keyword
hi! link gitrebaseSummary String
" XXX: Note that highlighting inside the always-present help from Git in
" comments is not available in vim's current highlighting version.
" Variation: it's actually kinda nice to give each of these different colors
" like vanilla Vim does.

" vim-gitgutter

hi! link GitGutterAdd          SublimeGreen
hi! link GitGutterChange       SublimeYellow
hi! link GitGutterDelete       SublimePink
hi! link GitGutterChangeDelete SublimeOrange

" GraphViz
" Variation: I actually like to keep these as Keyword, but Sublime does this
" differently.
hi! link dotBraceEncl Normal
hi! link dotBrackEncl Normal
" XXX: This colors way more stuff than Sublime does, but otherwise we'd miss
" out on operator highlights like with equals signs in attribute value
" definitions.
hi! link dotKeyChar Keyword
hi! link dotKeyword SublimeType
" XXX: Other known deficiencies:
"
" * `graph` keyword isn't correctly classified into a keyword, Sublime does.
"     This can be fixed with `syn keyword dotKeyword graph`.
" * Neither Sublime nor Vim highlight `--` in undirected graphs.
" * Sublime doesn't treat semicolons as a keyword here, Vim does.
" * Vim doesn't distinctly identify declarations like `digraph *blah* { ... }`.
" * Vim doesn't have a group for escape chars (i.e., for `label` values).

" Go

hi! link goArgumentName      SublimeContextParam
hi! link goDeclType          SublimeType
hi! link goDeclaration       SublimeType
hi! link goField             Identifier
hi! link goFunction          Tag
hi! link goFunctionCall      SublimeFunctionCall
" Variation: It's not a bad idea to highlight these separately. Maybe using
" `PreProc` and `Special` like in vanilla `vim-go` upstream isn't a bad idea.
hi! link goGenerate          Comment
hi! link goGenerateVariables Comment
" Variation: It's nice to have builtins highlighted specially, though Sublime
" doesn't do this. I would use `Special` here.
hi! link goExtraType         Identifier
hi! link goImport            Keyword
hi! link goPackage           Keyword
hi! link goReceiverVar       SublimeContextParam
hi! link goStatement         Keyword
hi! link goType              SublimeType
" Variation: I like this better as `SublimeType`, since it has symmetry with
" `goType`.
hi! link goTypeConstructor   Identifier
hi! link goTypeDecl          SublimeType
hi! link goTypeName          Tag
hi! link goVarAssign         Normal
hi! link goVarDefs           Normal

" HTML
" This partially depends on XML -- make sure that groups in XML don't
" adversely affect this!

" XXX: This doesn't exclude things like colons like Sublime does
" FIXME: For some reason this is excluding a "key" attribute
hi! link htmlArg            Tag
" Variation: This is an interesting idea for
hi! link htmlLink           Normal
hi! link htmlSpecialTagName htmlTagName
hi! link htmlSpecialChar    Special
hi! link htmlTagName        Keyword

" Java

"   Common groups
hi! link javaAnnotation       SublimeAqua
hi! link javaAssert           SublimeFunctionCall
hi! link javaClassDecl        SublimeType
hi! link javaConditional      Keyword
hi! link javaExceptions       Keyword
hi! link javaExternal         Keyword
hi! link javaRepeat           Keyword
hi! link javaSpecialChar      Special
hi! link javaStatement        Keyword
hi! link javaType             SublimeType
hi! link javaTypedef          SublimeContextParam
hi! link javaUserLabel        Normal
hi! link javaUserLabelRef     Normal
" XXX: Other known deficiencies:
"
" * There's currently no highlight group for user-defined type names. Weird.
" * `javaClassDecl`, which is the stuff that can go around a class name in a
"     class declaration, doesn't distinguish like Sublime does between the `class`
"     keyword and the `extends`/`implements` keywords.
" * There's a LOT of operators that don't have a good group. :(
" * No nice highlight groups exist for lambdas yet. Mainline `vim` has one,
"     but it highlights the entire span of the lambda.


"   Mainline vim distro

" Variation: I actually like keeping this a separate color -- it's kind of
" nice.
" XXX: Sublime distinguishes between @param names and other tags, but this
" doesn't.
hi! link javaCommentTitle     SublimeDocumentation
hi! link javaDocParam         SublimeAqua
hi! link javaDocTags          Keyword
hi! link javaFuncDef          Tag
hi! link javaC_JavaLang       SublimeType
hi! link javaE_JavaLang       SublimeType
hi! link javaR_JavaLang       SublimeType
hi! link javaX_JavaLang       SublimeType
hi! link javaVarArg           Keyword
" XXX: Other known deficiencies (mainline vim):
"
" * javaFuncDef is way too inclusive -- even the args and its parens are
"     highlighted!
" * java*_JavaLang isn't really up-to-date.

"   vim-java

hi! link javaDeclType         SublimeType
" XXX: Currently unable to distinguish function calls from function definitions.
hi! link javaFunction         SublimeAqua
hi! link javaMapType          SublimeType
" XXX: This isn't a builtin...don't other languages use italics for types?
hi! link javaNonPrimitiveType SublimeType

call s:h('jpropertiesIdentifier', { 'fg': s:pink })

" JavaScript

hi! link jsArgsObj        SublimeAqua
hi! link jsArrowFunction  SublimePink
hi! link jsBuiltins       SublimeFunctionCall
hi! link jsCatch          Keyword
hi! link jsConditional    Keyword
call s:h('jsDocTags',       { 'fg': s:aqua, 'format': 'italic' })
hi! link jsException      Keyword
" Variation: It's actually nice to get this italicized, to me
hi! link jsExceptions     Type
hi! link jsExport         Keyword
hi! link jsFinally        Keyword
hi! link jsFrom           Keyword
call s:h('jsFuncArgRest',   { 'fg': s:purple, 'format': 'italic' })
hi! link jsFuncArgs       SublimeContextParam
hi! link jsFuncCall       SublimeFunctionCall
hi! link jsFuncName       Tag
hi! link jsFunction       SublimeType
hi! link jsFunctionKey    Tag
" FIXME: FutureKeys includes a bit too much. It had some type names, which should be aqua, but most of the keywords that might actually get used would be pink (keywords like public, abstract).
hi! link jsFutureKeys     Keyword
call s:h('jsGlobalObjects', { 'fg': s:aqua, 'format': 'italic' })
hi! link jsImport         Keyword
hi! link jsModuleAs       Keyword
hi! link jsModuleAsterisk Keyword
hi! link jsNan            Constant
hi! link jsNull           Constant
hi! link jsObjectFuncName Tag
hi! link jsPrototype      SublimeAqua
" Variation: Technically this is extra from Sublime, but it looks nice.
hi! link jsRepeat         Keyword
hi! link jsReturn         Keyword
hi! link jsStatement      Keyword
hi! link jsStatic         jsStorageClass
hi! link jsStorageClass   SublimeType
hi! link jsSuper          SublimeContextParam
hi! link jsThis           SublimeContextParam
hi! link jsTry            Keyword
hi! link jsUndefined      Constant

" JSON

hi! link jsonKeyword Identifier

" LESS

hi! link lessVariable Tag

" Makefile

hi! link makeCommands    Normal
hi! link makeCmdNextLine Normal

" NERDTree

hi! link NERDTreeBookmarkName    SublimeYellow
hi! link NERDTreeBookmarksHeader SublimePink
hi! link NERDTreeBookmarksLeader SublimeBlack
hi! link NERDTreeCWD             SublimePink
hi! link NERDTreeClosable        SublimeYellow
hi! link NERDTreeDir             SublimeYellow
hi! link NERDTreeDirSlash        SublimeGrey
hi! link NERDTreeFlags           SublimeDarkGrey
hi! link NERDTreeHelp            SublimeYellow
hi! link NERDTreeOpenable        SublimeYellow
hi! link NERDTreeUp              SublimeWhite

" NERDTree Git

hi! link NERDTreeGitStatusModified SublimeOrange
hi! link NERDTreeGitStatusRenamed SublimeOrange
hi! link NERDTreeGitStatusUntracked SublimeGreen

" PHP

" Variation: It's actually a cool idea to style these to assist reading.
hi! link phpClass           Tag
call s:h('phpClassExtends', { 'fg': s:green, 'format': 'italic' })
hi! link phpComment         Comment
hi! link phpCommentStar     SublimeDocumentation
hi! link phpCommentTitle    SublimeDocumentation
hi! link phpDocComment      SublimeDocumentation
hi! link phpDocIdentifier   SublimeDocumentation
hi! link phpDocParam        SublimeDocumentation
hi! link phpDocTags         Keyword
" Variation: It'd be nice to make these a different color, but there's SO MANY
" THINGS that this applies to!
hi! link phpKeyword         Keyword
" Variation: I actually like linking this against `Keyword`.
hi! link phpMemberSelector  Identifier
hi! link phpNullValue       Special
hi! link phpParent          Normal
call s:h('phpStaticClasses', { 'fg': s:aqua, 'format': 'italic' })
" Variation: I actually like linking this against `Keyword` instead.
hi! link phpVarSelector     Identifier
" XXX: Other known deficiencies:
"
" * Links in doc comments are highlighted aqua in Sublime, but there's no
"     distinguishing right now with php.vim.
" * `phpKeyword` is used as a blanket group for several things that Sublime
"     distinguishes right now. For example:
"     * `echo` should be aqua
"     * `function` should be a `SublimeType`
"     * `return` should be a `Keyword`
"     * `class` should be aqua and italic (maybe `SublimeType`?)
"
"     ... but these are all listed as a `Keyword` right now.
" * Local args don't have their own highlighting group yet in `php.vim`
" * Some doctags don't get highlight like in Sublime because Sublime is
"     weirdly inconsistent with them.
" * The PHP delimiter uses `Delimiter`, which was set to be pink for other
"     reasons. Sublime shows them as white, though.

" Python

" This configuration assumed `python-syntax`
hi! link pythonBoolean            Special
hi! link pythonBuiltinFunc        SublimeFunctionCall
hi! link pythonBuiltinType        SublimeType
" XXX: `__name__` (and maybe others?) get classified into this group, and aren't
" highlighted in vanilla Sublime.
hi! link pythonBuiltinObj         Special
" XXX: `mcs` isn't highlighted by Sublime ATOW, but it should be.
hi! link pythonClass              SublimeGreen
hi! link pythonClassVar           SublimeContextParam
hi! link pythonCoding             Comment
hi! link pythonConditional        Conditional
hi! link pythonException          Keyword
hi! link pythonExClass            SublimeType
hi! link pythonFunction           Tag
hi! link pythonImport             Keyword
hi! link pythonInclude            Keyword
hi! link pythonLambdaExpr         SublimeType
hi! link pythonNone               Special
" XXX: def parens are, for some reason, included in this group.
hi! link pythonParam              SublimeContextParam
hi! link pythonRaiseFromStatement Keyword
hi! link pythonSingleton          Special
" XXX: pythonStatement covers a bit too much...unfortunately, this means that
" some keywords, like `def`, can't be highlighted like in Sublime yet.
hi! link pythonStatement          Keyword
hi! link pythonStrFormat          Special
hi! link pythonRun                Comment
" XXX: Other known deficiencies:
"
" * Python special regexp sequences aren't highlighted. :\
" * Function calls aren't highlighted like they are in Sublime.
" * Non-special args aren't highlighted at all like in Sublime.
" * `b` prefixes for strings aren't highlighted separately like in Sublime.
"
" Most of the above really are just because I haven't found a syntax that
" supports these distinctions yet.

" QuickScope plugin

call s:h('QuickScopePrimary',   { 'bg': s:lightgrey, 'fg': s:black,     'format': 'underline' })
call s:h('QuickScopeSecondary', { 'bg': s:black,     'fg': s:lightgrey, 'format': 'underline' })

" Ruby

" call s:h('rubyInterpolationDelimiter',  {})
" call s:h('rubyInstanceVariable',        {})
" call s:h('rubyGlobalVariable',          {})
" call s:h('rubyClassVariable',           {})
" call s:h('rubyPseudoVariable',          {})
hi! link rubyFunction                 SublimeGreen
hi! link rubyStringDelimiter          SublimeYellow
hi! link rubyRegexp                   SublimeYellow
hi! link rubyRegexpDelimiter          SublimeYellow
hi! link rubySymbol                   SublimePurple
hi! link rubyEscape                   SublimePurple
hi! link rubyInclude                  SublimePink
hi! link rubyOperator                 Operator
hi! link rubyControl                  SublimePink
hi! link rubyClass                    SublimePink
hi! link rubyDefine                   SublimePink
hi! link rubyException                SublimePink
hi! link rubyRailsARAssociationMethod SublimeOrange
hi! link rubyRailsARMethod            SublimeOrange
hi! link rubyRailsRenderMethod        SublimeOrange
hi! link rubyRailsMethod              SublimeOrange
hi! link rubyConstant                 SublimeAqua
hi! link rubyBlockArgument            SublimeContextParam
hi! link rubyBlockParameter           SublimeContextParam

" Rust

hi! link rustAttribute      SublimeGrey
hi! link rustCommentLineDoc SublimeDocumentation
hi! link rustConditional    Conditional
hi! link rustDerive         SublimeGrey
hi! link rustDeriveTrait    SublimeGrey
" Variation: I like making these Special
hi! link rustEnumVariant    SublimeType
hi! link rustFuncCall       SublimeFunctionCall
hi! link rustFuncName       Tag
hi! link rustIdentifier     Tag
" Variation: I actually like making these Special too
hi! link rustLifetime       Keyword
hi! link rustMacro          SublimeFunctionCall
hi! link rustModPathSep     Normal
hi! link rustQuestionMark   Keyword
hi! link rustRepeat         Keyword
hi! link rustSelf           SublimeContextParam
" XXX: Other known deficiencies:
"
" * In Sublime, `fn` and `let` keywords are highlighted with italicized aqua,
"     but Vim lumps them with all other keywords
" * Crate names after `extern crate` are included in `rustIdentifier`, which
"     is technically more inclusive than Sublime's definition group but not so
"     bad I don't think it's an okay default.
" * Sublime does NOT have the `rustEnumVariant` distinction, which is actually
"     a really nice feature.
" * No `fn`/lambda param highlighting is available in Vim like in Sublime
"     here. :(
" * `rust.vim` doesn't highlight typical attributes like in Sublime. Sublime
"     makes this fairly nice, though I prefer to just make them look like doc
"     comments.

" SASS

hi! link sassAmpersand    Operator
hi! link sassClass        Tag
hi! link sassCssAttribute SublimeAqua
hi! link sassInclude      Keyword
" FIXME: No distinction between mixin definition and call
hi! link sassMixinName    SublimeAqua
hi! link sassMixing       Keyword
hi! link sassProperty     SublimeAqua
hi! link sassSelectorOp   Operator
hi! link sassVariable     Identifier

" Scala
" XXX: This highlights the arroba (`@`) of the annotation too, but Sublime
" distinguishes the arroba with pink.
hi! link scalaAnnotation             SublimeAqua
hi! link scalaCapitalWord            SublimeAqua
hi! link scalaCaseFollowing          SublimeContextParam
hi! link scalaEscapedChar            Special
hi! link scalaExternal               Keyword
hi! link scalaInstanceDeclaration    Tag
" XXX: This is a bit too inclusive compared to Sublime, since it also
" highlights the quotes themselves.
hi! link scalaInterpolationBrackets  SublimeAqua
hi! link scalaKeywordModifier        Keyword
" Variation: I actually prefer these to be `Normal`.
hi! link scalaNameDefinition         Tag
" TODO: Is this too inclusive?
hi! link scalaSpecial                Keyword
hi! link scalaSquareBracketsBrackets Normal
" Variation: This isn't perfect, because it encompasses brackets right now.
hi! link scalaTypeDeclaration        SublimeType
" XXX: Other known deficiencies:
"
" * `scalaCapitalWord` is a silly notion. That is all.
" * `scalaNumber` seems more inclusive (erroneously, from what I can tell)
"     than Sublime's number highlights.
" * Function and lambda params don't have a highlight group in vanilla Vim.
"    :(
" * Sublime distinguishes between groups of keywords, i.e., `case class`, from
"     things like `extends`. Vim's vanilla syntax currently doesn't.
" * Sublime highlights some operators pink and others it doesn't, i.e., it
"     DOES do `=` but not parents, brackets
" * Interestingly, arrow notation is highlighted differently for between case
"     matches (pink) and lambdas (blue).

" SQL

hi! link Quote        String
hi! link sqlFunction  SublimeFunctionCall
hi! link sqlKeyword   Keyword
hi! link sqlStatement Keyword

" Syntastic

hi! link SyntasticErrorSign Error
call s:h('SyntasticWarningSign',    { 'fg': s:lightblack, 'bg': s:orange })

" Tagbar

hi! link TagbarFoldIcon            SublimePurple
hi! link TagbarHelp                Comment
hi! link TagbarKind                Keyword
hi! link TagbarNestedKind          Keyword
hi! link TagbarScope               Tag
hi! link TagbarSignature           Comment
hi! link TagbarVisibilityPrivate   SublimePink
hi! link TagbarVisibilityProtected SublimeYellow
hi! link TagbarVisibilityPublic    SublimeGreen

" TypeScript

" Why is this `Keyword` by default? Who knows?
hi! link typescriptEndColons              Normal
" XXX: This is too inclusive -- I expected this to just be the types, but it
" includes the `throw` keyword too.
hi! link typescriptExceptions             SublimeType
hi! link typescriptFuncKeyword            SublimeType
hi! link typescriptIdentifier             SublimeContextParam
" Variation: I far prefer to let this be `Normal`...
hi! link typescriptInterpolation          String
" ...and have this be `Special`.
hi! link typescriptInterpolationDelimiter String
hi! link typescriptLogicSymbols           Keyword
" Why is this `Keyword` by default? Who knows?
hi! link typescriptParens                 Normal
" Variation: I prefer to make this `Special.`, since I use the value way more
" than `null` as a type. Sublime distinguishes, it'd be nice if we could too.
hi! link typescriptNull                   Special
hi! link typescriptStatement              Keyword
hi! link typescriptType                   SublimeType

" XXX: Other deficiencies:
" * `typescriptReserved` doesn't allow some distinctions Sublime does:
"     * globs in imports
"     * `Tag` for things that are definitely declarations/definitions
"     * Browser context params like `console`
"     * Common functions like `console.debug`; I actually don't care about
"         these, but Sublime does.
"     * `is` keyword

" VimL

hi! link vimCommand       Keyword
" Variation: Interesting how this could vary...
hi! link vimCommentTitle  Comment
hi! link vimEnvvar        SublimeAqua
hi! link vimFBVar         SublimeWhite
hi! link vimFuncName      SublimeAqua
hi! link vimFuncNameTag   SublimeAqua
hi! link vimFunction      SublimeGreen
hi! link vimFuncVar       SublimeContextParam
hi! link vimHiGroup       Identifier
hi! link vimIsCommand     SublimeAqua
hi! link vimMapModKey     SublimeAqua
hi! link vimMapRhs        SublimeYellow
hi! link vimNotation      SublimeAqua
hi! link vimOption        SublimeAqua
hi! link vimParenSep      SublimeWhite
hi! link vimScriptFuncTag SublimePink
hi! link vimSet           Keyword
hi! link vimSetEqual      Operator
hi! link vimUserFunc      SublimeAqua
hi! link vimVar           SublimeWhite

" XML

hi! link xmlArg             Tag
hi! link xmlAttrib          Tag
" XXX: This highlight the brackets and end slash too...which we don't want.
hi! link xmlEndTag          Keyword
" Variation: I actually liked it when this was faded.
hi! link xmlProcessingDelim Normal
hi! link xmlTagName         Keyword

" YAML

hi! link yamlBlockCollectionItemStart Normal
hi! link yamlBlockMappingKey          Keyword
hi! link yamlEscape                   Special
" Variation: I kind of like keeping these Special
hi! link yamlFlowIndicator            Normal
hi! link yamlFlowMappingKey           Keyword
hi! link yamlKeyValueDelimiter        Normal
hi! link yamlPlainScalar              String
" XXX: Other known deficiencies:
"
" A good place to see these in action is: http://www.yaml.org/start.html
" * "yes"/"no" values are actually not recognized as yamlBool groups in Vim.
" * Literal/folded block scalars don't have their own group right now in Vim.
" * yamlInteger gets applied to leading numbers in literal/folded block
"     scalars in Vim.
" * References aren't handled at all by Vim, it seems.
" * Vim incorrectly highlights for comments after a scalar value has started.
"
" Other noted deficiencies when using YAML to manually analyze binary files:
"
" * Hex literals as map keys are highlighted in Sublime, not in Vim.
" * Sublime is more permissive about what it highlights for keys, but Sublime
"     may reject them as invalid; i.e., "???" (minus quotes)

" zsh

" Variation: I actually like making these aqua.
hi! link zshDeref    Normal
hi! link zshFunction Tag
" XXX: This isn't awesome because it includes too much, like semicolons. :(
hi! link zshOperator Operator
" Variation: This actually looks nicer as a Special.
hi! link zshOption   Normal
hi! link zshQuoted   Special
" Variation: I'd probably prefer this to be something else, actually.
" XXX: This doesn't work particularly well here...but most of the time, we're
"     in quotes, so let's go with that.
hi! link zshSubst    String
" Variation: I actually like keeping this as Type.
hi! link zshTypes    Keyword
" XXX: Other known deficiencies:
"
" * Semicolons in `if` blocks are `Keyword`ed in Sublime but not distinct in
"     Vim
" * Commands aren't distinct from builtins and keywords in Vim
