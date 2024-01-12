if not vim.g.vscode then
  return {}
end

vim.opt.timeoutlen = 1000

local lazykeys = require("util.keymap").lazykeys

local keys = {
  -- reset
  { "<leader>bd", "<nop>" },
  { "<leader>bD", "<nop>" },

  -- bindings
  { "u", ":call VSCodeNotify('undo')<cr>" },
  { "<c-r>", ":call VSCodeNotify('redo')<cr>" },

  { "H", ":call VSCodeNotify('workbench.action.previousEditor')<cr>" },
  { "L", ":call VSCodeNotify('workbench.action.nextEditor')<cr>" },
  { "ss", ":call VSCodeNotify('workbench.action.splitEditorDown')<cr>" },
  { "sv", ":call VSCodeNotify('workbench.action.splitEditor')<cr>" },
  { "sh", ":call VSCodeNotify('workbench.action.focusLeftGroup')<cr>" },
  { "sl", ":call VSCodeNotify('workbench.action.focusRightGroup')<cr>" },
  { "sk", ":call VSCodeNotify('workbench.action.focusAboveGroup')<cr>" },
  { "sj", ":call VSCodeNotify('workbench.action.focusBelowGroup')<cr>" },
  { "gi", ":call VSCodeNotify('editor.action.goToImplementation')<cr>" },
  { "gp", ":call VSCodeNotify('editor.action.peekDefinition')<cr>" },
  { "gP", ":call VSCodeNotify('editor.action.peekTypeDefinition')<cr>" },
  { "gcc", ":call VSCodeNotify('editor.action.commentLine')<cr>" },
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

  { "[h", ":call VSCodeNotify('workbench.action.editor.previousChange')<cr>" },
  { "]h", ":call VSCodeNotify('workbench.action.editor.nextChange')<cr>" },
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
