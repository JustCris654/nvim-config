local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader><leader>', builtin.git_files, {})

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sp', function()
    builtin.grep_string({
        search = vim.fn.input("Grep > ")
    })
end)
vim.keymap.set('n', '<leader>sf', builtin.live_grep, {})

vim.keymap.set('n', '<leader>bi', builtin.buffers, {})

vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
