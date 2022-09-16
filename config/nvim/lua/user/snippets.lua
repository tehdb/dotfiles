local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
  return
end

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")


ls.snippets = {

  typescript = {

    s({ trig = "xlg", name="console.log" }, {
      t("console.log(`>>> "), 
      i(1), 
      t("`)")
    }),

    s({ trig = "xaf", name="() => {}" }, {
      t("() => {"),
      t(""), i(1),
      t("}")
    }),

    s({ trig = "xif", name="() => " }, {
      t("() => "), i(1), 
    }),

    -- jest

    -- s({ trig = "xjdesc", name="describe" }, {
    --   t("describe(""") => {"),
    --   t(""), i(1),
    --   t("}")
    -- }),
  }
}


ls.add_snippets("typescript", {
    s({ trig = "xlg", name="console.log" }, {
      t("console.log(`>>> "), 
      i(1), 
      t("`)")
    }),

})
