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
        indent = { enable = false },
    })
    end
}

nv_tree['nvim-treesitter/nvim-treesitter-context'] = {
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    config = function()
        require("treesitter-context").setup()
        vim.keymap.set("n", "[c", function()
            require("treesitter-context").go_to_context(vim.v.count1)
        end, { silent = true })
    end
}


return nv_tree

