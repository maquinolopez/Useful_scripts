" -----------------------------------------------------------------------------
" Name:         Edge
" Description:  Clean & Elegant Color Scheme inspired by Atom One and Material
" Author:       Sainnhepark <sainnhe@gmail.com>
" Website:      https://github.com/sainnhe/edge/
" License:      MIT && Anti-996
" -----------------------------------------------------------------------------

" Initialization: {{{
highlight clear
if exists('syntax_on')
  syntax reset
endif

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2
let s:tmux = executable('tmux') && $TMUX !=# ''

let g:colors_name = 'edge'
" }}}
" Configuration: {{{
let s:configuration = {}
let s:configuration.style = get(g:, 'edge_style', 'default')
let s:configuration.transparent_background = get(g:, 'edge_transparent_background', 0)
let s:configuration.menu_selection_background = get(g:, 'edge_menu_selection_background', 'blue')
let s:configuration.disable_italic_comment = get(g:, 'edge_disable_italic_comment', 0)
let s:configuration.enable_italic = get(g:, 'edge_enable_italic', 0)
let s:configuration.cursor = get(g:, 'edge_cursor', 0)
let s:configuration.current_word = get(g:, 'edge_current_word', get(g:, 'edge_transparent_background', 0) == 0 ? 'grey background' : 'bold')
" }}}
" Palette: {{{
if s:configuration.style ==# 'default'
  if &background ==# 'dark'
    let s:palette = {
          \ 'bg0':        ['#2c2e34',   '235',  'Black'],
          \ 'bg1':        ['#30323a',   '236',  'DarkGrey'],
          \ 'bg2':        ['#30323a',   '236',  'DarkGrey'],
          \ 'bg3':        ['#363944',   '237',  'DarkGrey'],
          \ 'bg4':        ['#3b3e48',   '237',  'Grey'],
          \ 'bg5':        ['#414550',   '238',  'Grey'],
          \ 'bg_grey':    ['#828a98',   '246',  'LightGrey'],
          \ 'bg_red':     ['#ec7279',   '203',  'Red'],
          \ 'bg_red1':    ['#473536',   '52',   'DarkRed'],
          \ 'bg_red2':    ['#573c3d',   '52',   'DarkRed'],
          \ 'bg_green':   ['#a0c980',   '107',  'Green'],
          \ 'bg_green1':  ['#384034',   '22',   'DarkGreen'],
          \ 'bg_green2':  ['#424c3b',   '22',   'DarkGreen'],
          \ 'bg_blue':    ['#6cb6eb',   '110',  'Blue'],
          \ 'bg_blue1':   ['#323e47',   '17',   'DarkBlue'],
          \ 'bg_blue2':   ['#394957',   '17',   'DarkBlue'],
          \ 'bg_purple':  ['#d38aea',   '176',  'Magenta'],
          \ 'bg_purple1': ['#433948',   '54',   'DarkMagenta'],
          \ 'bg_purple2': ['#514359',   '54',   'DarkMagenta'],
          \ 'fg':         ['#c5cdd9',   '250',  'White'],
          \ 'red':        ['#ec7279',   '203',  'Red'],
          \ 'yellow':     ['#deb974',   '179',  'Yellow'],
          \ 'green':      ['#a0c980',   '107',  'Green'],
          \ 'cyan':       ['#5dbbc1',   '72',   'Cyan'],
          \ 'blue':       ['#6cb6eb',   '110',  'Blue'],
          \ 'purple':     ['#d38aea',   '176',  'Magenta'],
          \ 'grey':       ['#7f8490',   '246',  'LightGrey'],
          \ 'none':       ['NONE',      'NONE', 'NONE']
          \ }
  else
    let s:palette = {
          \ 'bg0':        ['#fafafa',   '231',  'White'],
          \ 'bg1':        ['#f1f4f6',   '255',  'LightGrey'],
          \ 'bg2':        ['#eef1f4',   '255',  'LightGrey'],
          \ 'bg3':        ['#e8ebf0',   '254',  'LightGrey'],
          \ 'bg4':        ['#e8ebf0',   '253',  'Grey'],
          \ 'bg5':        ['#dde2e7',   '253',  'Grey'],
          \ 'bg_grey':    ['#bcc5cf',   '246',  'DarkGrey'],
          \ 'bg_red':     ['#e17373',   '167',  'Red'],
          \ 'bg_red1':    ['#f6e4e4',   '217',  'LightRed'],
          \ 'bg_red2':    ['#f4dada',   '217',  'LightRed'],
          \ 'bg_green':   ['#76af6f',   '107',  'Green'],
          \ 'bg_green1':  ['#e5eee4',   '150',  'LightGreen'],
          \ 'bg_green2':  ['#dae9d8',   '150',  'LightGreen'],
          \ 'bg_blue':    ['#6996e0',   '68',   'Blue'],
          \ 'bg_blue1':   ['#e3eaf6',   '153',  'LightBlue'],
          \ 'bg_blue2':   ['#d6e1f4',   '153',  'LightBlue'],
          \ 'bg_purple':  ['#bf75d6',   '134',  'Magenta'],
          \ 'bg_purple1': ['#f1e5f5',   '183',  'LightMagenta'],
          \ 'bg_purple2': ['#eddaf2',   '183',  'LightMagenta'],
          \ 'fg':         ['#4b505b',   '240',  'Black'],
          \ 'red':        ['#d05858',   '167',  'Red'],
          \ 'yellow':     ['#be7e05',   '172',  'Yellow'],
          \ 'green':      ['#608e32',   '107',  'Green'],
          \ 'cyan':       ['#3a8b84',   '73',   'Cyan'],
          \ 'blue':       ['#5079be',   '68',   'Blue'],
          \ 'purple':     ['#b05ccc',   '134',  'Magenta'],
          \ 'grey':       ['#949ba5',   '245',  'Grey'],
          \ 'none':       ['NONE',      'NONE', 'NONE']
          \ }
  endif
elseif s:configuration.style ==# 'aura'
  if &background ==# 'dark'
    let s:palette = {
          \ 'bg0':        ['#2b2d37',   '235',  'Black'],
          \ 'bg1':        ['#2f323e',   '236',  'DarkGrey'],
          \ 'bg2':        ['#2f323e',   '236',  'DarkGrey'],
          \ 'bg3':        ['#363a49',   '237',  'DarkGrey'],
          \ 'bg4':        ['#3a3e4e',   '237',  'Grey'],
          \ 'bg5':        ['#404455',   '238',  'Grey'],
          \ 'bg_grey':    ['#7e869b',   '246',  'LightGrey'],
          \ 'bg_red':     ['#ec7279',   '203',  'Red'],
          \ 'bg_red1':    ['#473536',   '52',   'DarkRed'],
          \ 'bg_red2':    ['#573c3d',   '52',   'DarkRed'],
          \ 'bg_green':   ['#a0c980',   '107',  'Green'],
          \ 'bg_green1':  ['#384034',   '22',   'DarkGreen'],
          \ 'bg_green2':  ['#424c3b',   '22',   'DarkGreen'],
          \ 'bg_blue':    ['#6cb6eb',   '110',  'Blue'],
          \ 'bg_blue1':   ['#323e47',   '17',   'DarkBlue'],
          \ 'bg_blue2':   ['#394957',   '17',   'DarkBlue'],
          \ 'bg_purple':  ['#d38aea',   '176',  'Magenta'],
          \ 'bg_purple1': ['#433948',   '54',   'DarkMagenta'],
          \ 'bg_purple2': ['#514359',   '54',   'DarkMagenta'],
          \ 'fg':         ['#c5cdd9',   '250',  'White'],
          \ 'red':        ['#ec7279',   '203',  'Red'],
          \ 'yellow':     ['#deb974',   '179',  'Yellow'],
          \ 'green':      ['#a0c980',   '107',  'Green'],
          \ 'cyan':       ['#5dbbc1',   '72',   'Cyan'],
          \ 'blue':       ['#6cb6eb',   '110',  'Blue'],
          \ 'purple':     ['#d38aea',   '176',  'Magenta'],
          \ 'grey':       ['#7e8294',   '246',  'LightGrey'],
          \ 'none':       ['NONE',      'NONE', 'NONE']
          \ }
  else
    let s:palette = {
          \ 'bg0':        ['#fafafa',   '231',  'White'],
          \ 'bg1':        ['#f1f4f6',   '255',  'LightGrey'],
          \ 'bg2':        ['#eef1f4',   '255',  'LightGrey'],
          \ 'bg3':        ['#e8ebf0',   '254',  'LightGrey'],
          \ 'bg4':        ['#e6eaf0',   '253',  'Grey'],
          \ 'bg5':        ['#dde3e9',   '253',  'Grey'],
          \ 'bg_grey':    ['#bbc6d1',   '246',  'DarkGrey'],
          \ 'bg_red':     ['#e17373',   '167',  'Red'],
          \ 'bg_red1':    ['#f6e4e4',   '217',  'LightRed'],
          \ 'bg_red2':    ['#f4dada',   '217',  'LightRed'],
          \ 'bg_green':   ['#76af6f',   '107',  'Green'],
          \ 'bg_green1':  ['#e5eee4',   '150',  'LightGreen'],
          \ 'bg_green2':  ['#dae9d8',   '150',  'LightGreen'],
          \ 'bg_blue':    ['#6996e0',   '68',   'Blue'],
          \ 'bg_blue1':   ['#e3eaf6',   '153',  'LightBlue'],
          \ 'bg_blue2':   ['#d6e1f4',   '153',  'LightBlue'],
          \ 'bg_purple':  ['#bf75d6',   '134',  'Magenta'],
          \ 'bg_purple1': ['#f1e5f5',   '183',  'LightMagenta'],
          \ 'bg_purple2': ['#eddaf2',   '183',  'LightMagenta'],
          \ 'fg':         ['#4b505b',   '240',  'Black'],
          \ 'red':        ['#d05858',   '167',  'Red'],
          \ 'yellow':     ['#be7e05',   '172',  'Yellow'],
          \ 'green':      ['#608e32',   '107',  'Green'],
          \ 'cyan':       ['#3a8b84',   '73',   'Cyan'],
          \ 'blue':       ['#5079be',   '68',   'Blue'],
          \ 'purple':     ['#b05ccc',   '134',  'Magenta'],
          \ 'grey':       ['#949ba5',   '245',  'Grey'],
          \ 'none':       ['NONE',      'NONE', 'NONE']
          \ }
  endif
elseif s:configuration.style ==# 'neon'
  if &background ==# 'dark'
    let s:palette = {
          \ 'bg0':        ['#2b2d3a',   '235',  'Black'],
          \ 'bg1':        ['#2f3242',   '236',  'DarkGrey'],
          \ 'bg2':        ['#2f3242',   '236',  'DarkGrey'],
          \ 'bg3':        ['#363a4e',   '237',  'DarkGrey'],
          \ 'bg4':        ['#393e53',   '237',  'Grey'],
          \ 'bg5':        ['#3f445b',   '238',  'Grey'],
          \ 'bg_grey':    ['#7a819d',   '246',  'LightGrey'],
          \ 'bg_red':     ['#ec7279',   '203',  'Red'],
          \ 'bg_red1':    ['#473536',   '52',   'DarkRed'],
          \ 'bg_red2':    ['#573c3d',   '52',   'DarkRed'],
          \ 'bg_green':   ['#a0c980',   '107',  'Green'],
          \ 'bg_green1':  ['#384034',   '22',   'DarkGreen'],
          \ 'bg_green2':  ['#424c3b',   '22',   'DarkGreen'],
          \ 'bg_blue':    ['#6cb6eb',   '110',  'Blue'],
          \ 'bg_blue1':   ['#323e47',   '17',   'DarkBlue'],
          \ 'bg_blue2':   ['#394957',   '17',   'DarkBlue'],
          \ 'bg_purple':  ['#d38aea',   '176',  'Magenta'],
          \ 'bg_purple1': ['#433948',   '54',   'DarkMagenta'],
          \ 'bg_purple2': ['#514359',   '54',   'DarkMagenta'],
          \ 'fg':         ['#c5cdd9',   '250',  'White'],
          \ 'red':        ['#ec7279',   '203',  'Red'],
          \ 'yellow':     ['#deb974',   '179',  'Yellow'],
          \ 'green':      ['#a0c980',   '107',  'Green'],
          \ 'cyan':       ['#5dbbc1',   '72',   'Cyan'],
          \ 'blue':       ['#6cb6eb',   '110',  'Blue'],
          \ 'purple':     ['#d38aea',   '176',  'Magenta'],
          \ 'grey':       ['#7e8294',   '246',  'LightGrey'],
          \ 'none':       ['NONE',      'NONE', 'NONE']
          \ }
  else
    let s:palette = {
          \ 'bg0':        ['#fafafa',   '231',  'White'],
          \ 'bg1':        ['#f1f5f7',   '255',  'LightGrey'],
          \ 'bg2':        ['#eef2f6',   '255',  'LightGrey'],
          \ 'bg3':        ['#e7ecf1',   '254',  'LightGrey'],
          \ 'bg4':        ['#e5eaf0',   '253',  'Grey'],
          \ 'bg5':        ['#dde4ea',   '253',  'Grey'],
          \ 'bg_grey':    ['#bbc7d3',   '246',  'DarkGrey'],
          \ 'bg_red':     ['#e17373',   '167',  'Red'],
          \ 'bg_red1':    ['#f6e4e4',   '217',  'LightRed'],
          \ 'bg_red2':    ['#f4dada',   '217',  'LightRed'],
          \ 'bg_green':   ['#76af6f',   '107',  'Green'],
          \ 'bg_green1':  ['#e5eee4',   '150',  'LightGreen'],
          \ 'bg_green2':  ['#dae9d8',   '150',  'LightGreen'],
          \ 'bg_blue':    ['#6996e0',   '68',   'Blue'],
          \ 'bg_blue1':   ['#e3eaf6',   '153',  'LightBlue'],
          \ 'bg_blue2':   ['#d6e1f4',   '153',  'LightBlue'],
          \ 'bg_purple':  ['#bf75d6',   '134',  'Magenta'],
          \ 'bg_purple1': ['#f1e5f5',   '183',  'LightMagenta'],
          \ 'bg_purple2': ['#eddaf2',   '183',  'LightMagenta'],
          \ 'fg':         ['#4b505b',   '240',  'Black'],
          \ 'red':        ['#d05858',   '167',  'Red'],
          \ 'yellow':     ['#be7e05',   '172',  'Yellow'],
          \ 'green':      ['#608e32',   '107',  'Green'],
          \ 'cyan':       ['#3a8b84',   '73',   'Cyan'],
          \ 'blue':       ['#5079be',   '68',   'Blue'],
          \ 'purple':     ['#b05ccc',   '134',  'Magenta'],
          \ 'grey':       ['#949ba5',   '245',  'Grey'],
          \ 'none':       ['NONE',      'NONE', 'NONE']
          \ }
  endif
endif
" }}}
" Function: {{{
" call s:HL(group, foreground, background)
" call s:HL(group, foreground, background, gui, guisp)
"
" E.g.:
" call s:HL('Normal', s:palette.fg, s:palette.bg0)

if (has('termguicolors') && &termguicolors) || has('gui_running')  " guifg guibg gui cterm guisp
  function! s:HL(group, fg, bg, ...)
    let hl_string = [
          \ 'highlight', a:group,
          \ 'guifg=' . a:fg[0],
          \ 'guibg=' . a:bg[0],
          \ ]
    if a:0 >= 1
      if a:1 ==# 'undercurl'
        if !s:tmux
          call add(hl_string, 'gui=undercurl')
        else
          call add(hl_string, 'gui=underline')
        endif
        call add(hl_string, 'cterm=underline')
      else
        call add(hl_string, 'gui=' . a:1)
        call add(hl_string, 'cterm=' . a:1)
      endif
    else
      call add(hl_string, 'gui=NONE')
      call add(hl_string, 'cterm=NONE')
    endif
    if a:0 >= 2
      call add(hl_string, 'guisp=' . a:2[0])
    endif
    execute join(hl_string, ' ')
  endfunction
elseif s:t_Co >= 256  " ctermfg ctermbg cterm
  function! s:HL(group, fg, bg, ...)
    let hl_string = [
          \ 'highlight', a:group,
          \ 'ctermfg=' . a:fg[1],
          \ 'ctermbg=' . a:bg[1],
          \ ]
    if a:0 >= 1
      if a:1 ==# 'undercurl'
        call add(hl_string, 'cterm=underline')
      else
        call add(hl_string, 'cterm=' . a:1)
      endif
    else
      call add(hl_string, 'cterm=NONE')
    endif
    execute join(hl_string, ' ')
  endfunction
else  " ctermfg ctermbg cterm
  function! s:HL(group, fg, bg, ...)
    let hl_string = [
          \ 'highlight', a:group,
          \ 'ctermfg=' . a:fg[2],
          \ 'ctermbg=' . a:bg[2],
          \ ]
    if a:0 >= 1
      if a:1 ==# 'undercurl'
        call add(hl_string, 'cterm=underline')
      else
        call add(hl_string, 'cterm=' . a:1)
      endif
    else
      call add(hl_string, 'cterm=NONE')
    endif
    execute join(hl_string, ' ')
  endfunction
endif
" }}}

" Common Highlight Groups: {{{
" UI: {{{
if s:configuration.transparent_background
  call s:HL('Normal', s:palette.fg, s:palette.none)
  call s:HL('Terminal', s:palette.fg, s:palette.none)
  call s:HL('EndOfBuffer', s:palette.bg0, s:palette.none)
  call s:HL('FoldColumn', s:palette.grey, s:palette.none)
  call s:HL('Folded', s:palette.grey, s:palette.none)
  call s:HL('SignColumn', s:palette.fg, s:palette.none)
  call s:HL('ToolbarLine', s:palette.fg, s:palette.none)
else
  call s:HL('Normal', s:palette.fg, s:palette.bg0)
  call s:HL('Terminal', s:palette.fg, s:palette.bg0)
  call s:HL('EndOfBuffer', s:palette.bg0, s:palette.bg0)
  call s:HL('FoldColumn', s:palette.grey, s:palette.bg2)
  call s:HL('Folded', s:palette.grey, s:palette.bg2)
  call s:HL('SignColumn', s:palette.fg, s:palette.bg2)
  call s:HL('ToolbarLine', s:palette.fg, s:palette.bg4)
endif
call s:HL('ColorColumn', s:palette.none, s:palette.bg2)
call s:HL('Conceal', s:palette.grey, s:palette.none)
if s:configuration.cursor ==# 'auto'
  call s:HL('Cursor', s:palette.none, s:palette.none, 'reverse')
elseif s:configuration.cursor ==# 'red'
  call s:HL('Cursor', s:palette.bg0, s:palette.red)
elseif s:configuration.cursor ==# 'green'
  call s:HL('Cursor', s:palette.bg0, s:palette.green)
elseif s:configuration.cursor ==# 'blue'
  call s:HL('Cursor', s:palette.bg0, s:palette.blue)
elseif s:configuration.cursor ==# 'purple'
  call s:HL('Cursor', s:palette.bg0, s:palette.purple)
endif
highlight! link vCursor Cursor
highlight! link iCursor Cursor
highlight! link lCursor Cursor
highlight! link CursorIM Cursor
call s:HL('CursorColumn', s:palette.none, s:palette.bg1)
call s:HL('CursorLine', s:palette.none, s:palette.bg1)
call s:HL('LineNr', s:palette.grey, s:palette.none)
if &relativenumber == 1 && &cursorline == 0
  call s:HL('CursorLineNr', s:palette.fg, s:palette.none)
else
  call s:HL('CursorLineNr', s:palette.fg, s:palette.bg1)
endif
call s:HL('DiffAdd', s:palette.none, s:palette.bg_green1)
call s:HL('DiffChange', s:palette.none, s:palette.bg_blue1)
call s:HL('DiffDelete', s:palette.none, s:palette.bg_red1)
call s:HL('DiffText', s:palette.none, s:palette.none, 'reverse')
call s:HL('Directory', s:palette.green, s:palette.none)
call s:HL('ErrorMsg', s:palette.red, s:palette.none, 'bold,underline')
call s:HL('WarningMsg', s:palette.yellow, s:palette.none, 'bold')
call s:HL('ModeMsg', s:palette.fg, s:palette.none, 'bold')
call s:HL('MoreMsg', s:palette.blue, s:palette.none, 'bold')
call s:HL('IncSearch', s:palette.bg0, s:palette.bg_red)
call s:HL('Search', s:palette.bg0, s:palette.bg_green)
call s:HL('MatchParen', s:palette.none, s:palette.bg5)
call s:HL('NonText', s:palette.bg5, s:palette.none)
call s:HL('Whitespace', s:palette.bg5, s:palette.none)
call s:HL('SpecialKey', s:palette.bg5, s:palette.none)
call s:HL('Pmenu', s:palette.fg, s:palette.bg3)
call s:HL('PmenuSbar', s:palette.none, s:palette.bg3)
if s:configuration.menu_selection_background ==# 'blue'
  call s:HL('PmenuSel', s:palette.bg0, s:palette.bg_blue)
  call s:HL('WildMenu', s:palette.bg0, s:palette.bg_blue)
elseif s:configuration.menu_selection_background ==# 'green'
  call s:HL('PmenuSel', s:palette.bg0, s:palette.bg_green)
  call s:HL('WildMenu', s:palette.bg0, s:palette.bg_green)
elseif s:configuration.menu_selection_background ==# 'purple'
  call s:HL('PmenuSel', s:palette.bg0, s:palette.bg_purple)
  call s:HL('WildMenu', s:palette.bg0, s:palette.bg_purple)
endif
call s:HL('PmenuThumb', s:palette.none, s:palette.bg_grey)
call s:HL('Question', s:palette.yellow, s:palette.none)
call s:HL('SpellBad', s:palette.red, s:palette.none, 'undercurl', s:palette.red)
call s:HL('SpellCap', s:palette.yellow, s:palette.none, 'undercurl', s:palette.yellow)
call s:HL('SpellLocal', s:palette.blue, s:palette.none, 'undercurl', s:palette.blue)
call s:HL('SpellRare', s:palette.purple, s:palette.none, 'undercurl', s:palette.purple)
call s:HL('StatusLine', s:palette.fg, s:palette.bg5)
call s:HL('StatusLineTerm', s:palette.fg, s:palette.bg5)
call s:HL('StatusLineNC', s:palette.grey, s:palette.bg2)
call s:HL('StatusLineTermNC', s:palette.grey, s:palette.bg2)
call s:HL('TabLine', s:palette.fg, s:palette.bg5)
call s:HL('TabLineFill', s:palette.grey, s:palette.bg2)
call s:HL('TabLineSel', s:palette.bg0, s:palette.bg_purple)
call s:HL('VertSplit', s:palette.bg5, s:palette.none)
call s:HL('Visual', s:palette.none, s:palette.bg4)
call s:HL('VisualNOS', s:palette.none, s:palette.bg4, 'italic')
call s:HL('QuickFixLine', s:palette.purple, s:palette.none, 'bold')
call s:HL('Debug', s:palette.yellow, s:palette.none)
call s:HL('debugPC', s:palette.bg0, s:palette.green)
call s:HL('debugBreakpoint', s:palette.bg0, s:palette.red)
call s:HL('ToolbarButton', s:palette.bg0, s:palette.bg_blue)
if has('nvim')
  highlight! link healthError Red
  highlight! link healthSuccess Green
  highlight! link healthWarning Yellow
  highlight! link LspDiagnosticsError Grey
  highlight! link LspDiagnosticsWarning Grey
  highlight! link LspDiagnosticInformation Grey
  highlight! link LspDiagnosticHint Grey
  highlight! link LspReferenceText CocHighlightText
  highlight! link LspReferenceRead CocHighlightText
  highlight! link LspReferenceWrite CocHighlightText
endif
" }}}
" Syntax: {{{
if s:configuration.enable_italic
  call s:HL('PreProc', s:palette.red, s:palette.none, 'italic')
  call s:HL('PreCondit', s:palette.purple, s:palette.none, 'italic')
  call s:HL('Include', s:palette.red, s:palette.none, 'italic')
  call s:HL('Define', s:palette.red, s:palette.none, 'italic')
  call s:HL('Conditional', s:palette.purple, s:palette.none, 'italic')
  call s:HL('Repeat', s:palette.purple, s:palette.none, 'italic')
  call s:HL('Keyword', s:palette.red, s:palette.none, 'italic')
  call s:HL('Typedef', s:palette.red, s:palette.none, 'italic')
  call s:HL('Statement', s:palette.purple, s:palette.none, 'italic')
  call s:HL('Exception', s:palette.red, s:palette.none, 'italic')
else
  call s:HL('PreProc', s:palette.red, s:palette.none)
  call s:HL('PreCondit', s:palette.purple, s:palette.none)
  call s:HL('Include', s:palette.red, s:palette.none)
  call s:HL('Define', s:palette.red, s:palette.none)
  call s:HL('Conditional', s:palette.purple, s:palette.none)
  call s:HL('Repeat', s:palette.purple, s:palette.none)
  call s:HL('Keyword', s:palette.red, s:palette.none)
  call s:HL('Typedef', s:palette.red, s:palette.none)
  call s:HL('Statement', s:palette.purple, s:palette.none)
  call s:HL('Exception', s:palette.red, s:palette.none)
endif
call s:HL('Macro', s:palette.red, s:palette.none)
call s:HL('Error', s:palette.red, s:palette.none)
call s:HL('Label', s:palette.red, s:palette.none)
call s:HL('Special', s:palette.yellow, s:palette.none)
call s:HL('SpecialChar', s:palette.yellow, s:palette.none)
call s:HL('Type', s:palette.yellow, s:palette.none)
call s:HL('Structure', s:palette.yellow, s:palette.none)
call s:HL('Boolean', s:palette.green, s:palette.none)
call s:HL('String', s:palette.green, s:palette.none)
call s:HL('Character', s:palette.green, s:palette.none)
call s:HL('Number', s:palette.green, s:palette.none)
call s:HL('Float', s:palette.green, s:palette.none)
call s:HL('Identifier', s:palette.fg, s:palette.none)
call s:HL('Constant', s:palette.cyan, s:palette.none)
call s:HL('Function', s:palette.blue, s:palette.none)
call s:HL('Operator', s:palette.blue, s:palette.none)
call s:HL('Title', s:palette.purple, s:palette.none, 'bold')
call s:HL('StorageClass', s:palette.purple, s:palette.none)
call s:HL('Tag', s:palette.purple, s:palette.none)
call s:HL('Delimiter', s:palette.fg, s:palette.none)
if s:configuration.disable_italic_comment
  call s:HL('Comment', s:palette.grey, s:palette.none)
  call s:HL('SpecialComment', s:palette.grey, s:palette.none)
  call s:HL('Todo', s:palette.purple, s:palette.none)
else
  call s:HL('Comment', s:palette.grey, s:palette.none, 'italic')
  call s:HL('SpecialComment', s:palette.grey, s:palette.none, 'italic')
  call s:HL('Todo', s:palette.purple, s:palette.none, 'italic')
endif
call s:HL('Ignore', s:palette.grey, s:palette.none)
call s:HL('Underlined', s:palette.none, s:palette.none, 'underline')
" }}}
" Predefined Highlight Groups: {{{
call s:HL('Fg', s:palette.fg, s:palette.none)
call s:HL('Grey', s:palette.grey, s:palette.none)
call s:HL('Yellow', s:palette.yellow, s:palette.none)
call s:HL('Green', s:palette.green, s:palette.none)
call s:HL('Cyan', s:palette.cyan, s:palette.none)
call s:HL('Blue', s:palette.blue, s:palette.none)
if s:configuration.enable_italic
  call s:HL('RedItalic', s:palette.red, s:palette.none, 'italic')
  call s:HL('PurpleItalic', s:palette.purple, s:palette.none, 'italic')
else
  call s:HL('RedItalic', s:palette.red, s:palette.none)
  call s:HL('PurpleItalic', s:palette.purple, s:palette.none)
endif
call s:HL('Red', s:palette.red, s:palette.none)
call s:HL('Purple', s:palette.purple, s:palette.none)
" }}}
" }}}
" Extended File Types: {{{
" markdown: {{{
call s:HL('markdownH1', s:palette.purple, s:palette.none, 'bold')
call s:HL('markdownH2', s:palette.red, s:palette.none, 'bold')
call s:HL('markdownH3', s:palette.yellow, s:palette.none, 'bold')
call s:HL('markdownH4', s:palette.green, s:palette.none, 'bold')
call s:HL('markdownH5', s:palette.cyan, s:palette.none, 'bold')
call s:HL('markdownH6', s:palette.blue, s:palette.none, 'bold')
call s:HL('markdownUrl', s:palette.green, s:palette.none, 'underline')
call s:HL('markdownItalicDelimiter', s:palette.grey, s:palette.none, 'italic')
call s:HL('markdownBold', s:palette.none, s:palette.none, 'bold')
call s:HL('markdownItalic', s:palette.none, s:palette.none, 'italic')
call s:HL('mkdURL', s:palette.green, s:palette.none, 'underline')
call s:HL('mkdItalic', s:palette.grey, s:palette.none, 'italic')
highlight! link markdownLinkText Blue
highlight! link markdownHeadingDelimiter Grey
highlight! link markdownIdDeclaration Cyan
highlight! link markdownId Cyan
highlight! link markdownListMarker Cyan
highlight! link markdownCodeDelimiter Cyan
highlight! link markdownCode Green
highlight! link markdownBoldDelimiter Grey
highlight! link markdownRule Purple
highlight! link mkdLink Blue
highlight! link mkdHeading Grey
highlight! link mkdLinkDef Cyan
highlight! link mkdID Cyan
highlight! link mkdListItem Cyan
highlight! link mkdCodeDelimiter Cyan
highlight! link mkdCode Green
highlight! link mkdBold Grey
highlight! link mkdRule Purple
" }}}
" rst: {{{
call s:HL('rstStandaloneHyperlink', s:palette.green, s:palette.none, 'underline')
call s:HL('rstSections', s:palette.purple, s:palette.none, 'bold')
highlight! link rstDirective Blue
highlight! link rstExplicitMarkup Red
highlight! link rstInterpretedTextOrHyperlinkReference Green
highlight! link rstInlineLiteral Green
highlight! link rstSubstitutionReference Cyan
" }}}
" tex: {{{
highlight! link texStatement Blue
highlight! link texDefCmd Red
highlight! link texDefName Cyan
highlight! link texOnlyMath Grey
" }}}
" html: {{{
call s:HL('htmlH1', s:palette.purple, s:palette.none, 'bold')
call s:HL('htmlH2', s:palette.red, s:palette.none, 'bold')
call s:HL('htmlH3', s:palette.yellow, s:palette.none, 'bold')
call s:HL('htmlH4', s:palette.green, s:palette.none, 'bold')
call s:HL('htmlH5', s:palette.cyan, s:palette.none, 'bold')
call s:HL('htmlH6', s:palette.blue, s:palette.none, 'bold')
call s:HL('htmlLink', s:palette.none, s:palette.none, 'underline')
call s:HL('htmlBold', s:palette.none, s:palette.none, 'bold')
call s:HL('htmlBoldUnderline', s:palette.none, s:palette.none, 'bold,underline')
call s:HL('htmlBoldItalic', s:palette.none, s:palette.none, 'bold,italic')
call s:HL('htmlBoldUnderlineItalic', s:palette.none, s:palette.none, 'bold,underline,italic')
call s:HL('htmlUnderline', s:palette.none, s:palette.none, 'underline')
call s:HL('htmlUnderlineItalic', s:palette.none, s:palette.none, 'underline,italic')
call s:HL('htmlItalic', s:palette.none, s:palette.none, 'italic')
highlight! link htmlTag Purple
highlight! link htmlTagN PurpleItalic
highlight! link htmlTagName PurpleItalic
highlight! link htmlSpecialTagName RedItalic
highlight! link htmlArg Blue
highlight! link htmlEndTag Blue
" }}}
" xml: {{{
highlight! link xmlTag Purple
highlight! link xmlTagName PurpleItalic
highlight! link xmlAttrib Blue
" }}}
" css: {{{
highlight! link cssFunctionName Yellow
highlight! link cssClassName PurpleItalic
highlight! link cssClassNameDot Purple
highlight! link cssAttrComma Fg
highlight! link cssTagName PurpleItalic
highlight! link cssBraces Fg
highlight! link cssSelectorOp Fg
highlight! link cssVendor Grey
highlight! link cssSelectorOp2 Blue
highlight! link cssImportant RedItalic
" }}}
" sass: {{{
highlight! link sassMixing Green
highlight! link sassClass PurpleItalic
highlight! link sassClassChar Purple
highlight! link sassMixin Blue
highlight! link sassAmpersand Cyan
highlight! link sassFunction Yellow
" }}}
" scss: {{{
highlight! link scssSelectorChar Purple
highlight! link scssSelectorName PurpleItalic
highlight! link scssForKeyword RedItalic
highlight! link scssDefault Red
highlight! link scssAmpersand Cyan
highlight! link scssMixinName Yellow
highlight! link scssFunctionName Yellow
" }}}
" less: {{{
highlight! link lessMixinChar Purple
highlight! link lessClass PurpleItalic
highlight! link lessVariable Red
highlight! link lessAmpersandChar Cyan
highlight! link lessFunction Yellow
" }}}
" js: {{{
highlight! link jsGlobalNodeObjects RedItalic
highlight! link jsGlobalObjects Yellow
highlight! link jsFunction Blue
highlight! link jsOperatorKeyword RedItalic
highlight! link jsThis Cyan
highlight! link jsParensError Red
highlight! link jsArrowFunction Blue
highlight! link jsTaggedTemplate Cyan
highlight! link javaScriptReserved PurpleItalic
highlight! link javaScriptBraces Fg
highlight! link javaScriptOperator RedItalic
highlight! link javaScriptNull Yellow
highlight! link javaScriptMessage Cyan
highlight! link javaScriptGlobal Blue
" }}}
" ts: {{{
highlight! link typescriptLabel PurpleItalic
highlight! link typescriptExceptions RedItalic
highlight! link typescriptBraces Fg
highlight! link typescriptEndColons Fg
highlight! link typescriptParens Fg
highlight! link typescriptDocTags Purple
highlight! link typescriptLogicSymbols Blue
highlight! link typescriptImport PurpleItalic
highlight! link typescriptBOM Blue
highlight! link typescriptVariableDeclaration Fg
highlight! link typescriptVariable RedItalic
highlight! link typescriptExport PurpleItalic
highlight! link typescriptAliasDeclaration Yellow
highlight! link typescriptClassName Blue
highlight! link typescriptAccessibilityModifier PurpleItalic
highlight! link typescriptOperator RedItalic
highlight! link typescriptEnumKeyword RedItalic
highlight! link typescriptArrowFunc Blue
highlight! link typescriptMethodAccessor RedItalic
highlight! link typescriptMember Blue
highlight! link typescriptTypeReference Cyan
highlight! link typescriptDefault Yellow
highlight! link typescriptTemplateSB Cyan
highlight! link typescriptArrowFuncArg Fg
highlight! link typescriptParamImpl Green
highlight! link typescriptFuncComma Fg
highlight! link jsxOpenPunct Blue
highlight! link typescriptCastKeyword RedItalic
highlight! link typescriptCall Blue
highlight! link typescriptCase RedItalic
" }}}
" dart: {{{
highlight! link dartMetadata RedItalic
highlight! link dartInterpolation Cyan
highlight! link dartCoreClasses Blue
" }}}
" coffee: {{{
highlight! link coffeeParens Green
highlight! link coffeeCurly Fg
highlight! link coffeeParen Fg
highlight! link coffeeSpecialOp Fg
highlight! link coffeeInterp Cyan
highlight! link coffeeInterpDelim Cyan
highlight! link coffeeConstant Blue
highlight! link coffeeOperator RedItalic
highlight! link coffeeExtendedOp Blue
" }}}
" purescript: {{{
highlight! link purescriptModuleKeyword PurpleItalic
highlight! link purescriptModule RedItalic
highlight! link purescriptModuleName Red
highlight! link purescriptClassName Blue
highlight! link purescriptImport Cyan
highlight! link purescriptAsKeyword Purple
highlight! link purescriptImportAs Blue
highlight! link purescriptWhere PurpleItalic
" }}}
" java: {{{
highlight! link javaScopeDecl RedItalic
highlight! link javaTypedef Cyan
highlight! link javaAnnotation Blue
" }}}
" kotlin: {{{
highlight! link ktStructure RedItalic
highlight! link ktAnnotation Blue
highlight! link ktKeyword Blue
highlight! link ktArrow Blue
" }}}
" python: {{{
highlight! link pythonNone Yellow
highlight! link pythonExClass Blue
highlight! link pythonDecorator RedItalic
highlight! link pythonDottedName RedItalic
" }}}
" go: {{{
highlight! link goPackage RedItalic
highlight! link goImport RedItalic
highlight! link goDeclType Blue
highlight! link goBuiltins Blue
" }}}
" rust: {{{
highlight! link rustModPath Purple
highlight! link rustAttribute PurpleItalic
highlight! link rustPubScopeCrate Green
highlight! link rustStructure PurpleItalic
highlight! link rustSigil Blue
highlight! link rustSelf Cyan
highlight! link rustEnumVariant Blue
highlight! link rustDerive Purple
highlight! link rustDeriveTrait RedItalic
" }}}
" php: {{{
highlight! link phpUseClass Blue
highlight! link phpClass PurpleItalic
highlight! link phpClassExtends Blue
highlight! link phpParent Fg
highlight! link phpFunction Blue
highlight! link phpType PurpleItalic
highlight! link phpMethod Yellow
highlight! link phpMemberSelector Green
" }}}
" c: {{{
highlight! link cStatement RedItalic
" }}}
" csharp: {{{
highlight! link csUnspecifiedStatement RedItalic
highlight! link csEndColon Fg
highlight! link csBraces Fg
highlight! link csParens Fg
highlight! link csClass Red
highlight! link csType RedItalic
highlight! link csNewType Yellow
highlight! link csClassType Blue
highlight! link csAsync RedItalic
highlight! link csLogicSymbols Blue
highlight! link csLabel Blue
" }}}
" fsharp: {{{
highlight! link fsharpOpen PurpleItalic
highlight! link fsharpModule Blue
highlight! link fsharpSymbol Fg
highlight! link fsharpCoreClass Blue
highlight! link fsharpException PurpleItalic
highlight! link fsharpScript PurpleItalic
highlight! link fsharpAttrib PurpleItalic
highlight! link fsharpAttribute Blue
" }}}
" swift: {{{
highlight! link swiftStructure PurpleItalic
highlight! link swiftAttributes PurpleItalic
" }}}
" ruby: {{{
highlight! link rubyModule PurpleItalic
highlight! link rubyModuleName Red
highlight! link rubyClassName Blue
highlight! link rubyConstant Cyan
highlight! link rubyAttribute PurpleItalic
highlight! link rubyInstanceVariable Yellow
highlight! link rubyAccess PurpleItalic
" }}}
" perl: {{{
highlight! link perlPackageDecl Blue
highlight! link perlStatementPackage RedItalic
highlight! link perlFunction PurpleItalic
highlight! link perlStatementInclude RedItalic
highlight! link podCommand RedItalic
highlight! link podVerbatimLine Green
highlight! link podCmdText Purple
highlight! link perlStatementStorage RedItalic
highlight! link perlStatementHash RedItalic
highlight! link perlStatementList Green
highlight! link perlStatementIndirObj Fg
highlight! link perlMethod Yellow
highlight! link perlPackageRef Blue
" }}}
" haskell: {{{
highlight! link haskellDeclKeyword RedItalic
highlight! link haskellType Blue
highlight! link haskellDecl PurpleItalic
highlight! link haskellPreProc PurpleItalic
highlight! link haskellWhere RedItalic
highlight! link haskellOperators PurpleItalic
" }}}
" lua: {{{
highlight! link luaLocal RedItalic
highlight! link luaBraces Fg
highlight! link luaSpecialTable Blue
highlight! link luaSpecialValue Yellow
highlight! link luaFuncCall Blue
highlight! link luaFuncKeyword PurpleItalic
highlight! link luaFuncTable Cyan
" }}}
" moonscript: {{{
highlight! link moonLuaFunc PurpleItalic
highlight! link moonSpecialOp Fg
highlight! link moonObject Blue
highlight! link moonInterpDelim Cyan
" }}}
" d: {{{
highlight! link dImport PurpleItalic
highlight! link dStructure RedItalic
highlight! link dEnum PurpleItalic
highlight! link dScopeDecl RedItalic
highlight! link dAnnotation Blue
highlight! link dAttribute Blue
" }}}
" scala: {{{
highlight! link scalaCapitalWord PurpleItalic
highlight! link scalaKeywordModifier PurpleItalic
highlight! link scalaInstanceDeclaration Blue
highlight! link scalaSpecial PurpleItalic
highlight! link scalaSquareBracketsBrackets Fg
highlight! link scalaTypeDeclaration Yellow
" }}}
" elixir: {{{
highlight! link elixirModuleDeclaration PurpleItalic
highlight! link elixirInclude PurpleItalic
highlight! link elixirAlias Blue
highlight! link elixirVariable Yellow
highlight! link elixirPseudoVariable Yellow
highlight! link elixirDefine PurpleItalic
highlight! link elixirMacroDeclaration PurpleItalic
highlight! link elixirModuleDefine PurpleItalic
highlight! link elixirProtocolDefine PurpleItalic
highlight! link elixirImplDefine PurpleItalic
highlight! link elixirRecordDefine PurpleItalic
highlight! link elixirPrivateRecordDefine PurpleItalic
highlight! link elixirMacroDefine PurpleItalic
highlight! link elixirPrivateMacroDefine PurpleItalic
highlight! link elixirDelegateDefine PurpleItalic
highlight! link elixirOverridableDefine PurpleItalic
highlight! link elixirExceptionDefine PurpleItalic
highlight! link elixirCallbackDefine PurpleItalic
highlight! link elixirStructDefine PurpleItalic
" }}}
" ocaml: {{{
highlight! link ocamlModule Blue
highlight! link ocamlEqual Blue
highlight! link ocamlPpxEncl PurpleItalic
highlight! link ocamlArrow Blue
highlight! link ocamlModPath PurpleItalic
highlight! link ocamlKeyChar Blue
highlight! link ocamlFullMod PurpleItalic
highlight! link ocamlFuncWith Fg
highlight! link ocamlWith Blue
highlight! link ocamlModParam1 Green
highlight! link ocamlModPreRHS Fg
highlight! link ocamlConstructor Green
" }}}
" clojure: {{{
highlight! link clojureDefine PurpleItalic
highlight! link clojureQuote Fg
highlight! link clojureSpecial PurpleItalic
highlight! link clojureDispatch Yellow
highlight! link clojureVariable Green
" }}}
" erlang: {{{
highlight! link erlangType PurpleItalic
highlight! link erlangLocalFuncCall Blue
highlight! link erlangLocalFuncRef Yellow
highlight! link erlangGlobalFuncCall PurpleItalic
" }}}
" julia: {{{
highlight! link juliaBlKeyword PurpleItalic
" }}}
" lisp: {{{
highlight! link lispDecl RedItalic
highlight! link lispKey Blue
" }}}
" sh: {{{
highlight! link shCommandSub RedItalic
highlight! link shDerefSimple Blue
highlight! link shDerefVar Yellow
highlight! link shQuote Green
highlight! link shFunction RedItalic
" }}}
" zsh: {{{
highlight! link zshOptStart PurpleItalic
highlight! link zshOption Blue
highlight! link zshSubst Yellow
highlight! link zshFunction PurpleItalic
highlight! link zshDeref Blue
highlight! link zshTypes PurpleItalic
" }}}
" fish: {{{
highlight! link fishIdentifier Blue
" }}}
" vim: {{{
highlight! link vimFunction Blue
highlight! link vimLet RedItalic
highlight! link vimMap Blue
highlight! link vimMapMod Yellow
highlight! link vimMapLhs Green
highlight! link vimMapRhs Green
highlight! link vimNotation PurpleItalic
highlight! link vimAugroupKey RedItalic
highlight! link vimAutoCmd Blue
" }}}
" json: {{{
highlight! link jsonKeyword Blue
" }}}
" yaml: {{{
highlight! link yamlKey Blue
" }}}
" toml: {{{
highlight! link tomlKey Blue
" }}}
" diff: {{{
highlight! link diffAdded Green
highlight! link diffRemoved Red
highlight! link diffChanged Yellow
highlight! link diffOldFile Blue
highlight! link diffNewFile Purple
highlight! link diffFile Green
highlight! link diffLine Grey
highlight! link diffIndexLine Cyan
" }}}
" help: {{{
call s:HL('helpURL', s:palette.cyan, s:palette.none, 'underline')
call s:HL('helpNote', s:palette.red, s:palette.none, 'bold')
highlight! link helpHyperTextEntry Blue
highlight! link helpHyperTextJump Red
highlight! link helpSectionDelim Grey
highlight! link helpExample Green
highlight! link helpCommand Purple
highlight! link helpHeadline Purple
highlight! link helpHeader Blue
" }}}
" }}}
" Plugins: {{{
" vim-plug: {{{
call s:HL('plug1', s:palette.purple, s:palette.none, 'bold')
call s:HL('plugNumber', s:palette.green, s:palette.none, 'bold')
highlight! link plug2 Cyan
highlight! link plugBracket Blue
highlight! link plugName Green
highlight! link plugDash Blue
highlight! link plugNotLoaded Grey
highlight! link plugH2 Blue
highlight! link plugMessage Blue
highlight! link plugError Red
highlight! link plugRelDate Grey
highlight! link plugStar Purple
highlight! link plugUpdate Cyan
highlight! link plugDeleted Grey
highlight! link plugEdge Purple
" }}}
" EasyMotion: {{{
highlight! link EasyMotionTarget Search
highlight! link EasyMotionShade Grey
" }}}
" Sneak: {{{
highlight! link Sneak Cursor
highlight! link SneakLabel Cursor
highlight! link SneakScope DiffChange
" }}}
" GitCommit: {{{
highlight! link gitcommitSelectedFile Green
highlight! link gitcommitDiscardedFile Red
" }}}
" GitGutter {{{
if s:configuration.transparent_background
  call s:HL('GitGutterAdd', s:palette.green, s:palette.none)
  call s:HL('GitGutterChange', s:palette.blue, s:palette.none)
  call s:HL('GitGutterDelete', s:palette.red, s:palette.none)
  call s:HL('GitGutterChangeDelete', s:palette.purple, s:palette.none)
else
  call s:HL('GitGutterAdd', s:palette.green, s:palette.bg2)
  call s:HL('GitGutterChange', s:palette.blue, s:palette.bg2)
  call s:HL('GitGutterDelete', s:palette.red, s:palette.bg2)
  call s:HL('GitGutterChangeDelete', s:palette.purple, s:palette.bg2)
endif
" }}}
" Signify: {{{
highlight! link SignifySignAdd GitGutterAdd
highlight! link SignifySignChange GitGutterChange
highlight! link SignifySignDelete GitGutterDelete
highlight! link SignifySignChangeDelete GitGutterChangeDelete
" }}}
" Signature {{{
if s:configuration.transparent_background
  call s:HL('SignatureMarkText', s:palette.blue, s:palette.none)
  call s:HL('SignatureMarkerText', s:palette.purple, s:palette.none)
else
  call s:HL('SignatureMarkText', s:palette.blue, s:palette.bg2)
  call s:HL('SignatureMarkerText', s:palette.purple, s:palette.bg2)
endif
" }}}
" LeaderF: {{{
if !exists('g:Lf_StlColorscheme')
  let g:Lf_StlColorscheme = 'one'
endif
call s:HL('Lf_hl_match', s:palette.green, s:palette.none, 'bold')
call s:HL('Lf_hl_match0', s:palette.green, s:palette.none, 'bold')
call s:HL('Lf_hl_match1', s:palette.cyan, s:palette.none, 'bold')
call s:HL('Lf_hl_match2', s:palette.blue, s:palette.none, 'bold')
call s:HL('Lf_hl_match3', s:palette.purple, s:palette.none, 'bold')
call s:HL('Lf_hl_match4', s:palette.red, s:palette.none, 'bold')
call s:HL('Lf_hl_matchRefine', s:palette.yellow, s:palette.none, 'bold')
highlight! link Lf_hl_cursorline Fg
highlight! link Lf_hl_selection DiffAdd
highlight! link Lf_hl_rgHighlight Visual
highlight! link Lf_hl_gtagsHighlight Visual
" }}}
" FZF: {{{
let g:fzf_colors = {
      \ 'fg': ['fg', 'Normal'],
      \ 'bg': ['bg', 'Normal'],
      \ 'hl': ['fg', 'Green'],
      \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+': ['fg', 'Green'],
      \ 'info': ['fg', 'Cyan'],
      \ 'prompt': ['fg', 'Purple'],
      \ 'pointer': ['fg', 'Blue'],
      \ 'marker': ['fg', 'Blue'],
      \ 'spinner': ['fg', 'Yellow'],
      \ 'header': ['fg', 'Blue']
      \ }
" }}}
" Denite{{{
call s:HL('deniteMatchedChar', s:palette.green, s:palette.none, 'bold')
call s:HL('deniteMatchedRange', s:palette.green, s:palette.none, 'bold,underline')
call s:HL('deniteInput', s:palette.green, s:palette.bg2, 'bold')
call s:HL('deniteStatusLineNumber', s:palette.purple, s:palette.bg2)
call s:HL('deniteStatusLinePath', s:palette.fg, s:palette.bg2)
" }}}
" CtrlP: {{{
call s:HL('CtrlPMatch', s:palette.green, s:palette.none, 'bold')
call s:HL('CtrlPPrtBase', s:palette.bg_grey, s:palette.none)
call s:HL('CtrlPLinePre', s:palette.bg_grey, s:palette.none)
call s:HL('CtrlPMode1', s:palette.blue, s:palette.bg2, 'bold')
call s:HL('CtrlPMode2', s:palette.bg2, s:palette.blue, 'bold')
call s:HL('CtrlPStats', s:palette.grey, s:palette.bg2, 'bold')
highlight! link CtrlPNoEntries Red
highlight! link CtrlPPrtCursor Blue
" }}}
" Denite: {{{
highlight! link deniteSelectedLine Green
" }}}
" Startify: {{{
highlight! link StartifyBracket Grey
highlight! link StartifyFile Fg
highlight! link StartifyNumber Red
highlight! link StartifyPath Green
highlight! link StartifySlash Green
highlight! link StartifySection Blue
highlight! link StartifyHeader Purple
highlight! link StartifySpecial Grey
" }}}
" BufTabLine: {{{
highlight! link BufTabLineCurrent TabLineSel
highlight! link BufTabLineActive TabLine
highlight! link BufTabLineHidden TabLineFill
highlight! link BufTabLineFill TabLineFill
" }}}
" Netrw: {{{
highlight! link netrwDir Green
highlight! link netrwClassify Green
highlight! link netrwLink Grey
highlight! link netrwSymLink Fg
highlight! link netrwExe Red
highlight! link netrwComment Grey
highlight! link netrwList Cyan
highlight! link netrwHelpCmd Blue
highlight! link netrwCmdSep Grey
highlight! link netrwVersion Purple
" }}}
" NERDTree: {{{
highlight! link NERDTreeDir Green
highlight! link NERDTreeDirSlash Cyan
highlight! link NERDTreeOpenable Blue
highlight! link NERDTreeClosable Blue
highlight! link NERDTreeFile Fg
highlight! link NERDTreeExecFile Red
highlight! link NERDTreeUp Grey
highlight! link NERDTreeCWD Purple
highlight! link NERDTreeHelp Grey
highlight! link NERDTreeToggleOn Green
highlight! link NERDTreeToggleOff Red
highlight! link NERDTreeFlags Blue
highlight! link NERDTreeLinkFile Grey
highlight! link NERDTreeLinkTarget Green
" }}}
" Tagbar: {{{
highlight! link TagbarFoldIcon Blue
highlight! link TagbarSignature Green
highlight! link TagbarKind Purple
highlight! link TagbarScope Red
highlight! link TagbarNestedKind Blue
highlight! link TagbarVisibilityPrivate Red
highlight! link TagbarVisibilityPublic Blue
" }}}
" Vista: {{{
highlight! link VistaBracket Grey
highlight! link VistaChildrenNr Yellow
highlight! link VistaScope Red
highlight! link VistaTag Green
highlight! link VistaPrefix Grey
highlight! link VistaColon Green
highlight! link VistaIcon Purple
highlight! link VistaLineNr Fg
" }}}
" Syntastic: {{{
highlight! link SyntasticError ALEError
highlight! link SyntasticWarning ALEWarning
highlight! link SyntasticErrorSign ALEErrorSign
highlight! link SyntasticWarningSign ALEWarningSign
" }}}
" ALE: {{{
call s:HL('ALEError', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
call s:HL('ALEWarning', s:palette.none, s:palette.none, 'undercurl', s:palette.yellow)
call s:HL('ALEInfo', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
if s:configuration.transparent_background
  call s:HL('ALEErrorSign', s:palette.red, s:palette.none)
  call s:HL('ALEWarningSign', s:palette.yellow, s:palette.none)
  call s:HL('ALEInfoSign', s:palette.blue, s:palette.none)
else
  call s:HL('ALEErrorSign', s:palette.red, s:palette.bg2)
  call s:HL('ALEWarningSign', s:palette.yellow, s:palette.bg2)
  call s:HL('ALEInfoSign', s:palette.blue, s:palette.bg2)
endif
highlight! link ALEVirtualTextError Grey
highlight! link ALEVirtualTextWarning Grey
highlight! link ALEVirtualTextInfo Grey
highlight! link ALEVirtualTextStyleError ALEVirtualTextError
highlight! link ALEVirtualTextStyleWarning ALEVirtualTextWarning
" }}}
" Neomake: {{{
highlight! link NeomakeError ALEError
highlight! link NeomakeErrorSign ALEErrorSign
highlight! link NeomakeWarning ALEWarning
highlight! link NeomakeWarningSign ALEWarningSign
highlight! link NeomakeInfo ALEInfo
highlight! link NeomakeInfoSign ALEInfoSign
highlight! link NeomakeMessage Cyan
highlight! link NeomakeMessageSign CocHintSign
highlight! link NeomakeVirtualtextError Grey
highlight! link NeomakeVirtualtextWarning Grey
highlight! link NeomakeVirtualtextInfo Grey
highlight! link NeomakeVirtualtextMessag Grey
" }}}
" CoC: {{{
if s:configuration.current_word ==# 'bold'
  call s:HL('CocHighlightText', s:palette.none, s:palette.none, 'bold')
elseif s:configuration.current_word ==# 'underline'
  call s:HL('CocHighlightText', s:palette.none, s:palette.none, 'underline')
elseif s:configuration.current_word ==# 'italic'
  call s:HL('CocHighlightText', s:palette.none, s:palette.none, 'italic')
elseif s:configuration.current_word ==# 'grey background'
  call s:HL('CocHighlightText', s:palette.none, s:palette.bg3)
endif
call s:HL('CocHoverRange', s:palette.none, s:palette.none, 'bold,underline')
if s:configuration.transparent_background
  call s:HL('CocHintSign', s:palette.cyan, s:palette.none)
else
  call s:HL('CocHintSign', s:palette.cyan, s:palette.bg2)
endif
highlight! link CocCodeLens Grey
highlight! link CocErrorSign ALEErrorSign
highlight! link CocWarningSign ALEWarningSign
highlight! link CocInfoSign ALEInfoSign
highlight! link CocHintSign Label
highlight! link CocErrorHighlight ALEError
highlight! link CocWarningHighlight ALEWarning
highlight! link CocInfoHighlight ALEInfo
highlight! link CocWarningVirtualText ALEVirtualTextWarning
highlight! link CocErrorVirtualText ALEVirtualTextError
highlight! link CocInfoVirtualText ALEVirtualTextInfo
highlight! link CocHintVirtualText ALEVirtualTextInfo
highlight! link CocGitAddedSign GitGutterAdd
highlight! link CocGitChangeRemovedSign GitGutterChangeDelete
highlight! link CocGitChangedSign GitGutterChange
highlight! link CocGitRemovedSign GitGutterDelete
highlight! link CocGitTopRemovedSign GitGutterDelete
highlight! link CocExplorerBufferRoot Purple
highlight! link CocExplorerBufferExpandIcon Red
highlight! link CocExplorerBufferBufnr Yellow
highlight! link CocExplorerBufferModified Red
highlight! link CocExplorerBufferBufname Grey
highlight! link CocExplorerBufferFullpath Grey
highlight! link CocExplorerFileRoot Purple
highlight! link CocExplorerFileExpandIcon Red
highlight! link CocExplorerFileFullpath Grey
highlight! link CocExplorerFileDirectory Green
highlight! link CocExplorerFileGitStage Blue
highlight! link CocExplorerFileGitUnstage Yellow
highlight! link CocExplorerFileSize Blue
highlight! link CocExplorerTimeAccessed Cyan
highlight! link CocExplorerTimeCreated Cyan
highlight! link CocExplorerTimeModified Cyan
" }}}
" UndoTree: {{{
call s:HL('UndotreeSavedBig', s:palette.red, s:palette.none, 'bold')
highlight! link UndotreeNode Blue
highlight! link UndotreeNodeCurrent Purple
highlight! link UndotreeSeq Green
highlight! link UndotreeCurrent Cyan
highlight! link UndotreeNext Yellow
highlight! link UndotreeTimeStamp Grey
highlight! link UndotreeHead Purple
highlight! link UndotreeBranch Cyan
highlight! link UndotreeSavedSmall Red
" }}}
" vim-matchup{{{
call s:HL('MatchParenCur', s:palette.none, s:palette.none, 'bold')
call s:HL('MatchWord', s:palette.none, s:palette.none, 'underline')
call s:HL('MatchWordCur', s:palette.none, s:palette.none, 'underline')
" }}}
" Quick Scope {{{
call s:HL('QuickScopePrimary', s:palette.green, s:palette.none, 'underline')
call s:HL('QuickScopeSecondary', s:palette.blue, s:palette.none, 'underline')
" }}}
" QuickMenu: {{{
highlight! link QuickmenuOption Green
highlight! link QuickmenuNumber Red
highlight! link QuickmenuBracket Grey
highlight! link QuickmenuHelp Blue
highlight! link QuickmenuSpecial Grey
highlight! link QuickmenuHeader Purple
" }}}
" WhichKey: {{{
highlight! link WhichKey Red
highlight! link WhichKeySeperator Green
highlight! link WhichKeyGroup Purple
highlight! link WhichKeyDesc Blue
" }}}
" Vim Multiple Cursors: {{{
highlight! link multiple_cursors_cursor Cursor
highlight! link multiple_cursors_visual Visual
" }}}
" Vim Visual Multi: {{{
let g:VM_Mono_hl = 'Cursor'
let g:VM_Extend_hl = 'Visual'
let g:VM_Cursor_hl = 'Cursor'
let g:VM_Insert_hl = 'Cursor'
" }}}
" Vim Current Word: {{{
highlight! link CurrentWord CocHighlightText
highlight! link CurrentWordTwins CocHighlightText
" }}}
" Vim Illuminate: {{{
highlight! link illuminatedWord CocHighlightText
" }}}
" Vim Cursor Word: {{{
let g:cursorword_highlight = 0
highlight! link CursorWord0 CocHighlightText
highlight! link CursorWord1 CocHighlightText
" }}}
" Blamer {{{
highlight! link Blamer Grey
" }}}
" indentLine{{{
let g:indentLine_color_gui = s:palette.grey[0]
let g:indentLine_color_term = s:palette.grey[1]
" }}}
" cohama/agit.vim {{{
highlight! link agitTree Grey
highlight! link agitDate Green
highlight! link agitRemote Red
highlight! link agitHead Purple
highlight! link agitRef Blue
highlight! link agitTag Purple
highlight! link agitStatFile Blue
highlight! link agitStatRemoved Red
highlight! link agitStatAdded Green
highlight! link agitStatMessage Purple
highlight! link agitDiffRemove diffRemoved
highlight! link agitDiffAdd diffAdded
highlight! link agitDiffHeader Purple
" }}}
" }}}
" Terminal: {{{
if (has('termguicolors') && &termguicolors) || has('gui_running')
  " Definition
  let s:terminal = {
        \ 'black':    &background ==# 'dark' ? s:palette.bg0 : s:palette.fg,
        \ 'red':      s:palette.red,
        \ 'yellow':   s:palette.yellow,
        \ 'green':    s:palette.green,
        \ 'cyan':     s:palette.cyan,
        \ 'blue':     s:palette.blue,
        \ 'purple':   s:palette.purple,
        \ 'white':    &background ==# 'dark' ? s:palette.fg : s:palette.bg0
        \ }
  " Implementation: {{{
  if !has('nvim')
    let g:terminal_ansi_colors = [s:terminal.black[0], s:terminal.red[0], s:terminal.green[0], s:terminal.yellow[0],
          \ s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0], s:terminal.black[0], s:terminal.red[0],
          \ s:terminal.green[0], s:terminal.yellow[0], s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0]]
  else
    let g:terminal_color_0 = s:terminal.black[0]
    let g:terminal_color_1 = s:terminal.red[0]
    let g:terminal_color_2 = s:terminal.green[0]
    let g:terminal_color_3 = s:terminal.yellow[0]
    let g:terminal_color_4 = s:terminal.blue[0]
    let g:terminal_color_5 = s:terminal.purple[0]
    let g:terminal_color_6 = s:terminal.cyan[0]
    let g:terminal_color_7 = s:terminal.white[0]
    let g:terminal_color_8 = s:terminal.black[0]
    let g:terminal_color_9 = s:terminal.red[0]
    let g:terminal_color_10 = s:terminal.green[0]
    let g:terminal_color_11 = s:terminal.yellow[0]
    let g:terminal_color_12 = s:terminal.blue[0]
    let g:terminal_color_13 = s:terminal.purple[0]
    let g:terminal_color_14 = s:terminal.cyan[0]
    let g:terminal_color_15 = s:terminal.white[0]
  endif
  " }}}
endif
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:


"Cambiar la apariencia de todo si estoy en modo insertar (un poco distinto por el esquema de color ) --------- {{{
augroup linea
    autocmd!
    autocmd InsertEnter * highlight CursorLine ctermbg=53     guibg=#5f005f
    autocmd InsertLeave * highlight CursorLine ctermbg=235    guibg=#262626
augroup END
"}}}
