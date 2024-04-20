local wezterm = require("wezterm")

return function(config)
	config.font_size = 16
	config.font = wezterm.font_with_fallback({
		{
			family = "Maple Mono",
		},
		{
			family = "Hack Nerd Font",
		},
	})
end
