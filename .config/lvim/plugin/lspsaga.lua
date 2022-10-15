-- LSP
-- https://github.com/glepnir/lspsaga.nvim

local status_lspsaga_ok, lspsaga = pcall(require, "lspsaga")
if not status_lspsaga_ok then
  return
end

lspsaga.init_lsp_saga {
  saga_winblend = 0,
  server_filetype_map = {
    typescript = "typescript"
  },
  finder_action_keys = {
    open = "<cr>",
  },
  show_outline = {
    jump_key = "<cr>"
  },
  code_action_lightbulb = {
    enable_in_insert = false,
  }
}
