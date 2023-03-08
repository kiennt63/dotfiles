require 'lspconfig'.dockerls.setup ({
    on_attach = ON_ATTACH,
    filetypes = {
        "DOCKERFILE", "dockerfile"
    }
})
