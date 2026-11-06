require('lualine').setup({
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = { statusline = { 'NvimTree', 'packer', 'lazy' } },
	},
	sections = {
		lualine_a = { 'hostname' },
		lualine_b = { 'branch', 'diff' },
		lualine_c = { 'diagnostics' },
		lualine_x = {},
		lualine_y = { { function() return "ฅ^•ﻌ•^ฅ" end } },
		lualine_z = { { function() return os.date("%H:%M") end } }
	},
})
