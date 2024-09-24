local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

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

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })

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

	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
	config.keys = {
		{ key = "b", mods = "LEADER", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "v", mods = "LEADER", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER|CTRL", action = action.ActivatePaneDirection("Left") },
		{ key = "l", mods = "LEADER|CTRL", action = action.ActivatePaneDirection("Right") },
		{ key = "j", mods = "LEADER|CTRL", action = action.ActivatePaneDirection("Down") },
		{ key = "k", mods = "LEADER|CTRL", action = action.ActivatePaneDirection("Up") },
		{ key = "x", mods = "LEADER|CTRL", action = action.CloseCurrentPane({ confirm = true }) },
	}
end

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = action.CompleteSelection("ClipboardAndPrimarySelection"),
	},
}

return config
