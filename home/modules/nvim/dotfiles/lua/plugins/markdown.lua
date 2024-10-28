return {
    {
        "MeanderingProgrammer/markdown.nvim",
        main = "render-markdown",
        opts = {},
        name = "render-markdown",
        dependencies = {
            "latex-lsp/tree-sitter-latex",
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            vim.keymap.set(
                "n",
                "<leader>mp",
                ":MarkdownPreviewToggle<CR>",
                { desc = "Markdown Preview", silent = true }
            )
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
}
