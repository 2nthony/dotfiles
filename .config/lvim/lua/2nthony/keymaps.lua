-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
local which_key = lvim.builtin.which_key

-- Shorten function name
local keymap = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
local wkeymappings = which_key.mappings

-- reset
keymap("n", "K", "<nop>")
keymap("n", "q", "<Nop>")
wkeymappings['c'] = nil
wkeymappings['e'] = nil
wkeymappings['p'] = nil
wkeymappings['l'] = nil
wkeymappings['L'] = nil

-- print current file path
keymap("n", "<C-g>", ":lua print(vim.fn.expand('%'))<cr>")
keymap("n", "<C-S-g>", ":lua print(vim.fn.expand('%:p'))<cr>")

keymap("i", "<C-enter>", "<esc>o")

keymap('n', '<S-C-p>', '"0p')

-- Delete
keymap("n", "d", '"_d')
keymap("v", "d", '"_d')
-- Delete a word backwards
keymap('n', 'dw', 'vb"_d')

-- Cut, then can paste
keymap("n", "xx", 'dd')

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G')

-- remap macro record key
keymap("n", "Q", "q")

-- :tabnew - new tab
keymap("n", "<C-n>", ":tabnew<cr>:Alpha<cr>")

-- better ^, move cursor to start of line
keymap('n', '<C-h>', '^')
keymap('i', '<C-h>', '<esc>^i')
keymap('v', '<C-h>', '^')
keymap('n', '<C-S-h>', '<Home>')
keymap('i', '<C-S-h>', '<Home>')
keymap('v', '<C-S-h>', '<Home>')

-- better $
keymap('n', '<C-l>', '<End>')
keymap('i', '<C-l>', '<End>')
keymap('v', '<C-l>', '<End><Left>')

-- Resize window
keymap('n', '<C-left>', '<C-w><')
keymap('n', '<C-right>', '<C-w>>')
keymap('n', '<C-up>', '<C-w>-')
keymap('n', '<C-down>', '<C-w>+')

-- init which key
wkeymappings['s'] = {
  name = 'switch, split, LSP',
  -- split window
  s = { ':split<cr>', 'split window' },
  v = { ':vsplit<cr>', 'vertical split window' },
  -- switch window
  h = { '<c-w>h', 'left window' },
  j = { '<c-w>j', 'above window' },
  k = { '<c-w>k', 'below window' },
  l = { '<c-w>l', 'right window' },
}
wkeymappings['f'] = { name = 'file, find' }
wkeymappings['g'] = { name = 'git, go' }
wkeymappings['v'] = { name = 'visual' }

wkeymappings['bd'] = { ':bdelete<cr>', 'Delete buffer' }
wkeymappings['bD'] = { ':bdelete!<cr>', 'Force delete buffer' }

wkeymappings['w'] = { ':w<cr>', 'Save' }
wkeymappings['W'] = { ':w!<cr>', 'Force Save' }

--[[ Plugins ]]
-- bufferline
keymap('n', '<s-tab>', ':BufferLineCyclePrev<CR>')
keymap('n', '<tab>', ':BufferLineCycleNext<CR>')

-- nvim-tree
wkeymappings['f']['e'] = { ':NvimTreeToggle<cr>', 'File explorer' }
wkeymappings['f']['d'] = { ':NvimTreeFindFile<cr>', 'File explorer locate file' }
wkeymappings['f']['f'] = { ':Telescope find_files<cr>', 'Find Files' }
wkeymappings['f']['o'] = { ':Telescope oldfiles<cr>', 'Find Old Files' }
wkeymappings['f']['b'] = { ':Telescope buffers<cr>', 'Find Buffers' }
wkeymappings['f']['h'] = { ':Telescope help_tags<cr>', 'Find Help' }
wkeymappings['f']['r'] = { ':Telescope live_grep<cr>', 'Live Grep' }
wkeymappings['f']['c'] = { ":Telescope git_status<cr>", "Open changed file" }
wkeymappings['f']['wd'] = { ':TroubleToggle workspace_diagnostics<cr>' }

-- trouble
local trouble_ok = pcall(require, "trouble")
if trouble_ok then
  wkeymappings['f']['wd'] = { ':TroubleToggle workspace_diagnostics<cr>', 'Workspace diagnostics' }
end
-- todo-comments
local todo_ok = pcall(require, "todo-comments")
wkeymappings['f']['t'] = { name = 'todo comments' }
if todo_ok then
  local cmd = ':TodoLocList<cr>'
  if trouble_ok then
    cmd = ':TodoTrouble<cr>'
  end
  wkeymappings['f']['t']['c'] = { cmd, 'Todos' }
else
end

-- nvim-spectre
local status_nvim_spectre_ok = pcall(require, 'spectre')
if (status_nvim_spectre_ok) then
  wkeymappings['f']['v'] = { ':lua require("spectre").open_visual()<cr>', 'Find text' }
  wkeymappings['f']['p'] = { ':lua require("spectre").open_file_search()<cr>', 'Find text current file path' }
end

-- toggleterm
local toggleterm_ok = pcall(require, 'toggleterm')
if toggleterm_ok then
  wkeymappings['g']['it'] = { ':lua LAZYGIT_TOGGLE()<cr>', 'Lazygit' }
end

-- leap
local leap_ok = pcall(require, "leap")
if leap_ok then
  wkeymappings['g']['w'] = { '<Plug>(leap-forward-to)', 'Look forward word' }
  wkeymappings['g']['W'] = { '<Plug>(leap-backward-to)', 'Look behind word' }
end

-- gitsigns
local status_gitsigns_ok = pcall(require, "gitsigns")
if status_gitsigns_ok then
  wkeymappings['g']['s'] = {
    name = 'Gitsigns',
    j = { ":lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
    k = { ":lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
    l = { ":lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { ":lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { ":lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { ":lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { ":lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = { ":lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
    d = { ":Gitsigns diffthis HEAD<cr>", "Git Diff" },
  }
end

-- lspsaga
local status_lspsaga_ok = pcall(require, "lspsaga")
if status_lspsaga_ok then
  keymap('n', '<C-j>', ':Lspsaga diagnostic_jump_next<CR>')
  keymap('n', 'J', ':Lspsaga diagnostic_jump_prev<CR>')
  keymap('n', '<C-k>', ':Lspsaga hover_doc ++quiet<CR>')
  -- removed
  -- https://github.com/glepnir/lspsaga.nvim/issues/502#issuecomment-1236949596
  -- keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>')
  keymap('i', '<C-k>', ':lua vim.lsp.buf.signature_help()<CR>')
  wkeymappings['s']['d'] = { ':Lspsaga lsp_finder<cr>', 'LSP finder' }
  wkeymappings['s']['p'] = { ':Lspsaga peek_definition<cr>', 'Peek definition' }
  wkeymappings['s']['r'] = { ':Lspsaga rename<cr>', 'LSP rename' }
  wkeymappings['s']['o'] = { ':Lspsaga outline<cr>', 'LSP outline' }
  wkeymappings['s']['ca'] = { ':Lspsaga code_action<cr>', 'LSP code action' }
end

-- visual-multi
-- https://github.com/mg979/vim-visual-multi/wiki/Mappings#full-mappings-list
vim.cmd([[
  let g:VM_default_mappings = 0
  let g:VM_maps = {}
  let g:VM_maps["Find Under"] = ''
  let g:VM_maps["Find Subword Under"] = ''
]])
wkeymappings['v']['d'] = { '<Plug>(VM-Find-Under)', 'select multi word, `n` next' }
wkeymappings['v']['c'] = { '<Plug>(VM-Add-Cursor-At-Pos)', 'add cursor' }
wkeymappings['v']['j'] = { '<Plug>(VM-Add-Cursor-Down)', 'add cursor down' }
wkeymappings['v']['k'] = { '<Plug>(VM-Add-Cursor-Up)', 'add cursor up' }

-- surround
local surround_ok, surround = pcall(require, 'surround-ui')
if surround_ok then
  surround.setup {
    root_key = 'S'
  }
end

-- map to global
require("which-key").register({
  f = wkeymappings['f'],
  g = wkeymappings['g'],
  s = wkeymappings['s'],
})
