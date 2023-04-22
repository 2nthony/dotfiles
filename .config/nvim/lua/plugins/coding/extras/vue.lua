-- vue
-- enable take over mode, disable tsserver
-- TODO: should improve for monorepo
return {
  "nvim-lspconfig",
  opts = function(_, opts)
    local cwd = vim.fn.getcwd()
    local path = require("lspconfig.util").path
    local find_node_modules_ancestor = require("lspconfig.util").find_node_modules_ancestor
    local project_root = find_node_modules_ancestor(cwd)

    local vue_path = path.join(project_root, "node_modules", "vue")
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
