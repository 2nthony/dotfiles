local icons_filetype = require("config.icons").get("filetype")

local tailwind = {
  icon = icons_filetype.tailwind,
  color = "#38bdf8",
  name = "Tailwind",
}

local svg = {
  icon = icons_filetype.svg,
  color = "#FFB13B",
  name = "Svg",
}

return {
  "nvim-tree/nvim-web-devicons",
  opts = {
    override_by_filename = {
      ["tailwind.config.js"] = tailwind,
      ["tailwind.config.cjs"] = tailwind,
      ["tailwind.config.ts"] = tailwind,
    },
    override_by_extension = {
      svg = svg,
    },
  },
}
