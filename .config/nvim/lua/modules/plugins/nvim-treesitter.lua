local nv_tree = {}

nv_tree['nvim-treesitter/nvim-treesitter'] = {
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
    config = function()
        require('nvim-treesitter').install { 'rust', 'javascript', 'zig', "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" }
    end
}

nv_tree['nvim-treesitter/nvim-treesitter-context'] = {
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("treesitter-context").setup()
        vim.keymap.set("n", "[c", function()
            require("treesitter-context").go_to_context(vim.v.count1)
        end, { silent = true })
    end
}


return nv_tree
