return {
  "3rd/image.nvim",
  enabled = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("image").setup({
      backend = "kitty", -- Usa "kitty" aunque estés en Ghostty (es compatible)
      integrations = {
        markdown = {
          enabled = true,
        },
      },
    })
  end,
}
