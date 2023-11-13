local opt = vim.opt
local g = vim.g


----------------------------- globals -------------------------------
g.mapleader = " "


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



require("core.mappings")

local load_pack = function()
	require("core.pack")
end

load_pack()




