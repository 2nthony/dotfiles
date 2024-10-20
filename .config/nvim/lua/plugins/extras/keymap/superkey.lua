-- superkey means a key with a lot of functionality
-- by condition, rely on cmp mapping

return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      local keys = {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if vim.snippet.active({ direction = 1 }) then
            vim.snippet.jump(1)
          elseif cmp.visible() then
            pcall(opts.mapping["<CR>"] or opts.mapping["<cr>"] or cmp.mapping.confirm({ select = true }))
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<esc>"] = cmp.mapping(function(fallback)
          if vim.snippet.active() then
            vim.snippet.stop()
          end

          fallback()
        end, { "i", "s" }),

        ["<bs>"] = cmp.mapping(function(fallback)
          if vim.snippet.active() then
            vim.cmd("startinsert")
          end

          fallback()
        end, { "s" }),
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, keys)
    end,
  },
}
