local M = {}

--- Remove comments from JSON string
--- @param json_str string JSON string with comments
--- @return string Cleaned JSON string without comments
local function remove_json_comments(json_str)
  return json_str:gsub("%s*//[^\n]*", ""):gsub("%s*/%*.-%*/", "")
end

---get full `.vscode/settings.json` as table
function M.get_settings()
  local settings = {}
  local cwd = vim.fn.getcwd()
  local filename = vim.fn.join({ cwd, ".vscode/settings.json" }, "/")

  if vim.fn.filereadable(filename) == 1 then
    local file_content = vim.fn.readfile(filename, "json")
    if type(file_content) == "table" then
      file_content = table.concat(file_content, "\n")
    end
    local cleaned_json_str = remove_json_comments(file_content)
    local json = vim.fn.json_decode(cleaned_json_str)
    if json then
      settings = json
    end
  end

  return settings
end

---get `.vscode/settings.json` value by key
---@param key string table key
function M.get_setting(key)
  local settings = M.get_settings()
  return settings[key]
end

return M
