" vim:fdm=marker:foldlevel=0
"  ____           _
" |  _ \ _ __ ___| |_ ___
" | |_) | '__/ _ \ __/ _ \
" |  __/| | |  __/ || (_) |
" |_|   |_|  \___|\__\___/
"
" Minimal dark theme for Vim

" Reset -------------------------------------------------------------------{{{1

set background=dark
highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'preto'


" Palette ---------------------------------------------------------------- {{{1

" Credit: junegunn/seoul256.vim (MIT)
if !exists('s:rgb_map')
  if get(g:, 'seoul256_srgb', 0)
    let s:rgb_map =
        \{108: '#87af87', 109: '#87afaf', 161: '#d7005f', 216: '#ffaf87',
        \ 232: '#080808', 233: '#121212', 234: '#1c1c1c',
        \ 235: '#262626', 236: '#303030', 237: '#3a3a3a',
        \ 238: '#444444', 239: '#4e4e4e', 240: '#585858',
        \ 241: '#626262', 242: '#6c6c6c', 243: '#767676',
        \ 244: '#808080', 245: '#8a8a8a', 246: '#949494',
        \ 247: '#9e9e9e', 248: '#a8a8a8', 249: '#b2b2b2',
        \ 250: '#bcbcbc', 251: '#c6c6c6', 252: '#d0d0d0',
        \ 253: '#dadada', 254: '#e4e4e4', 255: '#eeeeee'}
  else
    let s:rgb_map =
        \{108: '#98bc99', 109: '#98bcbd', 161: '#e12672', 216: '#ffbd98',
        \ 232: '#060606', 233: '#171717', 234: '#252525',
        \ 235: '#333233', 236: '#3f3f3f', 237: '#4b4b4b',
        \ 238: '#565656', 239: '#616161', 240: '#6b6b6b',
        \ 241: '#757575', 242: '#6c6c6c', 243: '#767676',
        \ 244: '#808080', 245: '#8a8a8a', 246: '#949494',
        \ 247: '#9e9e9e', 248: '#a8a8a8', 249: '#bfbfbf',
        \ 250: '#c8c8c8', 251: '#d1d0d1', 252: '#d9d9d9',
        \ 253: '#e1e1e1', 254: '#e9e9e9', 255: '#f1f1f1'}
  endif
endif

let s:palette = {}

let s:palette.black  = [16 , '#000000']
let s:palette.gray01 = [232, get(s:rgb_map, 232)]
let s:palette.gray02 = [233, get(s:rgb_map, 233)]
let s:palette.gray03 = [234, get(s:rgb_map, 234)]
let s:palette.gray04 = [235, get(s:rgb_map, 235)]
let s:palette.gray05 = [236, get(s:rgb_map, 236)]
let s:palette.gray06 = [237, get(s:rgb_map, 237)]
let s:palette.gray07 = [238, get(s:rgb_map, 238)]
let s:palette.gray08 = [239, get(s:rgb_map, 239)]
let s:palette.gray09 = [240, get(s:rgb_map, 240)]
let s:palette.gray10 = [241, get(s:rgb_map, 241)]
let s:palette.gray11 = [242, get(s:rgb_map, 242)]
let s:palette.gray12 = [243, get(s:rgb_map, 243)]
let s:palette.gray13 = [244, get(s:rgb_map, 244)]
let s:palette.gray14 = [245, get(s:rgb_map, 245)]
let s:palette.gray15 = [246, get(s:rgb_map, 246)]
let s:palette.gray16 = [247, get(s:rgb_map, 247)]
let s:palette.gray17 = [248, get(s:rgb_map, 248)]
let s:palette.gray18 = [249, get(s:rgb_map, 249)]
let s:palette.gray19 = [250, get(s:rgb_map, 250)]
let s:palette.gray20 = [251, get(s:rgb_map, 251)]
let s:palette.gray21 = [252, get(s:rgb_map, 252)]
let s:palette.gray22 = [253, get(s:rgb_map, 253)]
let s:palette.gray23 = [254, get(s:rgb_map, 254)]
let s:palette.white  = [255, get(s:rgb_map, 255)]

let s:palette.red    = [161, get(s:rgb_map, 161)]
let s:palette.green  = [108, get(s:rgb_map, 108)]
let s:palette.blue   = [109, get(s:rgb_map, 109)]
" See: itchyny/lightline.vim/colorscheme/seoul256.vim
let s:palette.yellow = [3  , '#d8af5f']
let s:palette.orange = [216, get(s:rgb_map, 216)]


" Utilities -------------------------------------------------------------- {{{1

function! s:HL(item, fgColor, bgColor, style, ...)
  let undesirable_runtimes = a:000
  for runtime in undesirable_runtimes
    if has(runtime)
      return
    end
  endfor

  let target = 'cterm'
  let pindex = 0
  if has('gui_running') || (exists('+termguicolors') && &termguicolors)
    let target = 'gui'
    let pindex = 1
  end

  let command  = 'hi ' . a:item
  let command .= ' ' . target . 'fg=' . a:fgColor[pindex]
  let command .= ' ' . target . 'bg=' . a:bgColor[pindex]
  let command .= ' ' . target . '=' . a:style

  execute command
endfunction


" Composition ------------------------------------------------------------ {{{1

" PRIMITIVES
call s:HL('Boolean'       , s:palette.gray09, s:palette.black , 'bold')
call s:HL('Character'     , s:palette.gray09, s:palette.black , 'bold')
call s:HL('Constant'      , s:palette.gray09, s:palette.black , 'bold')
call s:HL('Float'         , s:palette.gray09, s:palette.black , 'bold')
call s:HL('Number'        , s:palette.gray09, s:palette.black , 'bold')
call s:HL('String'        , s:palette.gray12, s:palette.black , 'none')
call s:HL('SpecialChar'   , s:palette.white , s:palette.black , 'none')

" COMMENTS
call s:HL('Comment'       , s:palette.gray08, s:palette.black , 'none')
call s:HL('SpecialComment', s:palette.gray12, s:palette.black , 'none')
call s:HL('Title'         , s:palette.gray12, s:palette.black , 'bold')
call s:HL('Todo'          , s:palette.red   , s:palette.black , 'none')

" LINES, COLUMNS
call s:HL('LineNr'        , s:palette.gray06, s:palette.black , 'bold')
call s:HL('CursorLine'    , s:palette.white , s:palette.gray03, 'none')
call s:HL('CursorLineNr'  , s:palette.gray09, s:palette.black , 'bold')

call s:HL('ColorColumn'   , s:palette.white , s:palette.gray03, 'none')
call s:HL('CursorColumn'  , s:palette.gray16, s:palette.gray03, 'none')

" VISUAL MODE
call s:HL('Visual'        , s:palette.blue  , s:palette.gray02, 'none')
call s:HL('VisualNOS'     , s:palette.blue  , s:palette.gray02, 'none')

" SEARCH
call s:HL('Search'        , s:palette.black , s:palette.yellow, 'bold')
call s:HL('IncSearch'     , s:palette.yellow, s:palette.black , 'bold')

" SPELLING
call s:HL('SpellBad'      , s:palette.white , s:palette.red   , 'bold')
call s:HL('SpellCap'      , s:palette.white , s:palette.red   , 'bold')
call s:HL('SpellLocal'    , s:palette.white , s:palette.red   , 'bold')
call s:HL('SpellRare'     , s:palette.white , s:palette.red   , 'bold')

" ERROR
call s:HL('Error'         , s:palette.red   , s:palette.black , 'bold')

" COMMAND MODE MESSAGES
call s:HL('ErrorMsg'      , s:palette.red   , s:palette.black , 'bold')
call s:HL('WarningMsg'    , s:palette.white , s:palette.black , 'bold')
call s:HL('ModeMsg'       , s:palette.white , s:palette.black , 'bold')
call s:HL('MoreMsg'       , s:palette.white , s:palette.black , 'bold')

" PREPROCESSOR DIRECTIVES
call s:HL('Include'       , s:palette.white , s:palette.black , 'bold')
call s:HL('Define'        , s:palette.white , s:palette.black , 'bold')
call s:HL('Macro'         , s:palette.white , s:palette.black , 'bold')
call s:HL('PreCondit'     , s:palette.white , s:palette.black , 'bold')
call s:HL('PreProc'       , s:palette.white , s:palette.black , 'bold')

" BINDINGS
call s:HL('Identifier'    , s:palette.white , s:palette.black , 'bold')
call s:HL('Function'      , s:palette.white , s:palette.black , 'bold')
call s:HL('Keyword'       , s:palette.white , s:palette.black , 'bold')
call s:HL('Operator'      , s:palette.white , s:palette.black , 'bold')

" TYPES
call s:HL('Type'          , s:palette.white , s:palette.black , 'bold')
call s:HL('Typedef'       , s:palette.white , s:palette.black , 'bold')
call s:HL('StorageClass'  , s:palette.white , s:palette.black , 'bold')
call s:HL('Structure'     , s:palette.white , s:palette.black , 'bold')

" FLOW CONTROL
call s:HL('Statement'     , s:palette.white , s:palette.black , 'bold')
call s:HL('Conditional'   , s:palette.white , s:palette.black , 'bold')
call s:HL('Repeat'        , s:palette.white , s:palette.black , 'bold')
call s:HL('Label'         , s:palette.white , s:palette.black , 'bold')
call s:HL('Exception'     , s:palette.white , s:palette.black , 'bold')

" MISC
call s:HL('Normal'        , s:palette.gray19, s:palette.black , 'none')
call s:HL('Cursor'        , s:palette.white , s:palette.black , 'none', 'gui_macvim')
call s:HL('Underlined'    , s:palette.gray12, s:palette.black , 'underline')
call s:HL('SpecialKey'    , s:palette.white , s:palette.black , 'bold')
call s:HL('NonText'       , s:palette.gray06, s:palette.black , 'bold')
call s:HL('Directory'     , s:palette.orange, s:palette.black , 'none')

" FOLD
call s:HL('FoldColumn'    , s:palette.gray06, s:palette.black , 'bold')
call s:HL('Folded'        , s:palette.gray06, s:palette.black , 'bold')

" PARENTHESIS
call s:HL('MatchParen'    , s:palette.orange, s:palette.black , 'bold')

" POPUP
call s:HL('Pmenu'         , s:palette.white , s:palette.gray09, 'none')
call s:HL('PmenuSbar'     , s:palette.black , s:palette.gray19, 'none')
call s:HL('PmenuSel'      , s:palette.black , s:palette.gray19, 'none')
call s:HL('PmenuThumb'    , s:palette.gray01, s:palette.gray09, 'none')

" SPLITS
call s:HL('VertSplit'     , s:palette.gray19, s:palette.black , 'none')

" OTHERS
call s:HL('Debug'         , s:palette.white , s:palette.black , 'none')
call s:HL('Delimiter'     , s:palette.white , s:palette.black , 'none')
call s:HL('Question'      , s:palette.white , s:palette.black , 'none')
call s:HL('Special'       , s:palette.white , s:palette.black , 'none')
call s:HL('StatusLine'    , s:palette.white , s:palette.black , 'none', 'gui_macvim')
call s:HL('StatusLineNC'  , s:palette.white , s:palette.black , 'none', 'gui_macvim')
call s:HL('Tag'           , s:palette.white , s:palette.black , 'none')
call s:HL('WildMenu'      , s:palette.white , s:palette.black , 'none')

" DIFF
call s:HL('DiffAdd'       , s:palette.white , s:palette.green , 'none')
call s:HL('DiffChange'    , s:palette.white , s:palette.blue  , 'none')
call s:HL('DiffDelete'    , s:palette.white , s:palette.red   , 'none')
call s:HL('DiffText'      , s:palette.black , s:palette.yellow, 'none')


" Links ------------------------------------------------------------------ {{{1

" TODO


" Filetype Specific ------------------------------------------------------ {{{1

" TODO


" Plugin Specific -------------------------------------------------------- {{{1

" TODO
