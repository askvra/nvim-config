require('telescope').setup({
  defaults = {
    previewer = false,
    file_ignore_patterns = { "node_modules", ".git/" },
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--no-ignore-vcs" },
    },
    live_grep = {
      previewer = false,
    },
  },
})
