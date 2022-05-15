local status_nvim_treesitter_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_nvim_treesitter_ok then
  return
end

configs.setup {
  autotag = {
    enable = true,
  }
}
