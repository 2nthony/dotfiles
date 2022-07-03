-- https://github.com/lewis6991/impatient.nvim

local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  return
end

impatient.enable_profile()
