local dap = require("dap")

-- dap.adapters.cpp = {
--     type = "executable",
--     command = "~/.local/share/nvim/mason/packages/cpptools/extension/bin/cpptools",
--     name = "cpp"
-- }
-- 
-- dap.configurations.cpp = {
--     {
--         type = 'cpp';
--         request = 'launch';
--         name = 'Launch file';
--         program = '${fileDir}/out/m';
--     },
-- }

vim.keymap.set("n", "<leader>bp", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>n", dap.step_over)
vim.keymap.set("n", "<leader>s", dap.step_into)
vim.keymap.set("n", "<leader>c", dap.continue)
vim.keymap.set("n", "<leader>r", dap.repl.open)
