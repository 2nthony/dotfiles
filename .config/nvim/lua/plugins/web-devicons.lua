local icons = require("config.icons")
local icons_filetype = icons.get("filetype")

local tailwind = { icon = icons_filetype.tailwind, color = "#38bdf8", name = "Tailwind" }
local json = { icon = icons_filetype.json, color = "#cbcb41", name = "json" }
local json5 = vim.tbl_extend("force", json, { name = "json5" })

return {
  "nvim-tree/nvim-web-devicons",
  opts = {
    override_by_filename = {
      ["tailwind.config.js"] = tailwind,
      ["tailwind.config.cjs"] = tailwind,
      ["tailwind.config.ts"] = tailwind,
    },
    override_by_extension = {
      json = json,
      json5 = json5,
    },
  },
}
