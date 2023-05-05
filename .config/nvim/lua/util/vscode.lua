local M = {}

---get full `.vscode/settings.json` as table
function M.get_settings()
  local settings = {}
  local cwd = vim.fn.getcwd()
  local filename = vim.fn.join({ cwd, ".vscode/settings.json" }, "/")

  if vim.fn.filereadable(filename) == 1 then
    local json = vim.fn.json_decode(vim.fn.readfile(filename, "json"))
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
