-- ============================================= --
-- =============== AUTO COMMANDS =============== --
-- ============================================= --
vim.cmd.colorscheme("vague")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })

vim.cmd("highlight WinSeparator guifg=#141415 guibg=#141415")

vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave" }, {
	callback = function()
		if vim.bo.modifiable and vim.bo.buftype == "" and vim.fn.expand('%') ~= '' then
			vim.cmd("silent! w")
		end
	end
})
vim.api.nvim_create_autocmd("VimResized", {
	pattern = "*",
	command = "wincmd =",
})
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.bo["filetype"] == "nvimtree" then
			vim.cmd("quit")
		end
	end,
})
