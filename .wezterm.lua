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

config.color_scheme = "Arthur (Gogh)"
-- config.color_scheme = 'Bespin (base16)'
-- config.color_scheme = "Catppuccin Mocha"

if is_darwin() then
	config.font_size = 13.0
	config.native_macos_fullscreen_mode = true

	wezterm.on("gui-startup", function(cmd)
		local _, _, window = wezterm.mux.spawn_window(cmd or {})
		window:gui_window():toggle_fullscreen()
	end)
end

if is_win() then
	config.font_size = 10.0
	config.default_prog = { "pwsh", "--nologo" }
	config.window_decorations = "RESIZE"
end

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })

config.macos_window_background_blur = 40
config.window_background_opacity = 0.7
config.initial_cols = 120
config.initial_rows = 32

config.hide_tab_bar_if_only_one_tab = true

return config
