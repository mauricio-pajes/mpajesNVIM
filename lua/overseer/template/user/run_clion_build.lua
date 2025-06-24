-- ~/.config/nvim/lua/overseer/template/user/run_clion_build.lua
return {
  name = "Run Clion Build",
  builder = function(params)
    return {
      cmd = { "clion", "--build", params.build_type or "Debug" },
    }
  end,
  params = {
    {
      name = "build_type",
      type = "string",
      default = "Debug",
    },
  },
}
