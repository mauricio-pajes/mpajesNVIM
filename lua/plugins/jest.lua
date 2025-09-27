return {
  "mattkubej/jest.nvim",
  config = function()
    require("nvim-jest").setup({
      -- Puedes personalizar el comando de Jest si lo necesitas
      jest_cmd = "yarn test:app",
      silent = true,
    })
  end,
}
