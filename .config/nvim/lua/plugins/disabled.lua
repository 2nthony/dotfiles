local disabled = {
  "ggandor/flit.nvim",
  "SmiteshP/nvim-navic",
  "rcarriga/nvim-notify",
  "RRethy/vim-illuminate",
  "echasnovski/mini.bufremove",
  "catppuccin", -- lazyvim renamed
  "folke/tokyonight.nvim",
  "echasnovski/mini.pairs",
}

local list = {}

for _, plugin in ipairs(disabled) do
  list[#list + 1] = { plugin, enabled = false }
end

return list
