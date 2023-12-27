local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader><leader>", telescope.git_files, {})

vim.keymap.set("n", "<leader>pf", telescope.find_files, {})
vim.keymap.set("n", "<leader>sp", function()
	telescope.grep_string({
		search = vim.fn.input("Grep > "),
	})
end)
vim.keymap.set("n", "<leader>sf", telescope.live_grep, {})

vim.keymap.set("n", "<leader>bi", telescope.buffers, {})

vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})
