-- https://github.com/windwp/nvim-spectre

local ok, nvim_spectre = pcall(require, 'spectre')
if (not ok) then return end

nvim_spectre.setup {}
