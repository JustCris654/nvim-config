vim.g.mapleader = " "

-- save file
vim.keymap.set("n", "<leader>fs", vim.cmd.update)
vim.keymap.set("n", "<leader>ff", function()
    vim.lsp.buf.format()
    vim.cmd.update()
end)

vim.keymap.set("n", "vig", "ggVG")

-- windows management
vim.keymap.set({ "n", "v" }, "<leader>wq", vim.cmd.exit)
vim.keymap.set({ "n", "v" }, "<leader>wc", vim.cmd.close)
-- and creation
vim.keymap.set({ "n", "v" }, "<leader>wv", vim.cmd.vsplit)
vim.keymap.set({ "n", "v" }, "<leader>ws", vim.cmd.split)

-- windows navigation
vim.keymap.set({ "n", "v" }, "<leader>ww", "<C-w>w")
vim.keymap.set({ "n", "v" }, "<leader>wh", "<C-w>h")
vim.keymap.set({ "n", "v" }, "<leader>wh", "<C-w>h")
vim.keymap.set({ "n", "v" }, "<leader>wl", "<C-w>l")
vim.keymap.set({ "n", "v" }, "<leader>wj", "<C-w>j")
vim.keymap.set({ "n", "v" }, "<leader>wk", "<C-w>k")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- yank selection to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- leader x makes the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
