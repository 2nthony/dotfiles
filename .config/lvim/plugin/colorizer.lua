-- https://github.com/norcalli/nvim-colorizer.lua

local status, colorizer = pcall(require, "colorizer")
if (not status) then return end

colorizer.setup {
  'css',
  'javascript',
  'html',
  'vue',
  'svelte',
  'typescript',
  'jsx',
  'tsx',
}
