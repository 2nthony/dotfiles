-- vscode like snippet keymaps
-- https://www.lazyvim.org/plugins/coding#nvim-cmp-1

return {
  {
    "hrsh7th/nvim-cmp",
    keys = {
      {
        "<esc>",
        function()
          local handler = "<esc>"

          if vim.snippet.active() then
            handler = "<cmd>lua vim.snippet.stop()<cr>" .. handler
          end

          return handler
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<bs>",
        function()
          local handler = "<bs>"

          if vim.snippet.active() then
            handler = "<cmd>startinsert<cr>" .. handler
          end

          return handler
        end,
        expr = true,
        silent = true,
        mode = { "s" },
      },
    },
  },
}
