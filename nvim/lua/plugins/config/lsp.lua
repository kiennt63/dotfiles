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

    -- pyright = {},
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

require('lspconfig').pylsp.setup {
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                jedi_completion = {
                    include_params = true,
                },
                jedi_signature_help = { enabled = true },
                pyflakes = { enabled = true },
                pylint = { args = { '--ignore=E501,E231', '-' }, enabled = true, debounce = 200 },
                pylsp_mypy = { enabled = true },
                pycodestyle = {
                    enabled = true,
                    ignore = { 'E501', 'E231', 'W293', 'E266' },
                    maxLineLength = 88,
                },
                autopep8 = {
                    enabled = false,
                },
                yapf = {
                    enabled = false,
                },
                black = {
                    enabled = false,
                },
            },
        },
    },
}

require('clangd_extensions').setup {
    inlay_hints = {
        inline = vim.fn.has 'nvim-0.10' == 1,
        only_current_line = false,
        only_current_line_autocmd = { 'CursorHold' },
        show_parameter_hints = true,
        parameter_hints_prefix = '<- ',
        other_hints_prefix = '=> ',
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = 'Comment',
        priority = 100,
    },
    ast = {
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

-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline = {
--         severity = { min = vim.diagnostic.severity.ERROR },
--     },
--     virtual_text = {
--         severity = { min = vim.diagnostic.severity.ERROR },
--         prefix = '', -- ■ 
--         suffix = '',
--         format = function(diagnostic)
--             return '● ' .. diagnostic.message .. ' '
--         end,
--     },
--     severity_override = function(diagnostic)
--         -- Check for unused variable patterns in the diagnostic message
--         if diagnostic.message:match "local variable '%w+' is assigned to but never used" then
--             return vim.lsp.protocol.DiagnosticSeverity.Hint -- Map to Hint
--         end
--         return diagnostic.severity -- Keep default severity for others
--     end,
-- })

-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline = {
--         severity = { min = vim.diagnostic.severity.ERROR },
--     },
--     virtual_text = {
--         severity = { min = vim.diagnostic.severity.ERROR },
--         prefix = '',
--         suffix = '',
--         format = function(diagnostic)
--             return '● ' .. diagnostic.message .. ' '
--         end,
--     },
--     signs = true,
--     update_in_insert = false,
--     severity = {
--         -- This is the key change
--         ['unused-local'] = vim.diagnostic.severity.HINT,
--     },
-- })

vim.diagnostic.config {
    severity_sort = true,
    underline = {
        severity = { min = vim.diagnostic.severity.ERROR },
    },
    virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR },
        prefix = '',
        suffix = '',
        format = function(diagnostic)
            return '● ' .. diagnostic.message .. ' '
        end,
    },
    float = {
        source = 'always',
    },
    signs = true,
    update_in_insert = false,
    severity = {
        ['unused-local'] = vim.diagnostic.severity.HINT,
    },
}
