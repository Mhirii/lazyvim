local M = {}

M.getHeaders = function()
  math.randomseed(os.time())
  local headers = require("user.headers")
  return headers[math.random(1, #headers)]
end

return M
