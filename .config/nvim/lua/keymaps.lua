local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--[[ Normal/Origin ]]

keymap('n', '<S-C-p>', '"0p', opts)
-- Delete without yank
keymap('n', '<leader>d', '"_d', opts)
keymap('n', 'x', '"_x', opts)

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', opts)

-- Delete a word backwards
keymap('n', 'dw', 'vb"_d', opts)

-- Save with root permission (not working for now)
-- vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- remap macro record key
keymap("n", "Q", "q", opts)

-- cancel q
keymap("n", "q", "<Nop>", opts)

-- no highlight
keymap("n", "<space>l", ":nohl<cr>", opts)

-- :q
keymap("n", "<space>q", ":q<cr>", opts)
keymap("n", "<spance>Q", ":q!<cr>", opts)

-- :w
keymap("n", "<space>w", ":w<cr>", opts)

-- move cursor to start of line, better ^
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
keymap('n', 'ss', ':split<cr><C-w>w', opts)
keymap('n', 'sv', ':vsplit<cr><C-w>w', opts)

-- Move window
keymap('n', 'sh', '<C-w>h', opts)
keymap('n', 'sk', '<C-w>k', opts)
keymap('n', 'sj', '<C-w>j', opts)
keymap('n', 'sl', '<C-w>l', opts)

-- Resize window
keymap('n', '<C-left>', '<C-w><', opts)
keymap('n', '<C-right>', '<C-w>>', opts)
keymap('n', '<C-up>', '<C-w>-', opts)
keymap('n', '<C-down>', '<C-w>+', opts)


--[[ Plugin ]]

-- lspsaga
local status_lspsaga_ok = pcall(require, "lspsaga")
if status_lspsaga_ok then
  -- keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  -- keymap('n', '<S-C-j>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  -- keymap('n', '<C-k>', '<Cmd>Lspsaga hover_doc<CR>', opts)
  -- keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
  keymap('n', '<space>d', '<Cmd>Lspsaga lsp_finder<CR>', opts)
  keymap('n', '<space>p', '<Cmd>Lspsaga preview_definition<CR>', opts)
  keymap('n', '<space>r', '<Cmd>Lspsaga rename<CR>', opts)
  keymap('n', '<space>ca', '<cmd>Lspsaga code_action<CR>', opts)
  keymap('v', '<space>ca', '<cmd><C-U>Lspsaga range_code_action<CR>', opts)
end

-- telescope
local status_telescope_ok, telescope = pcall(require, 'telescope')
if status_telescope_ok then
  keymap('n', 'ff', ':Telescope find_files<CR>', opts)
  keymap('n', 'fr', ':Telescope live_grep<CR>', opts)
  keymap('n', 'fb', ':Telescope buffers<CR>', opts)
  keymap('n', 'fo', ':Telescope oldfiles<CR>', opts)
  keymap('n', 'f;', ':Telescope help_tags<CR>', opts)

  -- todo-comments
  local status_todo_comments_ok = pcall(require, 'todo-comments')
  if status_todo_comments_ok then
    keymap('n', 'ft', ':TodoTelescope<CR>', opts)
  end

  if telescope.extensions.vim_bookmarks ~= nil then
    keymap('n', 'fm', ':Telescope vim_bookmarks current_file<CR>', opts)
    keymap('n', 'fM', ':Telescope vim_bookmarks all<CR>', opts)
  end
end

-- nvim-tree
local status_nvim_tree_ok = pcall(require, 'nvim-tree')
if (status_nvim_tree_ok) then
  keymap('n', 'fe', ':NvimTreeToggle<cr>', opts)
  keymap('n', 'fd', ':NvimTreeFindFile<cr>', opts)
end

-- barbar.nvim
local status_barbar_ok = pcall(require, 'bufferline')
if status_barbar_ok then
  keymap('n', '<s-tab>', ':BufferPrevious<CR>', opts)
  keymap('n', '<tab>', ':BufferNext<CR>', opts)
  -- Goto buffer in position...
  keymap('n', ';1', ':BufferGoto 1<CR>', opts)
  keymap('n', ';2', ':BufferGoto 2<CR>', opts)
  keymap('n', ';3', ':BufferGoto 3<CR>', opts)
  keymap('n', ';4', ':BufferGoto 4<CR>', opts)
  keymap('n', ';5', ':BufferGoto 5<CR>', opts)
  keymap('n', ';6', ':BufferGoto 6<CR>', opts)
  keymap('n', ';7', ':BufferGoto 7<CR>', opts)
  keymap('n', ';8', ':BufferGoto 8<CR>', opts)
  keymap('n', ';9', ':BufferGoto 9<CR>', opts)
  keymap('n', ';0', ':BufferLast<CR>', opts)
  -- Close buffer
  keymap('n', ';x', ':BufferClose<CR>', opts)
  keymap('n', ';X', ':BufferClose!<CR>', opts)
  -- Magic buffer-picking mode
  keymap('n', ';bp', ':BufferPick<CR>', opts)
  -- Re-order to previous/next
  keymap('n', ';b[', ':BufferMovePrevious<CR>', opts)
  keymap('n', ';b]', ':BufferMoveNext<CR>', opts)
end

-- nvim-spectre
local status_nvim_spectre_ok = pcall(require, 'spectre')
if (status_nvim_spectre_ok) then
  keymap('n', '<space>S', ':lua require("spectre").open()<cr>', opts)
  keymap('n', '<space>sw', ':lua require("spectre").open_visual({select_word=true})<cr>', opts)
  keymap('n', '<space>s', ':lua require("spectre").open_visual()<cr>', opts)
  keymap('n', '<space>sp', ':lua require("spectre").open_file_search()<cr>', opts)
end

-- diffview
-- see after/plugin/diffivew.lua key_bindinds

-- gitsigns
local status_gitsigns_ok = pcall(require, "gitsigns")
if status_gitsigns_ok then
  -- Navigation
  keymap('n', 'gj', ':Gitsigns next_hunk<CR>', opts)
  keymap('n', 'gk', ':Gitsigns prev_hunk<CR>', opts)

  -- Actions 
  keymap('n', 'ghs', ':Gitsigns stage_hunk<CR>', opts)
  keymap('n', 'ghr', ':Gitsigns reset_hunk<CR>', opts)
  keymap('n', 'ghu', '<cmd>Gitsigns undo_stage_hunk<CR>', opts)
  keymap('n', 'ghS', '<cmd>Gitsigns stage_buffer<CR>', opts)
  keymap('n', 'ghR', '<cmd>Gitsigns reset_buffer<CR>', opts)
  keymap('n', 'ghp', '<cmd>Gitsigns preview_hunk<CR>', opts)
  keymap('n', 'ghb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', opts)
  keymap('n', 'gtb', '<cmd>Gitsigns toggle_current_line_blame<CR>', opts)
  keymap('n', 'ghd', '<cmd>Gitsigns diffthis<CR>', opts)
  keymap('n', 'ghD', '<cmd>lua require"gitsigns".diffthis("~")<CR>', opts)
  keymap('n', 'gtd', '<cmd>Gitsigns toggle_deleted<CR>', opts)

  -- Text object
  keymap('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts)
  keymap('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts)
end

-- whichkey
-- see after/plugin/whichkey.lua mappings
local status_which_key_ok = pcall(require, "which-key")
if status_which_key_ok then
  keymap('n', '<space>k', ':WhichKey<CR><space>', opts)
end

-- hop
local status_hop_ok = pcall(require, "hop")
if status_hop_ok then
  -- word
  keymap('n', 'gw', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", opts)
  keymap('v', 'gw', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", opts)
  keymap('o', 'gw', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>", opts)
  -- line
  keymap('n', 'gl', ':HopLine<cr>', opts)
  keymap('v', 'gl', ':HopLine<cr>', opts)
  keymap('o', 'gl', ':HopLine<cr>', opts)
end

-- goto-preview
local status_goto_preview_ok = pcall(require, 'goto-preview')
if status_goto_preview_ok then
  keymap('n', 'gpd', "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", opts)
  keymap('n', 'gpi', "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", opts)
  keymap('n', 'gP', "<cmd>lua require('goto-preview').close_all_win()<cr>", opts)

  if status_telescope_ok then
    keymap('n', 'gpr', "<cmd>lua require('goto-preview').goto_preview_references()<cr>", opts)
  end
end

-- toggleterm
local status_toggleterm_ok = pcall(require, "toggleterm")
if status_toggleterm_ok then
  keymap('n', 'git', ':lua _LAZYGIT_TOGGLE()<cr>', opts)
end

local status_trouble_ok = pcall(require, "trouble")
if status_trouble_ok then
  keymap('n', '<space>tt', '<cmd>TroubleToggle<cr>', opts)
  keymap('n', '<space>tw', '<cmd>TroubleToggle workspace_diagnostics<cr>', opts)
  keymap('n', '<space>td', '<cmd>TroubleToggle document_diagnostics<cr>', opts)
  keymap('n', '<space>tl', '<cmd>TroubleToggle loclist<cr>', opts)
  keymap('n', '<space>tq', '<cmd>TroubleToggle quickfix<cr>', opts)
  keymap('n', '<space>tr', '<cmd>TroubleToggle lsp_references<cr>', opts)
end
