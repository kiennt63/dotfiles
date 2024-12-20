local ls = require 'luasnip'
-- some shorthands...
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local l = ls.l
local rep = require('luasnip.extras').rep
local fmt = require('luasnip.extras.fmt').fmt

local function current_date()
    return os.date '%d-%b-%Y' -- Formats date as "08-Nov-2024"
end

local function relative_filepath()
    local filepath = vim.fn.expand '%:p' -- Get absolute path
    local cwd = vim.fn.getcwd() -- Get current working directory

    -- If filepath starts with cwd, make it relative
    if filepath:sub(1, #cwd) == cwd then
        return filepath:sub(#cwd + 2) -- Remove cwd and leading slash
    else
        return filepath -- Return absolute path if it can't be made relative
    end
end

ls.add_snippets(nil, {
    all = {
        s({
            trig = 'head',
            namr = 'omnivision copyright',
            dscr = 'omnivision copyright',
        }, {
            t {
                '# ****************************************************************************',
                '# *',
                '# * Copyright (c) 2018 OmniVision Technologies, Inc.',
                '# * The material in this file is subject to copyright. It may not',
                '# * be used, copied or transferred by any means without the prior written',
                '# * approval of OmniVision Technologies, Inc.',
                '# *',
                '# * OMNIVISION TECHNOLOGIES, INC. DISCLAIMS ALL WARRANTIES WITH REGARD TO',
                '# * THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND',
                '# * FITNESS, IN NO EVENT SHALL OMNIVISION TECHNOLOGIES, INC. BE LIABLE FOR',
                '# * ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER',
                '# * RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF',
                '# * CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN',
                '# * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.',
                '# *',
                '# ****************************************************************************',
                '# @files      ',
            },
            f(relative_filepath, {}),
            t { '', '# @brief      ' },
            i(1, 'description'),
            t { '', '# @version    ' },
            i(2, '0.1'),
            t { '', '# @date       ' },
            f(current_date, {}),
            t { '', '', '' },
            i(3),
        }),
        s(
            'pycls',
            fmt(
                [[
                    class {}:
                        def __init__(self, {}):
                            {}
                    ]],
                {
                    i(1, 'ClassName'), -- Class name
                    i(2, 'arg1, arg2, arg3'), -- Constructor arguments
                    i(3, fmt('self.{} = {}\n        self.{} = {}\n        self.{} = {}', { i(4, 'arg1'), i(4), i(5, 'arg2'), i(5), i(6, 'arg3'), i(6) })),
                }
            )
        ),

        s('getset', {
            -- Getter
            t '@property',
            t { '', 'def ' },
            i(1, 'attr'),
            t { '(self):' },
            t { '', '    return self.__' },
            f(function(args)
                return args[1][1]
            end, { 1 }),

            -- Setter
            t { '', '', '@' },
            f(function(args)
                return args[1][1]
            end, { 1 }),
            t { '.setter' },
            t { '', 'def ' },
            f(function(args)
                return args[1][1]
            end, { 1 }),
            t { '(self, value):' },
            t { '', '    self.__' },
            f(function(args)
                return args[1][1]
            end, { 1 }),
            t { ' = value' },
        }),
    },
})
