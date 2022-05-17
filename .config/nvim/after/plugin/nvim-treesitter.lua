local status_nvim_treesitter_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_nvim_treesitter_ok then
  return
end

configs.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "fish",
    "json",
    "yaml",
    "html",
    "scss",
    "css",
    "vue",
    "svelte"
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
