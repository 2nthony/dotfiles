-- navigation
-- https://github.com/nvim-pack/nvim-spectre

return {
  "nvim-pack/nvim-spectre",
  event = "BufRead",
  keys = function()
    return {}
  end,
  opts = {
    mapping = {
      ["send_to_qf"] = {
        map = "sqf",
      },
    },
  },
}
