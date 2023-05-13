-- https://github.com/rainbowhxch/accelerated-jk.nvim
-- https://github.com/ayamir/nvimdots/blob/main/lua/modules/configs/editor/accelerated-jk.lua

return {
  "rainbowhxch/accelerated-jk.nvim",
  lazy = true,
  keys = {
    { "j", "<Plug>(accelerated_jk_gj)" },
    { "k", "<Plug>(accelerated_jk_gk)" },
  },
  opts = {
    mode = "time_driven",
    enable_deceleration = false,
    acceleration_motions = {},
    acceleration_limit = 150,
    acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },
    -- when 'enable_deceleration = true', 'deceleration_table = { {200, 3}, {300, 7}, {450, 11}, {600, 15}, {750, 21}, {900, 9999} }'
    deceleration_table = { { 150, 9999 } },
  },
}
