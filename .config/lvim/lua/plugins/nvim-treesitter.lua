-- builtin
-- https://github.com/nvim-treesitter/nvim-treesitter

local ok = pcall(require, "nvim-treesitter")
if not ok then
  return
end

local treesitter = lvim.builtin.treesitter

treesitter.auto_install = false
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
