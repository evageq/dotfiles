local lsp = {}

lsp['mason-org/mason.nvim'] = {
    config = require('modules.configs.mason')
}

lsp['neovim/nvim-lspconfig'] = {
}

return lsp
