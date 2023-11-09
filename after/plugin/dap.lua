local dap = require("dap")

-- setup mason and ensure cpptools is installed
require("mason").setup()
require("mason-nvim-dap").setup({
  ensure_installed = {'cpptools'}
})

-- setup cpptools adapter
dap.adapters.cpptools = {
  type = 'executable';
  name = "cpptools",
  command = vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7',
  args = {},
  attach = {
    pidProperty = "processId",
    pidSelect = "ask"
  },
}

-- this configuration should start cpptools and the debug the executable main in the current directory when executing :DapContinue
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "cpptools",
    request = "launch",
    program = '${workspaceFolder}/out/m',
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    args = {"<", "${workspaceFolder}/cases/case"} ,
    runInTerminal = false,
  },
}

vim.keymap.set("n", "<leader>bp", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>n", dap.step_over)
vim.keymap.set("n", "<leader>s", dap.step_into)
vim.keymap.set("n", "<leader>c", dap.continue)
vim.keymap.set("n", "<leader>r", dap.repl.open)
