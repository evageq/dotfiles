return function()
    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        },
        pip = {
            ---@since 1.0.0
            -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
            upgrade_pip = true,
        }
    })
end
