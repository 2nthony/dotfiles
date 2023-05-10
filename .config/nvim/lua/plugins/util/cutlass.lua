-- https://github.com/gbprod/cutlass.nvim
-- delete is not cut

return {
  "gbprod/cutlass.nvim",
  event = "VeryLazy",
  opts = {
    cut_key = "x",
    exclude = { "ns" },
  },
}
