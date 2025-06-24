-- ~/.config/nvim/lua/plugins/telescope-fallback.lua
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      find_command = { "find", ".", "-type", "f" },
    },
  },
}
