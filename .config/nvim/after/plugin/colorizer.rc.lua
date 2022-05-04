local status, colorizer = pcall(require, "colorizer")
if (not status) then return end

require'colorizer'.setup{
  'css',
  'javascript',
  'html',
  'vue',
  'svelte',
  'typescript',
  'jsx',
  'tsx',
}
