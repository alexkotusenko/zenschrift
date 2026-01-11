-- zenschrift/zen.lua

local M = {}

local zen_enabled = false

local saved = {}

local function save(opts)
  for k, v in pairs(opts) do
    saved[k] = vim.o[k]
    vim.o[k] = v
  end
end

local function restore()
  for k, v in pairs(saved) do
    vim.o[k] = v
  end
  saved = {}
end

function M.toggle()
  if not zen_enabled then
    save({
      laststatus = 0,
      cmdheight = 0,
      showmode = false,
      number = false,
      relativenumber = false,
      signcolumn = "no",
      ruler = false,
      showcmd = false,
    })
    zen_enabled = true
  else
    restore()
    zen_enabled = false
  end
end

return M

