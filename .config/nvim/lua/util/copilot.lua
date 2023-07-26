local M = {}

function M.has()
  local has = require("lazyvim.util").has
  return has("copilot.lua")
end

function M.suggestion_visible()
  if M.has() then
    local suggestion = require("copilot.suggestion")
    return suggestion.is_visible()
  end

  return false
end

function M.suggestion_accept()
  if M.suggestion_visible() then
    local suggestion = require("copilot.suggestion")
    suggestion.accept()
  end
end

return M
