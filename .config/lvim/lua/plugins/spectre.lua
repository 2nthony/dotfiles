-- navigation
-- https://github.com/windwp/nvim-spectre

return {
  "windwp/nvim-spectre",
  event = "BufRead",
  opts = {
    mapping = {
          ['send_to_qf'] = {
        map = 'sqf',
      },
    },
  },
}
