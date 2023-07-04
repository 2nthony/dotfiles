-- includes some related to lsp

return {
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "plugins.extras.lang.cspell" },
  { import = "plugins.extras.lang.vue" },

  { import = "plugins.extras.linting.eslint" },
  { import = "plugins.extras.formatting.prettier" },
}
