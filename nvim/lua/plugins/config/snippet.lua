local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local rep = require("luasnip.extras").rep

local date = function() return { os.date('%Y-%m-%d') } end

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "guard",
            namr = "C++ Header Guard",
            dscr = "C++ header guard for VinAI repo",
        }, {
            text({  "/*",
                    " * Copyright (c) 2020 - 2021, VinAI. All rights reserved. All information",
                    " * information contained herein is proprietary and confidential to VinAI.",
                    " * Any use, reproduction, or disclosure without the written permission",
                    " * of VinAI is prohibited.",
                    " */",
                    "",
                "#ifndef " }), insert(1, "GUARD_H"), text({ "",
                "#define " }), rep(1), text({ "",
                "",
                "namespace "}), insert(2, "namespace"), text({ "{",
                "",
                ""}),
                insert(0),
                text({"",
                "",
                "} // "}), rep(2), text({ "",
                "",
                "#endif // " }), rep(1), text({ "" })
        }),
    },
})
