-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = require("util.keymap").map
local maps = require("util.keymap").maps

-- reset
map({ "q", nil })
map({ "gt", nil })
map({ "gT", nil })

-- reset window navigation
map({ "<c-h>", nil, mode = { "n", "t" } })
map({ "<c-j>", nil, mode = { "n", "t" } })
map({ "<c-k>", nil, mode = { "n", "t" } })
map({ "<c-l>", nil, mode = { "n", "t" } })

-- reset terminal navigation
map({ "<c-w>", "<c-w>", mode = { "t" } })

-- remap macrp record key
map({ "Q", "q" })

-- delete is not cut
-- https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim/30423919#30423919
-- Delete, d
map({ "d", '"_d', mode = { "n", "x" } })
map({ "D", '"_D', mode = { "n", "x" } })
map({ "x", '"_x', mode = { "n", "x" } })
map({ "X", '"_X', mode = { "n", "x" } })
-- Cut, x
map({ "x", "d", mode = { "n", "x" } })
map({ "xx", "dd" })
map({ "X", "D", mode = { "n", "x" } })

-- Delete a word backwards
map({ "db", 'vb"_d', desc = "Delete a word backwards" })

-- Visual paste, don't yank
-- changed to `x(visual)` only, see https://github.com/L3MON4D3/LuaSnip/issues/748#issuecomment-1407325131
map({ "p", '"_dP', mode = "x" })

-- enhance enter
map({
  "<c-enter>",
  function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_put({ "" }, "l", true, true)
    vim.api.nvim_win_set_cursor(0, { row + 1, col })
  end,
  mode = { "n", "i" },
})
map({
  "<s-c-enter>",
  function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_put({ "" }, "l", false, true)
    vim.api.nvim_win_set_cursor(0, { row, col })
  end,
  mode = { "n", "i" },
})

-- better ^, move cursor to start of line
map({
  "<c-h>",
  function()
    vim.cmd("normal! ^")
  end,
  mode = { "n", "i", "v" },
  desc = "Better ^",
})
map({ "<c-s-h>", "<home>", mode = { "n", "i", "v" } })

-- better $
map({ "<c-l>", "g_", mode = { "n", "v" }, desc = "Better $" })
map({ "<c-l>", "<end>", mode = { "i" }, desc = "Better $" })

-- scroll window one line up/down
-- https://stackoverflow.com/a/14308057
map({ "<c-e>", "<c-x><c-e>", mode = "i" })
map({ "<c-y>", "<c-x><c-y>", mode = "i" })

map({
  "<c-z>",
  function()
    vim.cmd("undo")
  end,
  desc = "Undo",
})

-- copy lines actions
---@param direction 'up'|'down'
local function duplicate_lines(direction)
  local startline = vim.fn.line("v")
  local endline = vim.fn.getcurpos()[2]

  -- swap
  if startline > endline then
    startline, endline = endline, startline
  end

  local texts = vim.api.nvim_buf_get_lines(0, startline - 1, endline, true)

  if direction == "up" then
    vim.api.nvim_buf_set_lines(0, endline, endline, true, texts)
  elseif direction == "down" then
    vim.api.nvim_buf_set_lines(0, startline, startline + 1, true, texts)
  end
end

maps({
  { "<s-m-j>", ":copy.<cr>" },
  { "<s-m-k>", ":copy.-1<cr>" },
  { "<s-m-j>", ":copy.-v:count<cr>gv", mode = { "v" } },
  {
    "<s-m-k>",
    function()
      duplicate_lines("up")
    end,
    mode = { "v" },
  },
})
