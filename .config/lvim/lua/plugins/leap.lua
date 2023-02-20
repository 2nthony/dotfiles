-- navigation
-- https://github.com/ggandor/leap.nvim

return {
  "ggandor/leap.nvim",
  event = "VeryLazy",
  config = function()
    require("leap").opts.highlight_unlabeled_phase_one_targets = true
  end
}
