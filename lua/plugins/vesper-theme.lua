return {
  {
    dir = vim.fn.stdpath("config"),
    name = "vesper-colorscheme",
    priority = 1000,
    lazy = false,

    config = function()
      local p = {
        base = "#101010", -- fondo base
        base2 = "#181818", -- fondo alterno
        fg = "#ffffff", -- blanco predominante
        red = "#f5a191", -- melón
        green = "#90b99f", -- verde suave
        yellow = "#ffc799", -- mostaza clara (más usada ahora)
        blue = "#aca1cf", -- azul lavanda
        magenta = "#e29eca", -- rosa lavanda
        pink = "#ea83a5", -- fucsia
        comment = "#7e7e7e", -- gris medio
        lightgray = "#a0a0a0",
        white = "#ffffff", -- blanco fuerte
        cyan = "#99ffe4", -- menta
        peach = "#ffc799", -- alias para mostaza
        lilac = "#b9aeda",
        rose = "#ecaad6",
        cherry = "#f591b2",
        altred = "#ff8080",
        accent = "#c9826b",
        highlight = "#2a2a2a",
      }

      vim.o.termguicolors = true
      vim.cmd("highlight clear")
      if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
      end
      vim.g.colors_name = "vesper-colorscheme"

      local function hi(grupo, opts)
        vim.api.nvim_set_hl(0, grupo, opts)
      end

      -- Fondo y líneas
      hi("Normal", { fg = p.fg, bg = nil })
      hi("NormalFloat", { fg = p.fg, bg = nil })
      hi("LineNr", { fg = p.comment, bg = nil })
      hi("CursorLine", { bg = p.highlight })
      hi("CursorLineNr", { fg = p.peach, bg = p.highlight, bold = true })

      -- Sintaxis
      hi("Comment", { fg = p.comment, italic = true })
      hi("Constant", { fg = p.cyan })
      hi("Identifier", { fg = p.white }) -- blanco predomina más
      hi("Statement", { fg = p.red })
      hi("PreProc", { fg = p.peach }) -- mostaza clara
      hi("Type", { fg = p.green })
      hi("Special", { fg = p.magenta })
      hi("Todo", { fg = p.base, bg = p.yellow, bold = true }) -- visible en fondo

      -- UI
      hi("StatusLine", { fg = p.fg, bg = nil })
      hi("StatusLineNC", { fg = p.comment, bg = nil })
      hi("VertSplit", { fg = p.base2, bg = nil })
      hi("FloatBorder", { fg = p.blue, bg = nil })
      hi("Pmenu", { fg = p.fg, bg = p.base2 })
      hi("PmenuSel", { fg = p.base, bg = p.peach }) -- más mostaza
      hi("Search", { fg = p.base, bg = p.peach })

      -- Telescope
      hi("TelescopeNormal", { fg = p.fg, bg = nil })
      hi("TelescopeBorder", { fg = p.blue, bg = nil })
      hi("TelescopeSelection", { fg = p.peach, bg = p.highlight })

      -- LSP diagnostics
      hi("DiagnosticError", { fg = p.altred })
      hi("DiagnosticWarn", { fg = p.peach })
      hi("DiagnosticInfo", { fg = p.lilac })
      hi("DiagnosticHint", { fg = p.cyan })
    end,
  },
}
