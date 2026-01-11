local zen = require("zenschrift.zenschrift") 

local M = {} 

function M.setup(opts) 
	zen.setup(opts) 
end 

function M.toggle() 
	zen.toggle() 
end 

return M
