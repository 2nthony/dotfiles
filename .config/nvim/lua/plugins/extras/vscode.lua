if not vim.g.vscode then
  return {}
end

local lazykeys = require("util.keymap").lazykeys

local keys = {
  -- reset
  { "<leader>bd", "<nop>" },
  { "<leader>bD", "<nop>" },

  -- bindings
  { "u", ":call VSCodeNotify('undo')<cr>" },
  { "<c-r>", ":call VSCodeNotify('redo')<cr>" },

  { "ss", ":call VSCodeNotify('workbench.action.splitEditorDown')<cr>" },
  { "sv", ":call VSCodeNotify('workbench.action.splitEditor')<cr>" },
  { "sh", ":call VSCodeNotify('workbench.action.focusLeftGroup')" },
  { "sl", ":call VSCodeNotify('workbench.action.focusRightGroup')" },
  { "sk", ":call VSCodeNotify('workbench.action.focusAboveGroup')" },
  { "sj", ":call VSCodeNotify('workbench.action.focusBelowGroup')" },
  { "gi", ":call VSCodeNotify('editor.action.goToImplementation')<cr>" },
  { "gp", ":call VSCodeNotify('editor.action.peekDefinition')<cr>" },
  { "gP", ":call VSCodeNotify('editor.action.peekTypeDefinition')<cr>" },
  { "<leader>e", ":call VSCodeNotify('workbench.view.explorer')<cr>" },
  { "<leader>fe", "<leader>e", remap = true },
  { "<leader>ff", ":call VSCodeNotify('workbench.action.quickOpen')<cr>" },
  { "<leader>fp", ":call VSCodeNotify('workbench.action.openRecent')<cr>" },
  { "<leader>fn", ":call VSCodeNotify('workbench.action.files.newUntitledFile')<cr>" },
  { "<leader>wo", ":call VSCodeNotify('workbench.action.toggleZenMode')<cr>" },
  { "<leader>gg", ":call VSCodeNotify('workbench.view.scm')<cr>" },

  { "<c-j>", ":call VSCodeNotify('editor.action.marker.next')<cr>" },
  { "J", ":call VSCodeNotify('editor.action.marker.prev')<cr>" },
  { "<c-k>", ":call VSCodeNotify('editor.action.triggerParameterHints')<cr>", mode = { "n", "i" } },
  { "<leader>ca", ":call VSCodeNotify('editor.action.quickFix')<cr>" },
  { "<leader>cA", ":call VSCodeNotify('editor.action.sourceAction')<cr>" },
  { "<leader>cr", ":call VSCodeNotify('editor.action.rename')<cr>" },
  { "<leader>cf", ":call VSCodeNotify('editor.action.formatDocument')<cr>" },
}

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymaps",
  callback = function()
    lazykeys(keys)
  end,
})

return {
  { import = "lazyvim.plugins.extras.vscode" },
}
