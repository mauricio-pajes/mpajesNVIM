-- ~/.config/nvim/lua/overseer/template/user/run_clion_binary.lua
return {
  name = "CLion: Build & Run",
  builder = function()
    local build_dir = "cmake-build-debug"
    local exe_name = "HashTables"
    local cmd = table.concat({
      "cmake -S . -B " .. build_dir,
      "&&",
      "cmake --build " .. build_dir,
      "&&",
      build_dir .. "/" .. exe_name,
    }, " ")
    return {
      cmd = { "sh", "-c", cmd },
      name = "CLion Build & Run",
      cwd = vim.fn.getcwd(),
      components = { "default" },
    }
  end,
  condition = { filetype = { "cpp", "c" } },
}
