return {
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
    },
}
