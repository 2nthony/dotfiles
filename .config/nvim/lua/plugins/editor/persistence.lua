-- https://github.com/folke/persistence.nvim

local skip_filetypes = {
  "neo-tree",
  "alpha",
  "NvimTree",
}

return {
  "folke/persistence.nvim",
  keys = function()
    return {}
  end,
  opts = {
    options = {
      "buffers",
      "curdir",
      "folds",
      "tabpages",
      "winsize",
      "winpos",
      "help",
      "globals",
    },
    pre_save = function()
      -- https://github.com/rmagatti/auto-session/issues/176#issuecomment-1278384005
      -- https://github.com/rmagatti/auto-session/blob/1d3dd70a2d48e0f3441128eb4fb0b437a0bf2cc4/lua/auto-session.lua#L196
      local buffers = vim.api.nvim_list_bufs()
      for _, buffer in ipairs(buffers) do
        local should_wipeout = false

        local buf_name = vim.api.nvim_buf_get_name(buffer)
        local buf_filetype = vim.api.nvim_buf_get_option(buffer, "filetype")

        if buf_name == "" then
          should_wipeout = true
        end

        if not should_wipeout then
          for _, skip_filetype in ipairs(skip_filetypes) do
            if buf_filetype == skip_filetype then
              should_wipeout = true
              break
            end
          end
        end

        if should_wipeout then
          vim.api.nvim_command("bwipeout! " .. buffer)
        end
      end
    end,
  },
}
