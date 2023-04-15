local Color, c, Group, g, s = require('colorbuddy').setup()
local v = vim

vim.cmd [[highlight GitSignsAdd guifg=green]]

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#949494 gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append({ trail = '⋅', extends = '⟩', precedes = '⟨' })
require("indent_blankline").setup {
    char = "▏",
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
}
v.g.colors_name = 'colorbuild'

local palette = {
  white   = { gui='#cccccc', cterm=0 },
  whiter  = { gui='#e5e5e5', cterm=0 },
  whitest = { gui='#ffffff', cterm=0 },
  light =   { gui='#f1f1f1', cterm=0 },
  grey    = { gui='#949494', cterm=246 },
  dark    = { gui='#767676', cterm=243 },
  darker  = { gui='#e5e5e5', cterm=240 },
  darkest = { gui='#000000', cterm=238 },
  base    = { gui='#262626', cterm=235 },
  black   = { gui='#1c1c1c', cterm=234 },
  backgnd = { gui='#121212', cterm=233 },
  base3 =   { gui='#fdf6e3', cterm=233 },

  green  = { gui='#00ff00', cterm=085 }, -- darkgreen
  cactus  = { gui='#5f875f', cterm=065 }, -- darkgreen
  grass   = { gui='#87af87', cterm=108 }, -- limegreen
  fruit   = { gui='#d787af', cterm=175 }, -- coralpink
  brick   = { gui='#875f5f', cterm=095 }, -- brickpink
  purple  = { gui='#8787af', cterm=103 },
  cyan    = { gui='#87afd7', cterm=110 },
  red     = { gui='#d75f5f', cterm=167 },
  orange  = { gui='#d7875f', cterm=173 },
  brown   = { gui='#af875f', cterm=137 },
  blue    = { gui='#5f87af', cterm=067 },
}

-- initialize all colors from palette
for key, value in pairs(palette) do
  Color.new(key, value.gui)
end

-- EDITOR BASICS

Group.new('Header',       c.black,   c.white,  s.none)
Group.new('Normal',       c.black,   c.whitest,  s.none)
Group.new('Noise',        c.dark,    c.none,  s.none)
Group.new('Comment',      c.gray,  c.none,  s.none)
Group.new('NonText',      c.darkest, c.none,  s.none)

Group.new('Error',        c.red,     c.none,  s.none)
Group.new('Special',      c.blue,  c.none,  s.none)
Group.new('String',       c.cactus, c.none,  s.none)
Group.new('Title',        c.cyan,    c.none,  s.none)
Group.new('Todo',         c.fruit,   c.none,  s.none)
Group.new('User1',        c.brown,   c.none,  s.none)
Group.new('User2',        c.blue,    c.none,  s.none)
Group.new('User3',        c.brick,   c.none,  s.none)
Group.new('Warning',      c.orange,  c.none,  s.none)

Group.new('DiffAdd',      c.cactus,  c.none,  s.none)
Group.new('DiffAdded',    c.cactus,  c.none,  s.none)
Group.new('DiffChange',   c.brown,   c.none,  s.none)
Group.new('DiffDelete',   c.brick,   c.none,  s.none)
Group.new('DiffLine',     c.darker,  c.none,  s.underline)
Group.new('DiffRemoved',  c.brick,   c.none,  s.none)
Group.new('DiffText',     c.brown,   c.none,  s.none)

Group.new('@variable',     c.none,   c.none,  s.none)

Group.new('SpellBad',     c.red,     c.none,  s.undercurl)
Group.new('SpellCap',     c.orange,  c.none,  s.undercurl)
Group.new('SpellLocal',   c.brown,   c.none,  s.undercurl)
Group.new('SpellRare',    c.blue,    c.none,  s.undercurl)

Group.new('IncSearch',    c.none,    c.none,  s.reverse)
Group.new('MatchParen',   c.red,    c.none,  s.none)
Group.new('Pmenu',        c.none, c.whiter, s.none)
Group.new('PmenuSel',     c.whitest,   c.black, s.none)
Group.new('PmenuThumb',   c.brown,   c.black, s.none)  -- not sure what this is
Group.new('Search',       c.fruit,   c.none,  s.underline)
Group.new('StatusLine',   c.none,   c.white, s.none)
Group.new('StatusLineNC', c.black,   c.whiter, s.none)
Group.new('URI',          c.cactus,  c.none,  s.underline)
Group.new('Visual',       c.none,    c.white,  s.none)
Group.new('VisualNOS',    c.none,    c.base,  s.none)
Group.new('WildMenu',     c.fruit,   c.base,  s.none)

Group.new('CursorLine',  c.none   , c.light,  s.none)
Group.new('CursorLineNr',  c.black   , c.none,  s.bold)
Group.new('LineNr',  c.gray   , c.none,  s.none)
Group.new('TabLine',  c.red   , c.blue,  s.none)
Group.new('TabLineFill',  c.purple   , c.light,  s.none)
Group.new('TabLineSel',   c.purple   , c.grass,  s.none)

Group.new('Conditional',  c.none, c.none,  s.bold)
Group.new('Exception',    c.none, c.none,  s.bold)
Group.new('Include',      c.none, c.none,  s.bold)
Group.new('Keyword',      c.none, c.none,  s.bold)
Group.new('Macro',        c.none, c.none,  s.bold)
Group.new('Operator',     c.none, c.none,  s.bold)
Group.new('PreProc',      c.none, c.none,  s.bold)
Group.new('Repeat',       c.none, c.none,  s.bold)
Group.new('StorageClass', c.none, c.none,  s.bold)
Group.new('Constant',    c.none, c.none,  s.none)
Group.new('Number',      c.none, c.none,  s.none)
Group.new('Delimiter',   c.none, c.none,  s.bold)
Group.new('Function',    c.blue, c.none,  s.bold)
Group.new('Statement',   c.none, c.none,  s.bold)
Group.new('Type',        c.darkest, c.none,  s.none)
Group.new('TypeDef',     c.none, c.none,  s.bold)
Group.new('Structure',   c.none, c.none,  s.bold)
Group.new('Identifier',   c.blue, c.none,  s.bold)
Group.new('@function.builtin',   c.blue, c.none,  s.bold)
Group.new('pythonoperator',   c.none, c.none,  s.bold)

-- LINKS
-- USER INTERFACE
Group.link('ErrorMsg',      g.Error)
Group.link('ModeMsg',       g.Normal)
Group.link('MoreMsg',       g.Normal)
Group.link('Question',      g.Warning)
Group.link('WarningMsg',    g.Warning)
Group.link('HealthSuccess', g.String)

Group.link('ColorColumn',  g.CursorLine)
Group.link('EndOfBuffer',  g.NonText)
Group.link('FoldColumn',   g.LineNr)
Group.link('Folded',       g.NonText)
Group.link('QFLineNr',     g.LineNr)
Group.link('SignColumn',   g.LineNr)
Group.link('VertSplit',    g.NonText)
Group.link('Whitespace',   g.NonText)

Group.link('NormalFloat',  g.Normal)

Group.link('NvimInternalError', g.Error)
Group.link('FloatBorder',  g.NonText)

-- PLUGIN SPECIFIC

if vim.g.cactusbuddy_express_line_enabled then
  require 'statusline'
end

Group.new('DiagnosticUnderlineError', c.none, c.none, s.underline, c.red)
Group.new('DiagnosticUnderlineWarn',  c.none, c.none, s.underline, c.orange)
Group.new('DiagnosticUnderlineHint',  c.none, c.none, s.underline)
Group.new('DiagnosticUnderlineInfo',  c.none, c.none, s.underline)

Group.link('DiagnosticError',       g.Error)
Group.link('DiagnosticWarn',        g.Warning)
Group.link('DiagnosticHint',        g.Comment)
Group.link('DiagnosticInfo',        g.Comment)

Group.link('PackerHash',            g.Noise)

Group.link('GitSignsAdd',           g.NonText)
Group.link('GitSignsChange',        g.NonText)
Group.link('GitSignsDelete',        g.NonText)

Group.link('NvimTreeExecFile',      g.User1)
Group.link('NvimTreeGitDeleted',    g.Noise)
Group.link('NvimTreeGitDirty',      g.Noise)
Group.link('NvimTreeGitIgnored',    g.Noise)
Group.link('NvimTreeGitMerge',      g.Warning)
Group.link('NvimTreeGitNew',        g.Noise)
Group.link('NvimTreeGitRenamed',    g.Noise)
Group.link('NvimTreeGitStaged',     g.Noise)
Group.link('NvimTreeImageFile',     g.Noise)
Group.link('NvimTreeIndentMarker',  g.String)
Group.link('NvimTreeRootFolder',    g.Noise)
Group.link('NvimTreeSpecialFile',   g.Noise)
Group.link('NvimTreeSymlink',       g.User2)
Group.link('NvimTreeWindowPicker',  g.PmenuThumb)

Group.link('TelescopeBorder',       g.Noise)
Group.link('TelescopeMatching',     g.User1)
Group.link('LspInlayHint',          g.NonText)

Group.link('jsonKeyword',          g.String)
