return {
  "2nthony/vitesse.nvim",
  dir = "~/ghq/github.com/2nthony/vitesse.nvim",
  priority = 1000,
  enabled = lvim.colorscheme == "vitesse",
  dependencies = {
    "tjdevries/colorbuddy.nvim"
  },
  config = {
    -- reverse_visual = true,
  },
}