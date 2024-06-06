return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            auto_install = true,
            ignore_install = { 'org' },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
