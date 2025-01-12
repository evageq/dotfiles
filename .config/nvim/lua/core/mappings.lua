local opts = { noremap = true, silent = true}

local keymap = vim.api.nvim_set_keymap

--------------------- general ------------------------
--[[ INSERT --]]
keymap("i", "<C-k>", "<ESC>", opts)

--[[ TERMINAL --]]
keymap("t", "<C-k>", "<C-\\><C-n>", opts)

--[[ NORMAL --]]
keymap("n", "<F2>", ":%y+<CR>", opts)
keymap("n", "tp", ":tabp<CR>", opts)
keymap("n", "tn", ":tabn<CR>", opts)
keymap("n", "tt", ":tabnew | b#<CR>", opts)
keymap("n", "J", "j", opts)
keymap("n", "<Space>", "<C-w>w", opts)

-- Move windows
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sl", "<C-w>l", opts)

-- Split windows
keymap("n", "ss", ":split<CR><C-w>j", opts)
keymap("n", "sv", ":vsplit<CR><C-w>l", opts)

--[[ VISUAL --]]
keymap("x", "<C-c>", "\"+y", opts)

--[[ MACRO --]]
keymap("n", "<leader>ln", ":let @+=expand('%').':'.line('.')<CR>", opts)

-- Nvim tree
keymap("n", "m", ":NvimTreeFocus<CR>", opts)


keymap("n", "<C-f>", ":Cpfp<CR>", opts)
keymap("n", "<leader>n", ":Startify<CR>", opts)
keymap("n", "<leader>cd", ":cd %:p:h<CR>", opts)

--vim.g.python3_host_prog = '/home/evage/networks/test/robotframework/test/pyats/bin/python'

