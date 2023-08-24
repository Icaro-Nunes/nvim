vim.keymap.set("n", "<leader>gg", function() vim.cmd.Flog { args = { "-all", "-graph" } } end)
