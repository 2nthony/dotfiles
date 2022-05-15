-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring

local status_nvim_treesitter_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_nvim_treesitter_ok then
  return
end

configs.setup {
  context_commentstring = {
    enable = true
  }
}
