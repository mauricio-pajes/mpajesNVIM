local leet_arg = "leetcode.nvim"

return {
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- si usas treesitter
    lazy = leet_arg ~= vim.fn.argv(0, -1),
    opts = {
      arg = leet_arg,
      lang = "cpp", -- o "python3", "java", etc.
      plugins = {
        non_standalone = true, -- para usar dentro de una sesión normal de Neovim
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- agrega uno de estos si no lo tienes:
      -- "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua",
    },
    cmd = "Leet",
  },
}
