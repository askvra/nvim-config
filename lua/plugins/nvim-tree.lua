require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
		side = "right",
		float = {
			enable = false,
		}
	},
	renderer = {
		root_folder_label = false,
		indent_markers = {
			enable = false,
		},
		group_empty = true,
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = false,
				git = true,
			},
			glyphs = {
				folder = {
					arrow_closed = "",
					arrow_open = "",
				}
			}
		},
	},
	filters = {
		dotfiles = false,
	},
	actions = {
		open_file = {
			quit_on_open = false, },
	},
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
})
vim.keymap.set('n', '<A-S-b>', '<CMD>NvimTreeToggle<CR>', { desc = "Toggle NvimTree" })
vim.keymap.set('n', '<A-b>', function()
	if vim.bo.filetype == "NvimTree" then
		vim.cmd('wincmd p')
	else
		local ok = pcall(vim.cmd, 'NvimTreeFocus')
		if not ok then
			vim.cmd('NvimTreeOpen')
		end
	end
end, { desc = "Toggle focus between code and NvimTree" })
