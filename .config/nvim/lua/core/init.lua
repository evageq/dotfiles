local opt = vim.opt
local g = vim.g

local global = require("core.global")


----------------------------- globals -------------------------------
g.mapleader = " "
g.startify_change_to_dir = 0



----------------------------- options -------------------------------
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.termguicolors = true

opt.backspace="indent,eol,start"


-- indentation
opt.expandtab=true
opt.tabstop=4
opt.shiftwidth=4
opt.autoindent=true
opt.scrolloff=7

opt.swapfile=false

opt.signcolumn = "yes"
opt.splitbelow = false
opt.splitright = true
opt.termguicolors = true
--opt.timeoutlen = 100
opt.undofile = true

local tab_indices_filename = "tab_indices.vim"
local tab_indices_path = global.vim_path .. "/lua/core/" .. tab_indices_filename
vim.cmd('source ' .. tab_indices_path)

function CopyFilePath()
    local filepath = vim.fn.expand('%:p')
    vim.fn.setreg('+', filepath)
    print("File path copied to clipboard: " .. filepath)
end
vim.api.nvim_create_user_command('Cpfp', CopyFilePath, {})

require("core.mappings")

local load_pack = function()
	require("core.pack")
end

load_pack()




