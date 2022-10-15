local treesitter = lvim.builtin.treesitter

treesitter.ignore_install = { "haskell" }
treesitter.highlight.enabled = true
treesitter.ensure_installed = {
  "javascript",
  "typescript",
  "tsx",
  "fish",
  "json",
  "yaml",
  "html",
  "css",
  "vue",
  "svelte",
}
