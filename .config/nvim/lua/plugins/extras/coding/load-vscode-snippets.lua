local vscode_code_snippets_paths = {
  "~/Library/Application Support/Code/User/snippets/codespeedy.code-snippets",
}

return {
  "LuaSnip",
  opts = function()
    local from_vscode = require("luasnip.loaders.from_vscode")
    for _, path in ipairs(vscode_code_snippets_paths) do
      from_vscode.load_standalone({ path = path })
    end
  end,
}
