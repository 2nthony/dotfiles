local M = {}

-- from copilot.lua source code
local metadata = {
  ns_id = vim.api.nvim_create_namespace("copilot.suggestion"),
  extmark_id = 1,
}

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

-- check cursor is nearby suggestion
function M.suggestion_visible_nearby()
  if M.suggestion_visible() then
    local details = vim.api.nvim_buf_get_extmark_by_id(0, metadata.ns_id, metadata.extmark_id, { details = true })[3]
    local virt_text = details.virt_text[1]
    local text = virt_text[1]
    local source = virt_text[2]

    if source == "CopilotSuggestion" then
      return string.sub(text, 1, 1) ~= "  "
    end
  end

  return false
end

function M.suggestion_accept()
  if M.suggestion_visible() then
    local suggestion = require("copilot.suggestion")
    suggestion.accept()
  end
end

function M.suggestion_accept_word()
  if M.suggestion_visible() then
    local suggestion = require("copilot.suggestion")
    suggestion.accept_word()
  end
end

return M
