-- ~/.config/nvim/lua/config/lazy.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------------------
-- 1) Carga tus archivos de configuración (no son plugins)
-----------------------------------------------------------------------
require("config.options")
require("config.keymaps")

-----------------------------------------------------------------------
-- 2) Configura Lazy con los plugins
-----------------------------------------------------------------------
require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" }, -- plugins base LazyVim
    { import = "plugins" }, -- tus plugins personales
  },

  defaults = {
    lazy = false, -- no hacer lazy-load a todo por defecto
    version = false, -- usa el último commit
  },

  install = { colorscheme = { "tokyonight", "habamax" } },

  checker = { -- búsqueda periódica de actualizaciones
    enabled = true,
    notify = false, -- no mostrar pop-ups al encontrar updates
  },

  -------------------------------------------------------------------
  -- ◆ Aquí desactivamos la notificación “Neovim config reloaded!”
  -------------------------------------------------------------------
  change_detection = {
    enabled = false, -- (puedes ponerlo en false si no quieres ni vigilar)
    notify = false, -- ✗ no notificar al detectar cambios
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
