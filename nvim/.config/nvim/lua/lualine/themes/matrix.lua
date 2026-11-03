local c = {
	bg = "#020803",
	bg_alt = "#07140a",
	bg_sel = "#0f3d1c",
	dim = "#1e5c2e",
	fg = "#3fdc63",
	bright = "#00ff41",
	glow = "#c8ffd4",
	lime = "#c6ff3e",
	cyan = "#5effe0",
	red = "#ff3b5c",
}

local function mode(color)
	return {
		a = { fg = c.bg, bg = color, gui = "bold" },
		b = { fg = color, bg = c.bg_sel },
		c = { fg = c.fg, bg = c.bg_alt },
	}
end

return {
	normal = mode(c.bright),
	insert = mode(c.glow),
	visual = mode(c.lime),
	replace = mode(c.red),
	command = mode(c.cyan),
	inactive = {
		a = { fg = c.dim, bg = c.bg_alt },
		b = { fg = c.dim, bg = c.bg_alt },
		c = { fg = c.dim, bg = c.bg_alt },
	},
}
