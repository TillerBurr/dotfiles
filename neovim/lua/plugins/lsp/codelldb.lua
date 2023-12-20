M = {}


local extension_path = vim.env.HOME .. '/.codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
M.adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)

local opts = {
    dap = {
        adapter = M.adapter }

}
M.opts = opts

return M
