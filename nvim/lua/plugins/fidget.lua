local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
    return
end

fidget.setup
{

}

-- highlight link FidgetTitle Variable
vim.api.nvim_set_hl(0, "FidgetTitle", { link = "Cmp" })

