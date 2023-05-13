local disabled = {
  "ggandor/flit.nvim",
  "SmiteshP/nvim-navic",
  "rcarriga/nvim-notify",
  "echasnovski/mini.bufremove",
}

local list = {}

for _, plugin in ipairs(disabled) do
  list[#list + 1] = { plugin, enabled = false }
end

return list
