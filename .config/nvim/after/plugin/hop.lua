-- https://github.com/phaazon/hop.nvim
local status_hop_ok, hop = pcall(require, "hop")
if not status_hop_ok then
  return
end
hop.setup()
