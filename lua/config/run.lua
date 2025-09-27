local Terminal = require("toggleterm.terminal").Terminal

vim.api.nvim_create_user_command("R", function()
  -- Guarda el archivo antes de compilar
  vim.cmd("w")

  local file = vim.fn.expand("%:p")
  local ext = vim.fn.expand("%:e")
  local filename = vim.fn.expand("%:t:r")
  local cmd

  if ext == "cpp" then
    cmd = string.format("g++ -std=c++17 -Wall -Wextra '%s' -o '%s.out' && ./'%s.out'", file, filename, filename)
  elseif ext == "c" then
    cmd = string.format("gcc -Wall -Wextra '%s' -o '%s.out' && ./'%s.out'", file, filename, filename)
  elseif ext == "py" then
    cmd = string.format("python3 '%s'", file)
  elseif ext == "js" then
    cmd = string.format("node '%s'", file)
  elseif ext == "ts" then
    cmd = string.format("ts-node '%s'", file)
  elseif ext == "sh" then
    cmd = string.format("bash '%s'", file)
  elseif ext == "java" then
    cmd = string.format("javac '%s' && java '%s'", file, filename)
  elseif ext == "rs" then
    cmd = string.format("rustc '%s' -o '%s.out' && ./'%s.out'", file, filename, filename)
  elseif ext == "go" then
    cmd = string.format("go run '%s'", file)
  elseif ext == "lua" then
    cmd = string.format("lua '%s'", file)
  elseif ext == "asm" then
    cmd = string.format(
      "nasm -f elf32 '%s' -o '%s.o' && ld -m elf_i386 '%s.o' -o '%s.out' && ./'%s.out'",
      file,
      filename,
      filename,
      filename,
      filename
    )
  else
    vim.notify("❌ Lenguaje no soportado: " .. ext, vim.log.levels.ERROR)
    return
  end

  -- Ejecutar en terminal flotante reutilizable
  local term = Terminal:new({
    cmd = cmd,
    direction = "float",
    close_on_exit = false,
    hidden = true,
  })

  term:toggle()
end, {
  desc = "Compila y ejecuta automáticamente usando ToggleTerm",
})
