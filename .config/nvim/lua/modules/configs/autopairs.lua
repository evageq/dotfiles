return function()
    require('nvim-autopairs').setup({
        enable_check_bracket_line = true
    })

    local Rule = require('nvim-autopairs.rule')
    local npairs = require('nvim-autopairs')
    local cond = require('nvim-autopairs.conds')

    require("nvim-autopairs").get_rules("`")[1]:with_pair(function(opts)
        if vim.bo.filetype == 'verilog' then
            return false
        else
            return true
        end
    end)
end
