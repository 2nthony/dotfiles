-- https://github.com/williamboman/mason.nvim

local status_mason_ok, mason = pcall(require, "mason")
if not status_mason_ok then
  return
end

mason.setup()

local status_mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if status_mason_lspconfig_ok then
  mason_lspconfig.setup()
end
