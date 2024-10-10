-- local signature_setup = {
--     log_path = vim.fn.expand('$HOME') .. '/tmp/sig.log',
--     debug = true,
--     hint_enable = false,
--     handler_opts = { border = 'rounded' },
--     max_width = 30,
--     close_timeout = 1000,
-- }

local util = require 'lspconfig/util'

local on_attach = function(_, bufnr)
    -- require 'lsp_signature'.on_attach(signature_setup, bufnr)

    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    local imap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end
        vim.keymap.set('i', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>la', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    imap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Format code
    nmap('<space>lf', function()
        vim.lsp.buf.format { async = true }
    end, 'Format')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
    clangd = {
        filetypes = {
            'c',
            'cpp',
            'objc',
            'objcpp',
            'cuda',
        },
        -- capabilities = {
        --     offsetEncoding = { 'utf-16' },
        -- },
        -- root_dir = util.root_pattern(
        --     '.clangd',
        --     '.clang-tidy',
        --     '.clang-format',
        --     'compile_commands.json',
        --     'compile_flags.txt',
        --     'configure.ac',
        --     '.git',
        --     'build',
        --     'build_x64_linux',
        --     'build_aarch64_linux'
        -- ),
        -- root_dir = {
        --     '.clangd',
        --     '.clang-tidy',
        --     '.clang-format',
        --     'compile_commands.json',
        --     'compile_flags.txt',
        --     'configure.ac',
        --     '.git',
        --     'build',
        --     'build_x64_linux',
        --     'build_aarch64_linux',
        -- },
        cmd = {
            'clangd',
            '--background-index',
            '--offset-encoding=utf-16',
            '--clang-tidy',
            '--header-insertion=iwyu',
            '--completion-style=detailed',
            '--function-arg-placeholders',
            '--fallback-style=llvm',
            -- '--query-driver=/usr/local/cuda/bin/nvcc',
            -- '--query-driver=/usr/bin/c++',
        },
        init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
        },
    },

    glsl_analyzer = {},

    pyright = {},
    -- rust_analyzer = {
    --     ['rust-analyzer'] = {
    --         cargo = {
    --             allFeatures = true,
    --         },
    --         diagnostics = {
    --             enable = true;
    --         }
    --     },
    --     filetypes = 'rust'
    -- },
    -- tsserver = {},
    -- html = { filetypes = { 'html', 'twig', 'hbs'} },

    lua_ls = {
        Lua = {
            format = {
                enable = true,
                -- Put format options here
                -- NOTE: the value should be String!
                indent_style = 'space',
                indent_size = '4',
                defaultConfig = {
                    indent_style = 'space',
                    indent_size = '4',
                },
            },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        },
    },
    bashls = {},
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- capabilities.offsetEncoding = { 'utf-16' }
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { 'utf-16' }

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    -- ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
            cmd = (servers[server_name] or {}).cmd,
            root_dir = (servers[server_name] or {}).root_dir,
        }
    end,
}

require('lspconfig').cmake.setup {
    on_attach = on_attach,
    root_dir = util.root_pattern('build', 'build_x64_linux', 'build_aarch64_linux'),
    settings = {
        cmake = {
            format = {
                enable = true, -- Enables formatting
            },
        },
    },
}

require('clangd_extensions').setup {
    inlay_hints = {
        inline = vim.fn.has 'nvim-0.10' == 1,
        -- Options other than `highlight' and `priority' only work
        -- if `inline' is disabled
        -- Only show inlay hints for the current line
        only_current_line = false,
        -- Event which triggers a refresh of the inlay hints.
        -- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
        -- not that this may cause  higher CPU usage.
        -- This option is only respected when only_current_line and
        -- autoSetHints both are true.
        only_current_line_autocmd = { 'CursorHold' },
        -- whether to show parameter hints with the inlay hints or not
        show_parameter_hints = true,
        -- prefix for parameter hints
        parameter_hints_prefix = '<- ',
        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = '=> ',
        -- whether to align to the length of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- whether to align to the extreme right or not
        right_align = false,
        -- padding from the right if right_align is true
        right_align_padding = 7,
        -- The color of the hints
        highlight = 'Comment',
        -- The highlight group priority for extmark
        priority = 100,
    },
    ast = {
        -- These are unicode, should be available in any font
        -- role_icons = {
        --     type = '🄣',
        --     declaration = '🄓',
        --     expression = '🄔',
        --     statement = ';',
        --     specifier = '🄢',
        --     ['template argument'] = '🆃',
        -- },
        -- kind_icons = {
        --     Compound = '🄲',
        --     Recovery = '🅁',
        --     TranslationUnit = '🅄',
        --     PackExpansion = '🄿',
        --     TemplateTypeParm = '🅃',
        --     TemplateTemplateParm = '🅃',
        --     TemplateParamObject = '🅃',
        -- },
        -- These require codicons (https://github.com/microsoft/vscode-codicons)
        role_icons = {
            type = '',
            declaration = '',
            expression = '',
            specifier = '',
            statement = '',
            ['template argument'] = '',
        },

        kind_icons = {
            Compound = '',
            Recovery = '',
            TranslationUnit = '',
            PackExpansion = '',
            TemplateTypeParm = '',
            TemplateTemplateParm = '',
            TemplateParamObject = '',
        },

        highlights = {
            detail = 'Comment',
        },
    },
    memory_usage = {
        border = 'none',
    },
    symbol_info = {
        border = 'none',
    },
}

local signs = { Error = '', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- vim.diagnostic.config({
--     virtual_text = {
--         prefix = '●', -- Could be '●', '▎', 'x'
--     }
-- })

-- vim.diagnostic.config {
--     virtual_text = {
--         prefix = '', -- ■ 
--         suffix = '',
--         format = function (diagnostic)
--             return '● ' .. diagnostic.message .. ' '
--         end,
--     },
-- }

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = {
        severity = vim.diagnostic.severity.WARN,
    },
    virtual_text = {
        severity = vim.diagnostic.severity.ERROR,
        prefix = '', -- ■ 
        suffix = '',
        format = function(diagnostic)
            return '● ' .. diagnostic.message .. ' '
        end,
    },
})

-- vim.o.updatetime = 250
-- vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--     group = vim.api.nvim_create_augroup('float_diagnostic', { clear = true }),
--     callback = function ()
--         vim.diagnostic.open_float(nil, { focus = false })
--     end
-- })

-- require('mason-null-ls').setup({
--     ensure_installed = { 'black' }
-- })
