local wezterm = require("wezterm")
local config = wezterm.config_builder()

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

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.initial_cols = 120
config.initial_rows = 32

config.macos_window_background_blur = 40
config.window_background_opacity = 0.7

config.font = wezterm.font("JetBrainsMonoNL Nerd Font", { weight = "Medium" })
config.color_scheme = "Arthur (Gogh)"
config.line_height = 1

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
	-- config.default_prog = { "nu" }
	config.window_decorations = "RESIZE"
end

return config
