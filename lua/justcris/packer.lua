vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- navigation
    -- use({
    --     "nvim-telescope/telescope.nvim",
    --     tag = "0.1.2",
    --     requires = { { "nvim-lua/plenary.nvim" } },
    -- })
    use { "ibhagwan/fzf-lua",
        -- optional for icon support
        requires = { "nvim-tree/nvim-web-devicons" }
    }

    use({
        "X3eRo0/dired.nvim",
        requires = "MunifTanjim/nui.nvim",
        config = function()
            require("dired").setup({
                path_separator = "/",
                show_banner = false,
                show_hidden = true,
                show_dot_dirs = true,
                show_colors = true,
            })
        end,
    })
    use("elihunter173/dirbuf.nvim")

    -- colorschemes
    use({
        "rose-pine/neovim",
        as = "rose-pine",
    })
    use("tanvirtin/monokai.nvim")
    use("ellisonleao/gruvbox.nvim")

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate",
    })
    use("folke/tokyonight.nvim")
    use("navarasu/onedark.nvim")
    use("rebelot/kanagawa.nvim")
    use("sainnhe/sonokai")
    use("aktersnurra/no-clown-fiesta.nvim")

    -- lsp
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "L3MON4D3/LuaSnip" },
        },
    })
    use("mhartington/formatter.nvim")
    use("RRethy/vim-illuminate")

    -- utilities
    use("mg979/vim-visual-multi")
    use("numToStr/Comment.nvim")
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })
    use("mbbill/undotree")
    use({
        "abecodes/tabout.nvim",
        config = function()
            require("tabout").setup({
                tabkey = "<Tab>",             -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true,            -- shift content if tab out is not possible
                act_as_shift_tab = false,     -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                default_tab = "<C-t>",        -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                default_shift_tab = "<C-d>",  -- reverse shift default action,
                enable_backwards = true,      -- well ...
                completion = true,            -- if the tabkey is used in a completion pum
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = "`", close = "`" },
                    { open = "(", close = ")" },
                    { open = "[", close = "]" },
                    { open = "{", close = "}" },
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {}, -- tabout will ignore these filetypes
            })
        end,
        wants = { "nvim-treesitter" }, -- or require if not used so far
        after = { "nvim-cmp" },        -- if a completion plugin is using tabs load it before
    })

    -- use("tpope/vim-fugitive")

    -- nvim v0.7.2
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })

    use("lewis6991/gitsigns.nvim")

    use({
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = true,      -- show icons in the signs column
            sign_priority = 8, -- sign priority
            -- keywords recognized as todo comments
            keywords = {
                FIX = {
                    icon = " ", -- icon used for the sign, and in search results
                    color = "error", -- can be a hex color, or a named color (see below)
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = { icon = "✅", color = "info" },
                HACK = { icon = "🔥", color = "warning" },
                WARN = { icon = "⚠️", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = "🚀", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = "📝", color = "hint", alt = { "INFO" } },
                TEST = { icon = "🤯", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
            },
            gui_style = {
                fg = "NONE",       -- The gui style to use for the fg highlight group.
                bg = "BOLD",       -- The gui style to use for the bg highlight group.
            },
            merge_keywords = true, -- when true, custom keywords will be merged with the defaults
            -- highlighting of the line containing the todo comment
            -- * before: highlights before the keyword (typically comment characters)
            -- * keyword: highlights of the keyword
            -- * after: highlights after the keyword (todo text)
            highlight = {
                multiline = true,                -- enable multine todo comments
                multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
                multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
                before = "",                     -- "fg" or "bg" or empty
                keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
                after = "fg",                    -- "fg" or "bg" or empty
                pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
                comments_only = true,            -- uses treesitter to match keywords in comments only
                max_line_len = 400,              -- ignore lines longer than this
                exclude = {},                    -- list of file types to exclude highlighting
            },
            -- list of named colors where we try to extract the guifg from the
            -- list of highlight groups or use the hex color if hl not found as a fallback
            colors = {
                error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
                info = { "DiagnosticInfo", "#2563EB" },
                hint = { "DiagnosticHint", "#10B981" },
                default = { "Identifier", "#7C3AED" },
                test = { "Identifier", "#FF00FF" },
            },
            search = {
                command = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                },
                -- regex that will be used to match keywords.
                -- don't replace the (KEYWORDS) placeholder
                pattern = [[\b(KEYWORDS):]], -- ripgrep regex
                -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
            },
        },
    })

    use({
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    })

    use("nvim-tree/nvim-web-devicons")

    -- Remove the `use` here if you're using folke/lazy.nvim.
    use {
        'Exafunction/codeium.vim',
        config = function()
            -- Change '<C-g>' here to any keycode you like.
            vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
            vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        end
    }

    -- use {
    --     "folke/which-key.nvim",
    --     config = function()
    --         vim.o.timeout = true
    --         vim.o.timeoutlen = 300
    --         require("which-key").setup {
    --             -- your configuration comes here
    --             -- or leave it empty to use the default settings
    --             -- refer to the configuration section below
    --         }
    --     end
    -- }
end)
