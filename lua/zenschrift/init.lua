vim.api.nvim_create_user_command("Zen", function()
  require("zenschrift").toggle()
end, {})
