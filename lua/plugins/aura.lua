-- ~/.config/nvim/lua/plugins/aura.lua  (sustituye la parte de config)
return {
  "techtuner/aura-neovim",
  name = "aura",
  priority = 1000,
  config = function()
    vim.opt.termguicolors = true

    vim.cmd.colorscheme("aura") -- carga la paleta Aura original

    -- === Transparencia global ===
    local groups_transparent = {
      "Normal",
      "NormalNC",
      "NormalFloat",
      "EndOfBuffer",
      "SignColumn",
      "MsgArea",
      "NvimTreeNormal",
      "NvimTreeNormalNC",
      "StatusLine",
      "TabLineFill",
      "WinBar",
    }
    for _, grp in ipairs(groups_transparent) do
      vim.api.nvim_set_hl(0, grp, { bg = "NONE" })
    end

    -- Un poquito de transparencia en ventanas flotantes / pop-ups
    -- 0 = opaco, 100 = invisible → 26 ≈ 74 % opaco (igual que Ghostty)
    vim.opt.pumblend = 26 -- menús de autocompletado
    vim.opt.winblend = 26 -- flotantes (Lspsaga, Trouble, etc.)

    -- Colores de texto / signos (igual que antes, ahora sobre fondo NONE)
    local c = {
      fg = "#edecee",
      red = "#ff6767",
      yellow = "#ffca85",
      cyan = "#61ffca",
      purple = "#a277ff",
    }
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.yellow, bold = true })
    local diag = { Error = c.red, Warn = c.yellow, Info = c.cyan, Hint = c.purple }
    for type, col in pairs(diag) do
      vim.api.nvim_set_hl(0, "DiagnosticSign" .. type, { fg = col, bg = "NONE" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderline" .. type, { sp = col, undercurl = true })
    end
  end,
}
