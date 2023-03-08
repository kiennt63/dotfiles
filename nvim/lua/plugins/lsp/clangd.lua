require 'lspconfig'.clangd.setup {
    on_attach = ON_ATTACH,
    filetypes = {
        "c", "cpp", "objc", "objcpp", "cuda"
    }
}
