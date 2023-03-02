-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- Shorten function name
local keymap = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- [[ Normal / Origin ]]

-- reset
keymap("n", "K", "<nop>")

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

-- cancel q
keymap("n", "q", "<Nop>")

-- :tabnew - new tab
keymap("n", "<C-n>", ":tabnew<cr>:Alpha<cr>")

-- :bdelete
keymap("n", "<space>bd", ":bdelete<cr>")
keymap("n", "<space>bD", ":bdelete!<cr>")

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

--[[ Window ]]
-- Split window
keymap('n', 'ss', ':split<cr>')
keymap('n', 'sv', ':vsplit<cr>')

-- Switch window
keymap('n', 'sh', '<C-w>h')
keymap('n', 'sk', '<C-w>k')
keymap('n', 'sj', '<C-w>j')
keymap('n', 'sl', '<C-w>l')

-- Resize window
keymap('n', '<C-left>', '<C-w><')
keymap('n', '<C-right>', '<C-w>>')
keymap('n', '<C-up>', '<C-w>-')
keymap('n', '<C-down>', '<C-w>+')

--[[ Plugins ]]
-- nvim-tree
keymap('n', 'fe', ':NvimTreeToggle<cr>')
keymap('n', 'fd', ':NvimTreeFindFile<cr>')

-- bufferline
keymap('n', '<s-tab>', ':BufferLineCyclePrev<CR>')
keymap('n', '<tab>', ':BufferLineCycleNext<CR>')
keymap('n', '<C-b>p', ':BufferLinePick<CR>')
keymap('n', '<C-b>x', ':BufferLinePickClose<CR>')

-- telescope
keymap('n', 'ff', ':Telescope find_files<CR>')
keymap('n', 'fr', ':Telescope live_grep<CR>')
keymap('n', 'fb', ':Telescope buffers<CR>')
keymap('n', 'fo', ':Telescope oldfiles<CR>')
keymap('n', 'fh', ':Telescope help_tags<CR>')

-- terminal / toggleterm
keymap('n', 'git', ':lua LAZYGIT_TOGGLE()<cr>')

-- lspsaga
local status_lspsaga_ok = pcall(require, "lspsaga")
if status_lspsaga_ok then
  keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>')
  keymap('n', 'J', '<Cmd>Lspsaga diagnostic_jump_prev<CR>')
  keymap('n', '<C-k>', '<Cmd>Lspsaga hover_doc ++quiet<CR>')
  -- removed
  -- https://github.com/glepnir/lspsaga.nvim/issues/502#issuecomment-1236949596
  -- keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>')
  keymap('i', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>')
  keymap('n', 'sd', '<Cmd>Lspsaga lsp_finder<CR>')
  keymap('n', 'sp', '<Cmd>Lspsaga peek_definition<CR>')
  keymap('n', 'sr', '<Cmd>Lspsaga rename<CR>')
  keymap('n', 'sca', '<cmd>Lspsaga code_action<CR>')
  keymap('v', 'sca', '<cmd><C-U>Lspsaga range_code_action<CR>')
  keymap('n', 'so', '<Cmd>Lspsaga outline<CR>')
end

-- nvim-spectre
local status_nvim_spectre_ok = pcall(require, 'spectre')
if (status_nvim_spectre_ok) then
  keymap('n', '<space>S', ':lua require("spectre").open()<cr>')
  keymap('n', '<space>sw', ':lua require("spectre").open_visual({select_word=true})<cr>')
  keymap('n', '<space>s', ':lua require("spectre").open_visual()<cr>')
  keymap('n', '<space>sp', ':lua require("spectre").open_file_search()<cr>')
end

-- gitsigns
local status_gitsigns_ok = pcall(require, "gitsigns")
if status_gitsigns_ok then
  -- Navigation
  keymap('n', 'gsj', ':Gitsigns next_hunk<CR>')
  keymap('n', 'gsk', ':Gitsigns prev_hunk<CR>')

  -- Actions
  keymap('n', 'gss', ':Gitsigns stage_hunk<CR>')
  keymap('n', 'gsr', ':Gitsigns reset_hunk<CR>')
  keymap('n', 'gsu', '<cmd>Gitsigns undo_stage_hunk<CR>')
  keymap('n', 'gsS', '<cmd>Gitsigns stage_buffer<CR>')
  keymap('n', 'gsR', '<cmd>Gitsigns reset_buffer<CR>')
  keymap('n', 'gsp', '<cmd>Gitsigns preview_hunk<CR>')
  keymap('n', 'gsb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
  keymap('n', 'gsb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
  keymap('n', 'gsd', '<cmd>Gitsigns diffthis<CR>')
  keymap('n', 'gsD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
  keymap('n', 'gsd', '<cmd>Gitsigns toggle_deleted<CR>')

  -- Text object
  keymap('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  keymap('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end

-- trouble
local trouble_ok = pcall(require, "trouble")
if trouble_ok then
  keymap("n", "fwd", ":TroubleToggle workspace_diagnostics<CR>")
end

-- todo-comments
local todo_ok = pcall(require, "todo-comments")
if todo_ok then
  if trouble_ok then
    keymap("n", "ftc", ":TodoTrouble<CR>")
  else
    keymap("n", "ftc", ":TodoLocList<CR>")
  end
else
end

-- leap
local leap_ok = pcall(require, "leap")
if leap_ok then
  keymap('n', 'gw', '<Plug>(leap-forward-to)')
  keymap('n', 'gW', '<Plug>(leap-backward-to)')
end

-- visual-multi
-- https://github.com/mg979/vim-visual-multi/wiki/Mappings#full-mappings-list
vim.cmd([[
  let g:VM_default_mappings = 0
  let g:VM_maps = {}
  let g:VM_maps["Find Under"] = ''
  let g:VM_maps["Find Subword Under"] = ''
]])
-- press `n` select next word in this mode
keymap("n", "<C-S-d>", "<Plug>(VM-Find-Under)")
-- keymap("n", "<C-e>d", "<Plug>(VM-Find-Subword-Under)")
keymap("n", "<C-S-c>", "<Plug>(VM-Add-Cursor-At-Pos)")
keymap("n", "<C-S-j>", "<Plug>(VM-Add-Cursor-Down)")
keymap("n", "<C-S-k>", "<Plug>(VM-Add-Cursor-Up)")

-- alpha
keymap("n", "<space>a", ":Alpha<cr>")
