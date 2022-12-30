-- https://github.com/norcalli/nvim-colorizer.lua

local ok, colorizer = pcall(require, "colorizer")
if (not ok) then return end

colorizer.setup {
  'css',
  'javascript',
  'html',
  'vue',
  'svelte',
  'typescript',
  'jsx',
  'tsx',
  'lua',
}
