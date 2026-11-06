require('mini.icons').setup({ style = 'glyph' })
require('mini.icons').mock_nvim_web_devicons()
require('mini.pairs').setup()
require('mini.cursorword').setup()
require('mini.cmdline').setup()
require('mini.completion').setup({
	window = {
		info = { border = 'single' },
		signature = { border = 'single' },
	},
})
