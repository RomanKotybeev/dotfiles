local Color, c, Group, g, s = require('colorbuddy').setup()

vim.g.colors_name = 'basic'

local palette = {
    basebg = { gui='#0d1117', cterm=0 },
    basefg = { gui='#cacaca', cterm=0 },
    darkest = { gui='#000000', cterm=0 },
    gray = { gui='#888888', cterm=0 },
    mediumgray = {gui='#232323', cterm=0},
    lightgray  = { gui='#161d27', cterm=0 },
    yellow = { gui='#888800', cterm=0 },
    redish  = { gui='#800000', cterm=0 },
    blue    = { gui='#5f87af', cterm=067 },
    green    = { gui='#00b300', cterm=067 },
}

for key, value in pairs(palette) do
  Color.new(key, value.gui)
end

--Group.new('Special', c.blue,  c.none,  s.none)
Group.new('Normal', c.basefg, c.basebg, s.none)
Group.new('NonText', c.darkest, c.none,  s.none)
Group.new('String', c.blue, c.none, s.none)
Group.new('Comment', c.gray, c.none, s.none)
Group.new('MatchParen', c.yellow, c.none, s.none)
Group.new('Pmenu', c.none, c.lightgray, s.none)
Group.new('PmenuSel', c.none, c.gray, s.none)
Group.new('StatusLine', c.none, c.lightgray, s.none)
Group.new('CursorLine', c.none, c.lightgray, s.none)
Group.new('CursorLineNr', c.none, c.lightgray, s.bold)
Group.new('LineNr',  c.gray, c.none, s.none)
Group.new('Visual', c.none, c.mediumgray, s.none)
Group.new('TabLineFill',  c.basefg, c.mediumgray,  s.none)
Group.new('DiagnosticError',  c.red, c.none,  s.none)
Group.new('GitSignsAdd',  c.green, c.none,  s.bold)
Group.new('GitSignsChange',  c.orange, c.none,  s.bold)
Group.new('GitSignsDelete',  c.purple, c.none,  s.bold)
Group.new('IndentBlanklineChar',  c.mediumgray, c.none,  s.none)
Group.new('Function',  c.none, c.none,  s.none)
Group.new('NormalFloat',  c.none, c.white,  s.bold)
Group.new('Constant',  c.yellow, c.none,  s.bold)
Group.new('@variable',  c.none, c.none,  s.none)
Group.new('@constructor',  c.none, c.none,  s.none)
Group.new('@punctuation.bracket',  c.none, c.none,  s.none)
Group.new('@constant',  c.none, c.none,  s.bold)
Group.new('@define',  c.none, c.none,  s.bold)

Group.new('Conditional',  c.none, c.none,  s.bold)
Group.new('Number',      c.blue, c.none,  s.none)
Group.new('Special',      c.yellow, c.none,  s.bold)
Group.new('SpecialChar',      c.yellow, c.none,  s.bold)

Group.link('SignColumn', g.LineNr)
Group.link('Keyword', g.Conditional)
Group.link('PreProc', g.Conditional)
Group.link('Statement', g.Conditional)
Group.link('Include', g.Conditional)
Group.link('Type', g.Conditional)
Group.link('Repeat', g.Conditional)
Group.link('Operator', g.Conditional)
Group.link('Structure', g.Conditional)
Group.link('StorageClass', g.Conditional)
Group.link('Boolean', g.Conditional)
Group.link('Identifier', g.Conditional)
Group.link('Character', g.String)
Group.link('DiagnosticHint', g.Comment)
Group.link('DiagnosticInfo', g.Comment)

-- Python
Group.link('pythonoperator', g.Conditional)
Group.link('pythonDecorator', g.Conditional)

-- C/C++
Group.link('cType', g.Conditional)
