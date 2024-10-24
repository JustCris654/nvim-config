vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- save file
vim.keymap.set("n", "<leader>fs", vim.cmd.update)
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- windows management
vim.keymap.set({ "n", "v" }, "<leader>wq", vim.cmd.exit)
vim.keymap.set({ "n", "v" }, "<leader>wc", vim.cmd.close)
-- and creation
vim.keymap.set({ "n", "v" }, "<leader>wv", vim.cmd.vsplit)
vim.keymap.set({ "n", "v" }, "<leader>ws", vim.cmd.split)

-- windows navigation
vim.keymap.set({ "n", "v" }, "<leader>ww", "<C-w>w")
vim.keymap.set({ "n", "v" }, "<leader>wh", "<C-w>h")
vim.keymap.set({ "n", "v" }, "<leader>wl", "<C-w>l")
vim.keymap.set({ "n", "v" }, "<leader>wj", "<C-w>j")
vim.keymap.set({ "n", "v" }, "<leader>wk", "<C-w>k")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")
vim.keymap.set("n", "vig", "ggVG")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-K>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-J>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
