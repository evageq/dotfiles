vim.lsp.config('clangd',{
    cmd = {'clangd'},
    init_options = {
        fallbackFlags = { '--std=c23', '--language=c' }
    },
})

vim.lsp.enable('clangd')
