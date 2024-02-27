-- require('rose-pine').setup({
--     disable_background = true
-- })
function SetColorScheme(color)
    color = color or "rose-pine"
    vim.o.termguicolors = true
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", {
    --     bg = "none"
    -- })
    -- vim.api.nvim_set_hl(0, "NormalFloat", {
    --     bg = "none"
    -- })
end

SetColorScheme("kanagawa-dragon")
