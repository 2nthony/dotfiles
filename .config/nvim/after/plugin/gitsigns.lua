-- https://github.com/lewis6991/gitsigns.nvim

local status_gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if not status_gitsigns_ok then
  return
end

gitsigns.setup {
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  preview_config = {
    -- Options passed to nvim_open_win
    border = "rounded",
    style = "minimal",
    relative = "cursor",
    focusable = false,
    row = 0,
    col = 1,
  },
}
