local lsp = {}


lsp['williamboman/mason.nvim'] = {

}

lsp['williamboman/mason-lspconfig.nvim'] = {
    
}


lsp['neovim/nvim-lspconfig'] = {
    
}

lsp['hrsh7th/cmp-nvim-lsp'] = {

}

lsp['hrsh7th/nvim-cmp'] = {

}

--[[
lsp['L3MON4D3/LuaSnip'] = {

}
-]]

lsp['VonHeikemen/lsp-zero.nvim'] = {
    branch = 'v3.x',
    config = require('modules.configs.lsp')
}

return lsp
