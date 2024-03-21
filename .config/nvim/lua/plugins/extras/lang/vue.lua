-- vue
-- enable take over mode, disable tsserver
-- TODO: should improve for monorepo
return {
  "nvim-lspconfig",
  opts = function(_, opts)
    -- get path from current buffer
    local current_path = vim.fn.expand("%:p:h")
    local util = require("lspconfig.util")
    local project_root = util.find_node_modules_ancestor(current_path)

    local vue_path = util.path.join(project_root, "node_modules", "vue")
    local is_vue = vim.fn.isdirectory(vue_path) == 1
    if is_vue then
      opts.servers.volar = {
        filetypes = {
          "vue",
          "javascript",
          "javascript.jsx",
          "typescript",
          "typescript.tsx",
          "javascriptreact",
          "typescriptreact",
          "json",
        },
      }
      opts.servers.tsserver = {
        autostart = false,
        root_dir = function()
          return false
        end,
        single_file_support = false,
      }
    end

    return opts
  end,
}
