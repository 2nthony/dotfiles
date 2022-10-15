-- THIS is a "NEVER GO BACK" action, but if you
-- wish, copy this file https://github.com/LunarVim/LunarVim/blob/rolling/snapshots/default.json
-- to `/.local/share/lunarvim/lvim/snapshots/default.json`

-- related files
-- https://github.com/LunarVim/LunarVim/blob/91ac8a0bb0eefc31815371454bcf59aa72d0acc3/lua/lvim/plugins.lua#L291-L305
-- https://github.com/LunarVim/LunarVim/blob/91ac8a0bb0eefc31815371454bcf59aa72d0acc3/utils/ci/generate_new_lockfile.lua#L60-L115

-- related docs
-- https://github.com/wbthomason/packer.nvim#user-autocommands
-- https://www.lunarvim.org/docs/plugins#pinning-strategy

-- Data struct:
-- {}, means to latest
-- or
-- { commit = "hash" }, means specified a commit
local override_snapshots = {
  ["nvim-lspconfig"] = {},
  ["mason.nvim"] = {},
  ["mason-lspconfig.nvim"] = {},
}

local utils = require("lvim.utils")
local default_snapshot = utils.join_paths(get_lvim_base_dir(), "snapshots", "default.json")

local new_default_snapshot = {}

local default_snapshot_content = vim.fn.readfile(default_snapshot)
local default_snapshot_json = vim.fn.json_decode(default_snapshot_content)

for key, value in pairs(default_snapshot_json) do
  new_default_snapshot[key] = override_snapshots[key] or value
end

local write_lvim_default_snapshot_file = function()
  local fd = assert(io.open(default_snapshot, "w"))
  fd:write(vim.fn.json_encode(new_default_snapshot), "\n")
  fd:flush()
end

vim.api.nvim_create_autocmd("User", {
  pattern = "PackerComplete",
  once = true,
  callback = function()
    write_lvim_default_snapshot_file()
  end,
})
