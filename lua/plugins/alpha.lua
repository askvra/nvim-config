local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end
local dashboard = require("alpha.themes.dashboard")
dashboard.section.buttons.val = {
	dashboard.button("e", "  New File", ":enew <CR>"),
	dashboard.button("f", "󰱼  Find File", ":Telescope find_files<CR>"),
	dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
	dashboard.button("t", "󰙅  File Explorer", ":NvimTreeToggle<CR>"),
	dashboard.button("s", "  Settings (init.lua)", ":e $MYVIMRC <CR>"),
	dashboard.button("q", "󰗼  Quit Neovim", ":qa<CR>"),
}
alpha.setup(dashboard.opts)
