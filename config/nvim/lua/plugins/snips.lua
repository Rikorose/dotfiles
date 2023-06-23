local ls = require "luasnip"

local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local same = function(index)
  return f(function(args)
    return args[1]
  end, { index })
end

-- Rust
ls.add_snippets("rust", {
  s(
    "modtest",
    fmt(
      [[
      #[cfg(test)]
      mod test {{
          use super::*;
          {}
      }}
    ]],
      i(0)
    )
  ),
  s(
    { trig = "test" },
    fmt(
      [[
    #[test]
    fn {}(){}{{
      {}
    }}
    ]],
      {
        i(1, "testname"),
        c(2, {
          t "",
          t " -> Result<()> ",
        }),
        i(0),
      }
    )
  ),
  s("eq", fmt("assert_eq!({}, {});{}", { i(1), i(2), i(0) })),
  s("enum", {
    t { "#[derive(Debug, PartialEq)]", "enum " },
    i(1, "Name"),
    t { " {", "  " },
    i(0),
    t { "", "}" },
  }),

  s("struct", {
    t { "#[derive(Debug, PartialEq)]", "struct " },
    i(1, "Name"),
    t { " {", "    " },
    i(0),
    t { "", "}" },
  }),
  s("pd", fmt([[println!("{}: {{:?}}", {});]], { same(1), i(1) })),
})

-- Python
ls.add_snippets("python", {
  s(
    "plt",
    fmt(
      [[
    import matplotlib.pyplot as plt

    ]],
      {}
    )
  ),
  s(
    "icecream",
    fmt(
      [[
    from icecream import ic

    ]],
      {}
    )
  ),
  s(
    "icecream-install",
    fmt(
      [[
    from icecream import ic, install
    install()

    ]],
      {}
    )
  ),
  s(
    "ic",
    fmt(
      [[
    ic({})
    ]],
      {
        i(1, "variable"),
      }
    )
  ),
})

-- Latex
ls.add_snippets("tex", {
  s("eq:acm", 
    fmt(
      [[
        \begin{{equation}}
          {}
          \label{{eq:{}}}
        \end{{equation}}
      ]],
    {i(0, "equation"), i(1, "label")})
  ),
  s("eq:split:acm", 
    fmt(
      [[
        \begin{{equation}}
          \begin{{split}}
            {}
            \label{{eq:{}}}
          \end{{split}}
        \end{{equation}}
      ]],
    {i(0, "equation"), i(1, "label")})
  ),
  s("eq:ref", 
    fmt("(\\ref{{eq:{}}}){}", {i(0, "ref"), i(1)})
  ),
  s("Eq:ref", 
    fmt("Eq.~(\\ref{{eq:{}}}){}", {i(0, "ref"), i(1)})
  ),
})

-- snippet movment in insert mode with <ctrl-d> and <ctrl-b>
