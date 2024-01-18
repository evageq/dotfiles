local nv_tree = {}

nv_tree['nvim-treesitter/nvim-treesitter'] = {
    build = ":TSUpdate",
    main = 'nvim-treesitter.configs',
    config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    })
    end
}


return nv_tree

