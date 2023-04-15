local ls = require "luasnip"
local types = require "luasnip.util.types"
local s = ls.snippet
local sn = ls.snippet_node
local node = ls.snippet_node
local t= ls.text_node
local i= ls.insert_node
local f= ls.function_node
local c= ls.choice_node
local d= ls.dynamic_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt


ls.add_snippets('all', {
  s("cl", {
      t("class "),
      i(1, "Name"),
      t(":"),
      t({"", '\t""""'}),
      i(2, "Docstring"),
      t('"""'),
      i(0),
  }),
  s("class", {
      t("class "),
      i(1, "Name"),
      t(":"),
      t({"", "\t"}),
      t('"""'),
      i(2, "Docstring"),
      t({"", ""}),
      t({"", "\tAttributes:"}),
      t({"", '\t"""'}),
      t({"", "\t"}),
      t("def __init__(self"),
      c(3, {
          sn(nil, {
              t(", "),
              r(1, ""),
              t("):")
          }),
          t("):"),
      }),
      t({"", "\t\t"}),
      i(0),
  }),
  s("init", {
      t("def __init__(self"),
      c(1, {
          sn(nil, {
              t(", "),
              r(1, ""),
              t("):")
          }),
          t("):"),
      }),
      t({"", "\t"}),
      i(2),
  }),
  s("fn", {
      t("def "),
      i(1, "fname"),
      t("("),
      i(2, "args"),
      t(')'),
      c(3, {
          sn(nil, {
              t(" -> "),
              r(1, ""),
              t(":")
          }),
          t(":"),
      }),
      t({"", '\t"""'}),
      i(4, "Docstring"),
      t('"""'),
      i(0),
  }),
  s("mt", {
      t("def "),
      i(1, "fname"),
      t("(self"),
      c(2, {
          sn(nil, {
              t(", "),
              r(1, "args"),
              t(")")
          }),
          t(")"),
      }),
      c(3, {
          sn(nil, {
              t(" -> "),
              r(1, ""),
              t(":")
          }),
          t(":"),
      }),
      t({"", '\t"""'}),
      i(4, "Docstring"),
      t('"""'),
      i(0),
  }),
},
    {
        key = 'snips' 
})
