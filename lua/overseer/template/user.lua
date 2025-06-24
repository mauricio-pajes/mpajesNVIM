-- lua/overseer/template/user.lua
--
-- Este módulo solo reexporta cada plantilla
return {
  require("overseer.template.user.run_clion_build"),
  require("overseer.template.user.run_clion_binary"),
}
