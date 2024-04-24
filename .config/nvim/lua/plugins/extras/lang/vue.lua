-- vue
-- hybrid mode, https://github.com/vuejs/language-tools#hybrid-mode-configuration-requires-vuelanguage-server-version-200

return {
  "nvim-lspconfig",
  opts = function(_, opts)
    local mason_registry = require("mason-registry")
    local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
      .. "/node_modules/@vue/language-server"

    opts.servers.volar = {}

    opts.servers.tsserver = {
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
            -- configNamespace = "typescript",
            -- enableForWorkspaceTypeScriptVersions = true,
          },
        },
      },
      filetypes = {
        "typescript",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "vue",
      },
    }

    return opts
  end,
}
