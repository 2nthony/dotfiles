-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- [[ Normal / Origin ]]

keymap('n', '<S-C-p>', '"0p', opts)
-- Delete without yank
keymap('n', '<leader>d', '"_d', opts)
keymap('n', 'x', '"_x', opts)

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', opts)

-- Delete a word backwards
keymap('n', 'dw', 'vb"_d', opts)

-- remap macro record key
keymap("n", "Q", "q", opts)

-- cancel q
keymap("n", "q", "<Nop>", opts)

-- :tabedit - new tab
keymap("n", "<C-n>", ":tabedit<cr>", opts)

-- :bdelete
keymap("n", "<space>bd", ":bdelete<cr>", opts)
keymap("n", "<space>bD", ":bdelete!<cr>", opts)

-- better ^, move cursor to start of line
keymap('n', '<C-h>', '<Home>^', opts)
keymap('i', '<C-h>', '<Home><Esc>^i', opts)
keymap('v', '<C-h>', '<Home>^', opts)
keymap('n', '<C-S-h>', '<Home>', opts)
keymap('i', '<C-S-h>', '<Home><Esc>i', opts)
keymap('v', '<C-S-h>', '<Home>', opts)

-- better $
keymap('n', '<C-l>', '<End>', opts)
keymap('i', '<C-l>', '<End>', opts)
keymap('v', '<C-l>', '<End>', opts)

--[[ Window ]]

-- Split window
keymap('n', 'ss', ':split<cr>', opts)
keymap('n', 'sv', ':vsplit<cr>', opts)

-- Switch window
keymap('n', 'sh', '<C-w>h', opts)
keymap('n', 'sk', '<C-w>k', opts)
keymap('n', 'sj', '<C-w>j', opts)
keymap('n', 'sl', '<C-w>l', opts)

-- Resize window
keymap('n', '<C-left>', '<C-w><', opts)
keymap('n', '<C-right>', '<C-w>>', opts)
keymap('n', '<C-up>', '<C-w>-', opts)
keymap('n', '<C-down>', '<C-w>+', opts)

--[[ Plugins ]]

-- nvim-tree
keymap('n', 'fe', ':NvimTreeToggle<cr>', opts)
keymap('n', 'fd', ':NvimTreeFindFile<cr>', opts)

-- bufferline
keymap('n', '<s-tab>', ':BufferLineCyclePrev<CR>', opts)
keymap('n', '<tab>', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<C-b>p', ':BufferLinePick<CR>', opts)
keymap('n', '<C-b>x', ':BufferLinePickClose<CR>', opts)

-- telescope
keymap('n', 'ff', ':Telescope find_files<CR>', opts)
keymap('n', 'fr', ':Telescope live_grep<CR>', opts)
keymap('n', 'fb', ':Telescope buffers<CR>', opts)
keymap('n', 'fo', ':Telescope oldfiles<CR>', opts)
keymap('n', 'fh', ':Telescope help_tags<CR>', opts)

-- terminal / toggleterm
keymap('n', 'git', ':lua TOGGLE_LAZYGIT()<cr>', opts)

-- lspsaga
local status_lspsaga_ok = pcall(require, "lspsaga")
if status_lspsaga_ok then
  keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  keymap('n', '<S-C-j>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  keymap('n', '<C-k>', '<Cmd>Lspsaga hover_doc<CR>', opts)
  -- removed
  -- https://github.com/glepnir/lspsaga.nvim/issues/502#issuecomment-1236949596
  -- keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
  keymap('n', 'sd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
  keymap('n', 'sp', '<Cmd>Lspsaga peek_definition<CR>', opts)
  keymap('n', 'sr', '<Cmd>Lspsaga rename<CR>', opts)
  keymap('n', 'sca', '<cmd>Lspsaga code_action<CR>', opts)
  keymap('v', 'sca', '<cmd><C-U>Lspsaga range_code_action<CR>', opts)
  keymap('n', 'so', '<Cmd>Lspsaga outline<CR>', opts)
end

-- nvim-spectre
local status_nvim_spectre_ok = pcall(require, 'spectre')
if (status_nvim_spectre_ok) then
  keymap('n', '<space>S', ':lua require("spectre").open()<cr>', opts)
  keymap('n', '<space>sw', ':lua require("spectre").open_visual({select_word=true})<cr>', opts)
  keymap('n', '<space>s', ':lua require("spectre").open_visual()<cr>', opts)
  keymap('n', '<space>sp', ':lua require("spectre").open_file_search()<cr>', opts)
end

-- gitsigns
local status_gitsigns_ok = pcall(require, "gitsigns")
if status_gitsigns_ok then
  -- Navigation
  keymap('n', 'gsj', ':Gitsigns next_hunk<CR>', opts)
  keymap('n', 'gsk', ':Gitsigns prev_hunk<CR>', opts)

  -- Actions
  keymap('n', 'gss', ':Gitsigns stage_hunk<CR>', opts)
  keymap('n', 'gsr', ':Gitsigns reset_hunk<CR>', opts)
  keymap('n', 'gsu', '<cmd>Gitsigns undo_stage_hunk<CR>', opts)
  keymap('n', 'gsS', '<cmd>Gitsigns stage_buffer<CR>', opts)
  keymap('n', 'gsR', '<cmd>Gitsigns reset_buffer<CR>', opts)
  keymap('n', 'gsp', '<cmd>Gitsigns preview_hunk<CR>', opts)
  keymap('n', 'gsb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', opts)
  keymap('n', 'gsb', '<cmd>Gitsigns toggle_current_line_blame<CR>', opts)
  keymap('n', 'gsd', '<cmd>Gitsigns diffthis<CR>', opts)
  keymap('n', 'gsD', '<cmd>lua require"gitsigns".diffthis("~")<CR>', opts)
  keymap('n', 'gsd', '<cmd>Gitsigns toggle_deleted<CR>', opts)

  -- Text object
  keymap('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts)
  keymap('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts)
end

-- trouble
local trouble_ok = pcall(require, "trouble")
if trouble_ok then
  keymap("n", "fwd", ":TroubleToggle workspace_diagnostics<CR>", opts)
end

-- todo-comments
local todo_ok = pcall(require, "todo-comments")
if todo_ok then
  if trouble_ok then
    keymap("n", "ftc", ":TodoTrouble<CR>", opts)
  else
    keymap("n", "ftc", ":TodoLocList<CR>", opts)
  end
else
end

-- leap
local leap_ok = pcall(require, "leap")
if leap_ok then
  keymap('n', 'gw', '<Plug>(leap-forward-to)', opts)
  keymap('n', 'gW', '<Plug>(leap-backward-to)', opts)
end
