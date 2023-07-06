--FIXME: the 'down' not working and weird
local lazykeys = require("util.keymap").lazykeys

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

lazykeys({
  { "<s-a-j>", ":copy.<cr>" },
  { "<s-a-k>", ":copy.-1<cr>" },
  { "<s-a-j>", ":copy.-v:count<cr>gv", mode = { "v" } },
  {
    "<s-a-k>",
    function()
      duplicate_lines("up")
    end,
    mode = { "v" },
  },
})

return {}
