-- https://github.com/folke/tokyonight.nvim

function THEME_TOKYONIGHT()
  local status_tokyonight_ok = pcall(require, 'tokyonight')
  if not status_tokyonight_ok then
    return
  end

  vim.g.tokyonight_transparent_sidebar = true
  vim.g.tokyonight_transparent = true
  vim.g.tokyonight_dark_float = false

  -- https://github.com/folke/tokyonight.nvim/issues/162
  vim.g.tokyonight_colors = {
    bg_float = "none"
  }
end
