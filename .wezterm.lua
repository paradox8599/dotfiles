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

----------------------------------------------------------------
----------------------------------------------------------------

config.color_scheme = "Adventure"

if is_darwin() then
	config.font_size = 13.0
else
	config.font_size = 12.0
end

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })

config.window_background_opacity = 0.98
config.initial_cols = 120
config.initial_rows = 32

config.hide_tab_bar_if_only_one_tab = true

return config
