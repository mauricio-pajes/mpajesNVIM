return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {}, -- C++
        pyright = {}, -- Python
        tsserver = {}, -- JS/TS
        gopls = {}, -- Go
        jdtls = {}, -- Java
        omnisharp = {}, -- C#
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
      },
    },
  },
}
