return {
  'projekt0n/github-nvim-theme',
  priority = 1000,
  enabled = lvim.colorscheme:find('github_') ~= nil,
  opts = {
    transparent = true,
  },
  config = function(_, opts)
    require('github-theme').setup(opts)
  end
}
