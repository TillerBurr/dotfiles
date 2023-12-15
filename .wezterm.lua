-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Frappe'
config.enable_scroll_bar = true
config.default_prog = { 'wsl.exe', '--distribution', 'Ubuntu', '--cd', '~' }
config.warn_about_missing_glyphs = false

config.launch_menu = {
    {
        label = "Ubuntu",
        args = { "wsl.exe", "-d", "Ubuntu", "--cd", "~" }
    },
    {
        label = "Powershell",
        args = { "C:\\Users\\tbaur\\AppData\\Local\\Microsoft\\WindowsApps\\Microsoft.PowerShell_8wekyb3d8bbwe\\pwsh.exe" }
    },
    {
        label = "MSYS2",
        args = { "C:\\tools\\msys64\\msys2_shell.cmd -defterm -here -no-start -msys" }
    }
}
config.keys = {
  { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
}
-- and finally, return the configuration to wezterm
return config
