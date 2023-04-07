-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local has = require("lazyvim.util").has
local wk = require("which-key")
local map = require("util.keymap").map

-- reset
map("n", "K", "<nop>")
map("n", "q", "<Nop>")

-- print current file path
map("n", "<C-g>", ":lua print(vim.fn.expand('%'))<cr>")
map("n", "<C-S-g>", ":lua print(vim.fn.expand('%:p'))<cr>")

map("n", "<C-enter>", "o<esc>")
map("i", "<C-enter>", "<esc>o")

map("n", "<S-C-p>", '"0p')

-- https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim/30423919#30423919
-- Delete, d
map("n", "d", '"_d')
map("n", "D", '"_D')
map("v", "d", '"_d')
-- Cut, x
map("n", "x", '""d')
map("n", "xx", "dd")
-- Delete a word backwards
map("n", "dw", 'vb"_d')

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- remap macro record key
map("n", "Q", "q")

-- :tabnew - new tab
local newtab_cmd = ":tabnew<cr>"
if has("alpha-nvim") then
  newtab_cmd = newtab_cmd .. ":Alpha<cr>"
end
map("n", "<C-n>", newtab_cmd)

-- better ^, move cursor to start of line
map("n", "<C-h>", "^")
map("i", "<C-h>", "<esc>^i")
map("v", "<C-h>", "^")
map("n", "<C-S-h>", "<Home>")
map("i", "<C-S-h>", "<Home>")
map("v", "<C-S-h>", "<Home>")

-- better $
map("n", "<C-l>", "<End>")
map("i", "<C-l>", "<End>")
map("v", "<C-l>", "<End><Left>")

-- Resize window
map("n", "<C-left>", "<C-w><")
map("n", "<C-right>", "<C-w>>")
map("n", "<C-up>", "<C-w>-")
map("n", "<C-down>", "<C-w>+")

-- Better indenting <>, keeps selection
-- https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/keymappings.lua
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move line(s), like vscode
-- https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/keymappings.lua
map("n", "<A-j>", ":m .+1<cr>==")
map("n", "<A-k>", ":m .-2<cr>==")
map("i", "<A-j>", "<esc>:m .+1<cr>==gi")
map("i", "<A-k>", "<esc>:m .-2<cr>==gi")
map("v", "<A-j>", ":m '>+1<cr>gv-gv")
map("v", "<A-k>", ":m '<-2<cr>gv-gv")

local wkmap = { mode = { "n" } }
wkmap[";"] = { ":Alpha<cr>", "Alpha" }
wkmap["s"] = {
  name = "switch, split, LSP",
  -- split window
  s = { ":split<cr>", "split window" },
  v = { ":vsplit<cr>", "vertical split window" },
  -- switch window
  h = { "<c-w>h", "left window" },
  j = { "<c-w>j", "above window" },
  k = { "<c-w>k", "below window" },
  l = { "<c-w>l", "right window" },
}
wkmap["b"] = { name = "buffer" }
wkmap["f"] = { name = "file, find" }
wkmap["g"] = { name = "git, go" }
wkmap["v"] = { name = "visual" }

wkmap["h"] = {
  name = "highlight",
  d = { "gd", "Search identify (gd)" },
  w = { "/\\<<C-R>=expand('<cword>')<CR>\\><CR>", "Search current word below" },
  W = { "?\\<<C-R>=expand('<cword>')<CR>\\><CR>", "Search current word above" },
  l = { ":nohlsearch<cr>", "No highlight search" },
}

wkmap["b"]["d"] = { ":bdelete<cr>", "Delete buffer" }
wkmap["b"]["D"] = { ":bdelete!<cr>", "Delete buffer (force)" }

if has("bufferline.nvim") then
  map("n", "<s-tab>", ":BufferLineCyclePrev<CR>")
  map("n", "<tab>", ":BufferLineCycleNext<CR>")
  wkmap["b"]["p"] = { ":BufferLineTogglePin<cr>", "Toggle pin buffer" }
  wkmap["b"]["P"] = { ":BufferLineGroupClose ungrouped<cr>", "Delete non-pinned buffers" }
end

if has("lspsaga.nvim") then
  map("n", "<C-j>", ":Lspsaga diagnostic_jump_next<CR>")
  map("n", "J", ":Lspsaga diagnostic_jump_prev<CR>")
  map("n", "<C-k>", ":Lspsaga hover_doc ++quiet<CR>")
  -- removed
  -- https://github.com/glepnir/lspsaga.nvim/issues/502#issuecomment-1236949596
  -- map('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>')
  map("i", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>")
  wkmap["s"]["f"] = { ":Lspsaga lsp_finder<cr>", "LSP finder" }
  wkmap["s"]["p"] = { ":Lspsaga peek_definition<cr>", "Peek definition" }
  wkmap["s"]["P"] = { ":Lspsaga peek_type_definition<cr>", "Peek type definition" }
  wkmap["s"]["g"] = { ":Lspsaga goto_definition<cr>", "Goto definition" }
  wkmap["s"]["G"] = { ":Lspsaga goto_type_definition<cr>", "Goto type definition" }
  wkmap["s"]["r"] = { ":Lspsaga rename<cr>", "LSP rename" }
  wkmap["s"]["o"] = { ":Lspsaga outline<cr>", "LSP outline" }
  wkmap["s"]["c"] = {
    name = "code, call hierarchy",
    a = { ":Lspsaga code_action<cr>", "LSP code action" },
    i = { ":Lspsaga incoming_calls<cr>", "Incoming calls" },
    o = { ":Lspsaga outgoing_calls<cr>", "Outgoing calls" },
  }
  wkmap["s"]["d"] = {
    name = "Show diagnostics",
    c = { ":Lspsaga show_cursor_diagnostics<cr>", "Show cursor diagnostics" },
    l = { ":Lspsaga show_line_diagnostics<cr>", "Show line diagnostics" },
    b = { ":Lspsaga show_buf_diagnostics<cr>", "Show buffer diagnostics" },
    w = { ":Lspsaga show_workspace_diagnostics<cr>", "Show workspace diagnostics" },
  }
end

if has("nvim-tree.lua") then
  wkmap["f"]["e"] = { ":NvimTreeToggle<cr>", "File explorer" }
  wkmap["f"]["d"] = { ":NvimTreeFindFile<cr>", "File explorer locate file" }
end

if has("neo-tree.nvim") then
  wkmap["f"]["e"] = { ":Neotree toggle<cr>", "File explorer" }
  wkmap["f"]["d"] = { ":Neotree reveal<cr>", "File explorer reveal file" }
end

if has("telescope.nvim") then
  wkmap["f"]["f"] = { ":Telescope find_files<cr>", "Find Files" }
  wkmap["f"]["o"] = { ":Telescope oldfiles<cr>", "Find Old Files" }
  wkmap["f"]["b"] = { ":Telescope buffers<cr>", "Find Buffers" }
  wkmap["f"]["h"] = { ":Telescope help_tags<cr>", "Find Help" }
  wkmap["f"]["r"] = { ":Telescope live_grep<cr>", "Live Grep" }
  wkmap["f"]["c"] = { ":Telescope git_status<cr>", "Find git changed file" }
end

if has("gitsigns.nvim") then
  -- lazy call
  local gs = function(cmd, opts)
    return function()
      local fn = require("gitsigns")
      fn[cmd](opts)
    end
  end

  wkmap["g"]["s"] = {
    name = "Gitsigns",
    j = { gs("next_hunk", { navigation_message = false }), "Next Hunk" },
    k = { gs("prev_hunk", { navigation_message = false }), "Prev Hunk" },
    l = { gs("blame_line"), "Blame" },
    p = { gs("preview_hunk"), "Preview Hunk" },
    r = { gs("reset_hunk"), "Reset Hunk" },
    R = { gs("reset_buffer"), "Reset Buffer" },
    s = { gs("stage_hunk"), "Stage Hunk" },
    S = { gs("stage_buffer"), "Stage Buffer" },
    u = { gs("undo_stage_hunk"), "Undo Stage Hunk" },
  }
end

if has("diffview.nvim") then
  wkmap["g"]["d"] = {
    name = "Git Diffview",
    o = { ":DiffviewOpen<cr>", "Open" },
    c = { ":DiffviewClose<cr>", "Close" },
    f = { ":DiffviewFocusFiles<cr>", "Focus files" },
    h = { ":DiffviewFileHistory<cr>", "File history" },
    t = { ":DiffviewToggleFiles<cr>", "Toggle files" },
    r = { ":DiffviewRefresh<cr>", "Refresh" },
  }
end

wkmap["f"]["t"] = { name = "Todo, trouble" }
if has("trouble.nvim") then
  wkmap["f"]["t"]["w"] = { ":TroubleToggle workspace_diagnostics<cr>", "Trouble workspace" }
end
if has("todo-comments.nvim") then
  local cmd = ":TodoLocList<cr>"
  if has("trouble.nvim") then
    cmd = ":TodoTrouble<cr>"
  end

  wkmap["f"]["t"]["d"] = { cmd, "todo" }
end

if has("nvim-spectre") then
  wkmap["f"]["v"] = { ':lua require("spectre").open_visual()<cr>', "Find text" }
  wkmap["f"]["p"] = { ':lua require("spectre").open_file_search()<cr>', "Find text current file path" }
end

if has("toggleterm.nvim") then
  wkmap["g"]["it"] = { require("util.git").lazygit, "Lazygit" }
end

if has("leap.nvim") then
  wkmap["g"]["w"] = { "<Plug>(leap-forward-to)", "Look forward word" }
  wkmap["g"]["W"] = { "<Plug>(leap-backward-to)", "Look behind word" }
end

if has("mini.surround") then
  wkmap["g"].name = wkmap["g"].name .. ", surround"
  wkmap["g"]["z"] = { name = "Surround (mini)" }
end

if has("vim-visual-multi") then
  wkmap["v"]["d"] = { "<Plug>(VM-Find-Under)", "select multi word, `n` next" }
  wkmap["v"]["c"] = { "<Plug>(VM-Add-Cursor-At-Pos)", "add cursor" }
  wkmap["v"]["j"] = { "<Plug>(VM-Add-Cursor-Down)", "add cursor down" }
  wkmap["v"]["k"] = { "<Plug>(VM-Add-Cursor-Up)", "add cursor up" }
end

-- global, no prefix needed
wk.register({
  s = wkmap["s"],
  f = wkmap["f"],
  g = wkmap["g"],
})

-- all prefix needed
wk.register(wkmap, { prefix = "<leader>" })
