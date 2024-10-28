return {
    "epwalsh/obsidian.nvim",
    opts = {
        workspaces = {
            {
                name = "harro-docs",
                path = "~/Harro-docs",
            },
        },
        version = "*",
        lazy = true,
        ft = "markdown",
        config = function()
            require("obsidian").setup({
                ui = { enable = false },
            })
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            workspaces = {
                {
                    name = "harro-docs",
                    path = "~/Harro-docs",
                },
            },
        },
    },
}
