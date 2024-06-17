return function(config)
	-- window
	config.window_background_opacity = 0.7
	config.macos_window_background_blur = 49
	config.window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	}
	config.window_decorations = "RESIZE"

	-- tabbar
	-- config.tab_bar_at_bottom = true
	config.use_fancy_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_max_width = 26
	config.window_frame = {
		font = config.font,
		font_size = config.font_size,
	}

	-- performance
	config.animation_fps = 0
	config.cursor_blink_ease_in = "Constant"
	config.cursor_blink_ease_out = "Constant"

	config.use_resize_increments = true
end
