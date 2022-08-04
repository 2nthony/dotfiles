-- https://github.com/svrana/neosolarized.nvim

function THEME_NEOSOLARIZED()
  local status_colorbuddy_ok, colorbuddy = pcall(require, "colorbuddy")
  if not status_colorbuddy_ok then
    return
  end
  local status_neosolarized_ok, neosolarized = pcall(require, "neosolarized")
  if not status_neosolarized_ok then
    return
  end

  colorbuddy.setup()
  neosolarized.setup({
    comment_italics = true,
  })

  vim.cmd [[
    highlight FloatBorder guibg=NONE ctermbg=NONE  " Removes the border of float menu (LSP and Autocompletion uses it)
    highlight link NormalFloat Normal 
    highlight NormalFloat ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE 
    highlight Pmenu ctermbg=NONE guibg=NONE 
  ]]
end
