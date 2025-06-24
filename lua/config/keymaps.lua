-- keymaps.lua - JetBrains-style mappings for LazyVim
local map  = vim.keymap.set
local opts = { noremap = true, silent = true }

-----------------------------------------------------------------------
-- Helpers
-----------------------------------------------------------------------
local function safe_call(mod, fn, ...)
  local ok, m = pcall(require, mod)
  if ok and m and type(m[fn]) == "function" then
    return m[fn](...)
  else
    vim.notify(("Plugin %s.%s unavailable"):format(mod, fn), vim.log.levels.WARN)
  end
end

local function safe_cmd(cmd)
  local ok, err = pcall(vim.api.nvim_command, cmd)
  if not ok then
    vim.notify("Command failed: " .. cmd .. "\n" .. (err or "Unknown error"), vim.log.levels.WARN)
  end
end

-----------------------------------------------------------------------
-- FILE & EDITING
-----------------------------------------------------------------------
map({ "n", "i" }, "<D-s>",     "<cmd>w<cr>",  opts)     -- Guardar
map({ "n", "i" }, "<D-S-s>",   "<cmd>wa<cr>", opts)     -- Guardar todo
map("n", "<D-w>",              "<cmd>bd<cr>", opts)     -- Cerrar buffer
map("n", "<D-q>",              "<cmd>qa<cr>", opts)     -- Salir

map({ "n", "i" }, "<D-z>",     "u",           opts)     -- Undo
map({ "n", "i" }, "<D-S-z>",   "<C-r>",       opts)     -- Redo

map("n", "<D-a>",              "ggVG",        opts)     -- Select all
map("i", "<D-a>",              "<Esc>ggVG",   opts)

map("v", "<D-x>",              '"+d',         opts)     -- Cut
map("v", "<D-c>",              '"+y',         opts)     -- Copy
map({ "n", "v" }, "<D-v>",     '"+p',         opts)     -- Paste (normal/visual)
map("i", "<D-v>",              "<C-r>+",      opts)     -- Paste (insert)

map("n", "<D-d>",              "yyp",         opts)     -- Duplicate line
map("v", "<D-d>",              "y'>p",        opts)     -- Duplicate selection

-----------------------------------------------------------------------
-- MOVE LINES
-----------------------------------------------------------------------
map("n", "<M-S-Up>",           ":m-2<cr>==",  opts)
map("n", "<M-S-Down>",         ":m+<cr>==",   opts)
map("v", "<M-S-Up>",           ":m '<-2<cr>gv=gv", opts)
map("v", "<M-S-Down>",         ":m '>+1<cr>gv=gv", opts)

-----------------------------------------------------------------------
-- COMMENT / FORMAT
-----------------------------------------------------------------------
map({ "n", "v" }, "<D-/>", function()
  safe_call("Comment.api", "toggle.linewise.current")
end, { desc = "Toggle comment", noremap = true, silent = true })

map({ "n", "v" }, "<D-M-l>", function()
  safe_call("conform", "format")
end, { desc = "Format file", noremap = true, silent = true })

-----------------------------------------------------------------------
-- FIND & SEARCH
-----------------------------------------------------------------------
map("n", "<D-f>",   "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find in file" })
map("n", "<D-S-f>", "<cmd>Telescope live_grep<cr>",                { desc = "Find in project" })
map("n", "<D-p>",   "<cmd>Telescope find_files<cr>",               { desc = "Search file" })
map("n", "<D-S-p>", "<cmd>Telescope commands<cr>",                 { desc = "Command palette" })

-----------------------------------------------------------------------
-- LSP NAVIGATION
-----------------------------------------------------------------------
map("n", "<D-b>", function()
  safe_call("vim.lsp.buf", "definition")
end, { desc = "Go to definition" })

map("n", "<D-S-b>", function()
  safe_call("vim.lsp.buf", "references")
end, { desc = "Find references" })

map("n", "<S-F6>", function()
  safe_cmd("Lspsaga rename")
end, { desc = "Rename symbol" })

map("n", "<M-D-Left>",  "<C-o>", opts)  -- Jump back
map("n", "<M-D-Right>", "<C-i>", opts)  -- Jump forward

-----------------------------------------------------------------------
-- RUN / DEBUG
-----------------------------------------------------------------------
-- ⌘R → compilar/ejecutar archivo actual (usa tu nuevo :R)
map("n", "<D-r>", function()
  vim.cmd("R")
end, { desc = "Compile & Run current file", noremap = true, silent = true })

-- ⇧⌘R → continuar depuración (DAP)
map("n", "<D-S-r>", function()
  safe_call("dap", "continue")
end, opts)

-----------------------------------------------------------------------
-- UI TOGGLES / PANELS
-----------------------------------------------------------------------
map("n", "<D-1>", "<cmd>NvimTreeToggle<cr>",                       { desc = "Project view" })
map("n", "<D-2>", "<cmd>TroubleToggle workspace_diagnostics<cr>",  { desc = "Problems" })
map("n", "<D-`>", "<cmd>ToggleTerm direction=float<cr>",           { desc = "Floating terminal" })

map("n", "<D-\\>", "<cmd>vsplit<cr>", opts)
map("n", "<D-=>",  "<cmd>split<cr>",  opts)
map("n", "<D-Left>",  "<cmd>bprevious<cr>", opts)
map("n", "<D-Right>", "<cmd>bnext<cr>",     opts)

-----------------------------------------------------------------------
-- RELOAD CONFIG
-----------------------------------------------------------------------
map("n", "<D-S-r>", function()
  vim.cmd("source $MYVIMRC")
  vim.notify("Neovim config reloaded!", vim.log.levels.INFO)
end, { desc = "Reload config" })
