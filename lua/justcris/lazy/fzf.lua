return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({

      })

      -- fzf lua keybindings
      vim.keymap.set("n", "<leader><leader>", require("fzf-lua").git_files, {})
      vim.keymap.set("n", "<leader>pf", require("fzf-lua").files, {})
      vim.keymap.set("n", "<leader>sg", require("fzf-lua").live_grep, {})
      vim.keymap.set("n", "<leader>sp", require("fzf-lua").grep, {})
      vim.keymap.set("n", "<leader>bb", require("fzf-lua").buffers, {})
      vim.keymap.set("n", "<leader>gc", require("fzf-lua").buffers, {})
    end
  }