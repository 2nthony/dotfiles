local M = {}

-- these filetypes should skip some features
M.skip_features_filetypes = {
  "",
  "bigfile",
  "DressingInput",
  "DressingSelect",
  "NeogitCommitMessage",
  "NeogitCommitView",
  "NeogitConsole",
  "NeogitStatus",
  "NeogitPopup",
  "NeogitLogPopup",
  "NvimTree",
  "Outline",
  "OverseerList",
  "OverseerForm",
  "TelescopePrompt",
  "Trouble",
  "alpha",
  "dashboard",
  "dirvish",
  "fugitive",
  "gitcommit",
  "help",
  "lazy",
  "lazyterm",
  "lsgsagaoutline",
  "lspinfo",
  "neo-tree",
  "neo-tree-popup",
  "noice",
  "norg",
}

return M
