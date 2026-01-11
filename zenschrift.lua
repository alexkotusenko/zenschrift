-- zenschrift/zen.lua

local M = {}

-- Default configuration
-- Specify an override for any of these options when configuring.
-- For example:
-- ```
-- require("zenschrift.nvim").setup({
--   number = true, -- to show line numbers
--   -- if nothing else is passed, 
--   -- you will get defaults everywhere else 
-- })
-- ```
M.config = {
  laststatus = 0,
  cmdheight = 0,
  showmode = false,
  number = false,
  relativenumber = false,
  signcolumn = "no",
  ruler = false,
  showcmd = false,
  foldcolumn = "2",
  fillchars = "fold: ,eob: ",
}

local zen_enabled = false
local saved = {}

local function apply(opts)
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
    apply(M.config)
    zen_enabled = true
  else
    restore()
    zen_enabled = false
  end
end

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

return M

