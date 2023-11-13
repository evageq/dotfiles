
local fn, api = vim.fn, vim.api
local global = require("core.global")
local vim_path = global.vim_path
local data_dir = global.data_dir
local lazy_path = data_dir .. "lazy/lazy.nvim"
local modules_dir = vim_path .. "/lua/modules"
local user_config_dir = vim_path .. "/lua/user"


local Lazy = {}

local icons = {
	kind = require("modules.utils.icons").get("kind"),
	documents = require("modules.utils.icons").get("documents"),
	ui = require("modules.utils.icons").get("ui"),
	ui_sep = require("modules.utils.icons").get("ui", true),
	misc = require("modules.utils.icons").get("misc"),
}


function Lazy:load_plugins()
	self.modules = {}


	function get_plugin_list()
		local list = {}
		local plugins_list = vim.split(fn.glob(modules_dir .. "/plugins/*.lua"), "\n")
		for _, f in ipairs(plugins_list) do
			list[#list+1] = f:sub(#modules_dir - 6, -1)
		end
		return list
	end

	for _, m in ipairs(get_plugin_list()) do
		local modules = require(m:sub(0, #m-4))
		if type(modules) == "table" then
			for name, conf in pairs(modules) do
				self.modules[#self.modules+1] = vim.tbl_extend("force", { name }, conf)
			end
		end
	end

	-- for disabling plugins
	--[[
	for _, name in ipairs(settings.disabled_plugins) do
		self.modules[#self.modules + 1] = { name, enabled = false }
	end
	--]]
end

function Lazy:load_lazy()
	self:load_plugins()

	if not vim.loop.fs_stat(lazy_path) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazy_path,
		})
	end

	local lazy_settings = {
		root = data_dir .. "lazy",
		ui = {
			-- a number <1 is a percentage., >1 is a fixed size
			size = { width = 0.88, height = 0.8 },
			wrap = true, -- wrap the lines in the ui
			-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
			border = "rounded",
			icons = {
				cmd = icons.misc.Code,
				config = icons.ui.Gear,
				event = icons.kind.Event,
				ft = icons.documents.Files,
				init = icons.misc.ManUp,
				import = icons.documents.Import,
				keys = icons.ui.Keyboard,
				loaded = icons.ui.Check,
				not_loaded = icons.misc.Ghost,
				plugin = icons.ui.Package,
				runtime = icons.misc.Vim,
				source = icons.kind.StaticMethod,
				start = icons.ui.Play,
				list = {
					icons.ui_sep.BigCircle,
					icons.ui_sep.BigUnfilledCircle,
					icons.ui_sep.Square,
					icons.ui_sep.ChevronRight,
				},
			},
		}
	}

	local lazy_settings_test = {}
	vim.opt.rtp:prepend(lazy_path)
	require("lazy").setup(self.modules, lazy_settings_test)
end

Lazy:load_lazy()
