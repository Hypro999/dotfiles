-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." }
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:append(lazypath)

-- Setup lazy.nvim
require("lazy").setup {
    rocks = {
        enabled = false
    },
    spec = {
        -- Essential
        { "tpope/vim-surround" },
        { "tpope/vim-repeat" },
        {
            "wesQ3/vim-windowswap",
            config = function()
                vim.g.windowswap_map_keys = 0
                vim.keymap.set("n", "<leader>wy", vim.fn["WindowSwap#MarkWindowSwap"])
                vim.keymap.set("n", "<leader>wp", vim.fn["WindowSwap#DoWindowSwap"])
                vim.keymap.set("n", "<leader>ww", vim.fn["WindowSwap#EasyWindowSwap"])
            end
        },

        -- Treesitter
        {
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require("nvim-treesitter.configs").setup {
                    ensure_installed = {
                        "c", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc",
                        "json", "yaml", "xml",
                        "python", "java", "go", "haskell",
                        "html", "css", "scss", "javascript", "typescript"
                    },
                    auto_install = true,
                    highlight = { enable = true },
                    indent = { enable = true },
                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            init_selection = "<leader>s",
                            node_incremental = "[n",
                            scope_incremental = "[s",
                            node_decremental = "]n"
                        }
                    }
                }
            end
        },
        {
            "nvim-treesitter/nvim-treesitter-context",
            config = function()
                local context = require("treesitter-context")
                vim.keymap.set("n", "<leader>-", context.toggle)
            end
        },

        -- Navigation
        {
            "nvim-telescope/telescope.nvim",
            config = function()
                local builtin = require("telescope.builtin")
                vim.keymap.set("n", "<leader>ff", builtin.find_files)
                vim.keymap.set("n", "<leader>fg", builtin.live_grep)
                vim.keymap.set("n", "<leader>fb", builtin.buffers)
                vim.keymap.set("n", "<leader>fh", builtin.help_tags)
            end,
            dependencies = { "nvim-lua/plenary.nvim" }
        },

        -- Git
        { "tpope/vim-fugitive" },

        -- UI
        {
            "rebelot/kanagawa.nvim",
            config = function()
                vim.cmd.colorscheme("kanagawa")
            end
        },
        {
             "nvim-lualine/lualine.nvim",
             config = function()
                require("lualine").setup {
                    tabline = {
                        lualine_a = { "buffers" },
                        lualine_z = { "tabs" }
                    },
                    sections = {
                        lualine_a = { "mode" },
                        lualine_b = { "branch", "diff" },
                        lualine_c = { },
                        lualine_x = { "filename" },
                        lualine_y = { "filetype" },
                        lualine_z = { "location" }
                    }
                }
             end,
             dependencies = { "nvim-tree/nvim-web-devicons" }
        }
    }
}
