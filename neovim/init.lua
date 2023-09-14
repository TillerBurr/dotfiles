-- Heavily borrowed from:
--
-- Author: Jiedong Hao
-- Email: jdhao@hotmail.com
-- Blog: https://jdhao.github.io/
-- GitHub: https://github.com/jdhao
-- StackOverflow: https://stackoverflow.com/users/6064933/jdhao
vim.loader.enable()

local version = vim.version

-- check if we have the latest stable version of nvim
local expected_ver = "0.9.2"
local ev = version.parse(expected_ver)
local actual_ver = version()

if version.cmp(ev, actual_ver) ~= 0 then
  local _ver = string.format("%s.%s.%s", actual_ver.major, actual_ver.minor, actual_ver.patch)
  local msg = string.format("Expect nvim %s, but got %s instead. Use at your own risk!", expected_ver, _ver)
  vim.api.nvim_err_writeln(msg)
end
vim.g.python3_host_prog = '/home/tbaur/tools/nvim_python/bin/python'
local core_conf_files = {
  "globals.lua", -- some global settings
--   "options.vim", -- setting options in nvim
--   "autocommandsx.vim", -- various autocommands
  "keybindings.lua", -- all the user-defined mappings
  "plugins.lua", -- all the plugins installed and their configurations
  "colorschemes.lua", -- colorscheme settings
}

-- source all the core config files
for _, file_name in ipairs(core_conf_files) do
  if vim.endswith(file_name, 'vim') then
    local path = string.format("%s/core/%s", vim.fn.stdpath("config"), file_name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd)
  else
    local module_name, _ = string.gsub(file_name, "%.lua", "")
    package.loaded[module_name] = nil
    require(module_name)
  end
end