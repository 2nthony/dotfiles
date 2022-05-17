local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

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
-- Save with root permission
vim.cmd([[
  command! W w !sudo tee > /dev/null %
]])
-- Search for selected text, forwards or backwards.
vim.cmd([[
  vnoremap <silent> * :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy/<C-R><C-R>=substitute(
    \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>
  vnoremap <silent> # :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy?<C-R><C-R>=substitute(
    \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>
]])
-- remap macro record key
keymap("n", "Q", "q", opts)
-- cancel q
keymap("n", "q", "<Nop>", opts)
-- no highlight
keymap("n", "<leader>l", ":nohl<cr>", opts)

--[[ Tab ]]

-- Buffer
keymap('n', '<leader>q', ':bdelete<cr>', opts)
keymap('n', '<leader>Q', ':bdelete!<cr>', opts)

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

-- telescope
local status_telescope_ok = pcall(require, 'telescope')
if status_telescope_ok then
  keymap('n', 'ff', ':Telescope find_files<CR>', opts)
  keymap('n', 'fr', ':Telescope live_grep<CR>', opts)
  keymap('n', 'fb', ':Telescope buffers<CR>', opts)
  keymap('n', 'f;', ':Telescope help_tags<CR>', opts)
end

-- nvim-tree
local status_nvim_tree_ok = pcall(require, 'nvim-tree')
if (status_nvim_tree_ok) then
  keymap('n', 'fe', ':NvimTreeToggle<cr>', opts)
  keymap('n', '<space>f', ':NvimTreeFindFile<cr>', opts)
end

-- bufferline
local status_bufferline_ok = pcall(require, 'bufferline')
if (status_bufferline_ok) then
  keymap('n', 'te', ':BufferLineCycleNext<CR>', opts)
  keymap('n', 'tw', ':BufferLineCyclePrev<CR>', opts)
end

-- nvim-spectre
local status_nvim_spectre_ok = pcall(require, 'spectre')
if (status_nvim_spectre_ok) then
  keymap('n', ';S', ':lua require("spectre").open()<cr>', opts)
  keymap('n', ';sw', ':lua require("spectre").open_visual({select_word=true})<cr>', opts)
  keymap('n', ';s', ':lua require("spectre").open_visual()<cr>', opts)
  keymap('n', ';sp', ':lua require("spectre").open_file_search()<cr>', opts)
end

-- diffview
-- see after/plugin/diffivew.lua key_bindinds

-- whichkey
-- see after/plugin/whichkey.lua mappings
local status_which_key_ok = pcall(require, "which-key")
if status_which_key_ok then
  keymap('n', '<space>k', ':WhichKey<CR><space>', opts)
end
