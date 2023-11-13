local identline = {}

identline['lukas-reineke/indent-blankline.nvim'] = {
    main = 'ibl',
    init = function() vim.api.nvim_set_hl(0, "ScopeBlue", { fg = "#61AFEF" }) end,

    opts = {
        indent = { 
           char = "│"
           --char = "╎",
        },
        scope = {
            enabled = true,
            highlight = "ScopeBlue",
        },
    }
}

return identline
