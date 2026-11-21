require('cord').setup({
	variables = true,
	display = {
		view = 'asset',
		show_repository = false,
		show_file_in_workspace = false,
	},
	text = {
		file_browser = true,
		editing = "Editing ${filetype} file",
		viewing = "Editing ${filetype} file",
		workspace = '',
	}
})
