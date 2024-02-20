local autopairs = {}

autopairs['windwp/nvim-autopairs'] = {
    event = "InsertEnter",
    opts = {
    }, -- this is equalent to setup({}) function
    config = require('modules.configs.autopairs')
}


return autopairs
