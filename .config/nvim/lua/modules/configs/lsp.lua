return function()
    local lsp= require('lsp-zero')
    lsp.extend_lspconfig()

    lsp.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp.default_keymaps({buffer = bufnr})
    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
        -- Replace the language servers listed here 
        -- with the ones you want to install
        ensure_installed = {'pyright',
                            'clangd',
                            'cmake',
                            'texlab',
                            'lua_ls',
                            'marksman',
                            'robotframework_ls',
                            'yamlls',
                            'bashls',
                            'svlangserver'},
        handlers = {
            lsp.default_setup,
        },
    })

    -- deprecated
    --lsp.nvim_workspace()


    local cmp = require('cmp')
    local cmp_select = {behavior = cmp.SelectBehavior.Select}
    local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    })

    -- disable completion in comments
    cmp.setup({
        enabled = function()
            local context = require 'cmp.config.context'
            -- keep command mode completion enabled when cursor is in a comment
            if vim.api.nvim_get_mode().mode == 'c' then
                return true
            else
            return not context.in_treesitter_capture("comment")
                  and not context.in_syntax_group("Comment")
            end
        end
    })

    -- Invoke completion menu manually
    cmp.setup({
        completion = {
            autocomplete = false
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-Space>'] = cmp.mapping.complete(),
        })
    })

    lsp.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false, noremap = true, silent = true}

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)


        --vim.keymap.set("gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', opts)
    end)

    --scope is rigged  ???
    lsp.set_sign_icons({
        error = "",
        warn = "",
        hint = "",
        info = "",
    })


    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
    })





    lsp.setup()
end
