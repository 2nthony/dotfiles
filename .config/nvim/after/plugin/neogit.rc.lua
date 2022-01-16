local status, neogit = pcall(require, "neogit")
if (not status) then return end

local opts = {}

if (vim.g.diffview_nvim_loaded) then
  opts.integrations = opts.integrations or {}
  opts.integrations.diffview = true
end

neogit.setup(opts)

