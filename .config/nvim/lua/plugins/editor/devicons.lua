local icons_filetype = require("config.icons").get("filetype")

local tailwind = {
  icon = icons_filetype.tailwind,
  color = "#38bdf8",
  name = "Tailwind",
}

return {
  "nvim-tree/nvim-web-devicons",
  opts = {
    override_by_filename = {
      ["tailwind.config.js"] = tailwind,
      ["tailwind.config.cjs"] = tailwind,
    },
  },
}
