return function()
    require("conform").setup({
      default_format_opts = {
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" }, -- Neovim to detect .h header files as Cpp files (:set filetype?)
        lua = { "stylua" },
        sh = { "shfmt" },
        python = { "black" },
      },
      formatters = {
        ["clang-format"] = {
          command = "clang-format",
          prepend_args = { "--style=file", "--fallback-style=llvm" },
        },
        stylua = {
          command = "stylua",
          prepend_args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
        },
        shfmt = {
          command = "shfmt",
          prepend_args = { "-i", "0", "-sr", "-kp" },
        },
        black = {
          command = "black",
          prepend_args = { "--line-length=120" },
        },
      },
    })

    vim.keymap.set("", "<leader>lf", function()
      require("conform").format({ async = true }, function(err)
        if not err then
          local mode = vim.api.nvim_get_mode().mode
          if vim.startswith(string.lower(mode), "v") then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
          end
        end
      end)
    end, { desc = "Format code" })
end

