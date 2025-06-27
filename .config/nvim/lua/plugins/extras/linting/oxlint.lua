local auto_format = vim.g.lazyvim_oxlint_auto_format == nil or vim.g.lazyvim_oxlint_auto_format

return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "oxlint",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        oxlint = {},
      },
      setup = {
        oxlint = function()
          if not auto_format then
            return
          end

          local function get_client(buf)
            return LazyVim.lsp.get_clients({ name = "oxlint", bufnr = buf })[1]
          end

          local formatter = LazyVim.lsp.formatter({
            name = "oxlint: lsp",
            primary = false,
            priority = 200,
            filter = "oxlint",
          })

          if not pcall(require, "vim.lsp._dynamic") then
            formatter.name = "oxlint: OxcFixAll"
            formatter.sources = function(buf)
              local client = get_client(buf)
              return client and { "oxlint" } or {}
            end
            formatter.format = function(buf)
              local client = get_client(buf)
              if client then
                local diag = vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                if #diag > 0 then
                  vim.cmd("OxcFixAll")
                end
              end
            end
          end

          -- register the formatter with LazyVim
          LazyVim.format.register(formatter)
        end,
      },
    },
  },
}
