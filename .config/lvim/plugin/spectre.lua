-- https://github.com/windwp/nvim-spectre

local status_nvim_spectre_ok, nvim_spectre = pcall(require, 'spectre')
if (not status_nvim_spectre_ok) then return end

nvim_spectre.setup {}
