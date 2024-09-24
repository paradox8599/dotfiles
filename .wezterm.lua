local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

----------------------------------------------------------------
----------------------------------------------------------------

local is_darwin = function()
	return wezterm.target_triple:find("darwin") ~= nil
end

local is_win = function()
	return wezterm.target_triple:find("windows") ~= nil
end

----------------------------------------------------------------
----------------------------------------------------------------

config.color_scheme = "Bamboo"
-- config.color_scheme = 'Bitmute (terminal.sexy)'
-- config.color_scheme = 'Breeze (Gogh)'

if is_darwin() then
	config.font_size = 13.0
end

if is_win then
	config.font_size = 10.0
	config.default_prog = { "pwsh", "--nologo" }
end

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })

config.window_background_opacity = 0.95
config.initial_cols = 120
config.initial_rows = 32

config.hide_tab_bar_if_only_one_tab = true

return config
