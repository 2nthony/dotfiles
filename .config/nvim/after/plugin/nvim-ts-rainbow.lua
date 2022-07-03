-- https://github.com/p00f/nvim-ts-rainbow

local status_nvim_treesitter_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_nvim_treesitter_ok then
  return
end

configs.setup {
  rainbow = {
    enable = true,
    extended_mode = true,
  }
}
