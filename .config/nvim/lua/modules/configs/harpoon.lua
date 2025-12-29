return function()
    local opts = {remap = false, noremap = true, silent = true }
    vim.keymap.set("n", "<leader>hp", ":lua require(\"harpoon.ui\").nav_next()<CR>", opts)
    vim.keymap.set("n", "<leader>hn", ":lua require(\"harpoon.ui\").nav_prev()<CR>", opts)
    vim.keymap.set("n", "<leader>hm", ":lua require(\"harpoon.mark\").add_file()<CR>", opts)

    local harpoon = require("harpoon")

    local conf = require("telescope.config").values

    local function toggle_telescope(harpoon_files)
        local file_paths = {}

        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        local make_finder = function()
            local paths = {}

            for _, item in ipairs(harpoon_files.items) do
                table.insert(paths, item.value)
            end

            return require("telescope.finders").new_table({
                results = paths,
            })
        end

        require("telescope.pickers")
        .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = false,
            sorter = conf.generic_sorter({}),
            layout_strategy = "center",
            layout_config = {
                preview_cutoff = 1,
                width = function(_, max_columns, _)
                    return math.min(max_columns, 80)
                end,
                height = function(_, _, max_lines)
                    return math.min(max_lines, 15)
                end,
            },
            borderchars = {
                prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
                results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
                preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
            attach_mappings = function(prompt_buffer_number, map)
                -- The keymap you need
                map("i", "<c-d>", function()
                    local state = require("telescope.actions.state")
                    local selected_entry = state.get_selected_entry()
                    local current_picker = state.get_current_picker(prompt_buffer_number)

                    -- This is the line you need to remove the entry
                    harpoon:list():remove(selected_entry)
                    current_picker:refresh(make_finder())
                end)

                return true
            end,
        })
        :find()
    end
end
