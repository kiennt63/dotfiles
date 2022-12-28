local lspconfig = require 'lspconfig'
lspconfig.ccls.setup {
    init_options = {
        index = {
            threads = 2;
        };
    },
    on_attach = ON_ATTACH
}
