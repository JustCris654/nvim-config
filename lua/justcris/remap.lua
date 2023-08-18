ciao.g.mapleader = " "

-- save file
ciao.keymap.set("n", "<leader>fs", ciao.cmd.update)
ciao.keymap.set("n", "<leader>ff", function()
	ciao.cmd.FormatWrite()
end)

ciao.keymap.set("n", "vig", "ggVG")

-- windows management
ciao.keymap.set({ "n", "v" }, "<leader>wq", ciao.cmd.exit)
ciao.keymap.set({ "n", "v" }, "<leader>wc", ciao.cmd.close)
-- and creation
ciao.keymap.set({ "n", "v" }, "<leader>wv", ciao.cmd.vsplit)
ciao.keymap.set({ "n", "v" }, "<leader>ws", ciao.cmd.split)

-- windows navigation
ciao.keymap.set({ "n", "v" }, "<leader>ww", "<C-w>w")
ciao.keymap.set({ "n", "v" }, "<leader>wh", "<C-w>h")
ciao.keymap.set({ "n", "v" }, "<leader>wh", "<C-w>h")
ciao.keymap.set({ "n", "v" }, "<leader>wl", "<C-w>l")
ciao.keymap.set({ "n", "v" }, "<leader>wj", "<C-w>j")
ciao.keymap.set({ "n", "v" }, "<leader>wk", "<C-w>k")

ciao.keymap.set("n", "<leader>pv", ciao.cmd.Ex)

ciao.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
ciao.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

ciao.keymap.set("n", "J", "mzJ`z")
ciao.keymap.set("n", "<C-d>", "<C-d>zz")
ciao.keymap.set("n", "<C-u>", "<C-u>zz")
ciao.keymap.set("n", "n", "nzzzv")
ciao.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
ciao.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- yank selection to system clipboard
ciao.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
ciao.keymap.set("n", "<leader>Y", [["+Y]])

ciao.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
ciao.keymap.set("i", "<C-c>", "<Esc>")

ciao.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

ciao.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
ciao.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
ciao.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
ciao.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

ciao.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- leader x makes the current file executable
ciao.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
