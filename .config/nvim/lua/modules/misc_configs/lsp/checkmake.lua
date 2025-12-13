vim.lsp.config['checkmake'] = {
    cmd = { "checkmake" },
    filetypes = { "make", "Make", "Makefile", "makefile" },
    root_markers = { ".git" },
}
vim.lsp.enable('checkmake')

