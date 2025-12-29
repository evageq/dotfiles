return function()
    require('rose-pine').setup{
        styles = { transparency = true, italic = false }
    }
	vim.cmd('colorscheme rose-pine-main')
end
