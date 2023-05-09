---@diagnostic disable: assign-type-mismatch

-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/keymaps.lua
local function disable_lsp_keymaps(disable_keys)
  local keys = require("lazyvim.plugins.lsp.keymaps").get()
  for _, key in ipairs(disable_keys or {}) do
    keys[#keys + 1] = { key, false }
  end
end

local M = {}

---@type LazyKeys[]
M.generals = {
  -- reset
  { "q", "<nop>" },

  -- reset window navigation
  { "<c-h>", "<nop>" },
  { "<c-j>", "<nop>" },
  { "<c-k>", "<nop>" },
  { "<c-l>", "<nop>" },

  -- remap macrp record key
  { "Q", "q" },

  -- impletemented in `cutlass.nvim`
  -- https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim/30423919#30423919
  -- Delete, d
  -- { "d", '"_d', mode = { "n", "v" } },
  -- { "D", '"_D' },
  -- Cut, x
  -- { "x", '""d' },
  -- { "xx", '"dd' },

  -- move window
  { "sh", "<c-w>h", desc = "Go to left window" },
  { "sj", "<c-w>j", desc = "Go to below window" },
  { "sk", "<c-w>k", desc = "Go to above window" },
  { "sl", "<c-w>l", desc = "Go to right window" },

  -- split window
  { "ss", "<c-W>s", desc = "Split window below" },
  { "sv", "<c-W>v", desc = "Split window right" },

  -- Delete a word backwards
  { "dw", 'vb"_d', desc = "Delete a word backwards" },

  -- Select all
  { "<c-a>", "gg<s-v>G", desc = "Select all" },

  -- buffer
  { "<leader>bd", ":bdelete<cr>", desc = "Delete buffer" },
  { "<leader>bD", ":bdelete!<cr>", desc = "Delete buffer (force)" },

  -- enhance enter
  { "<c-enter>", "o<esc>" },
  { "<c-enter>", "<esc>o", mode = { "i" } },

  -- vscode like, copy lines down/up action
  { "<s-a-j>", ":copy.<cr>" },
  { "<s-a-j>", ":copy.-v:count<cr>gv", mode = { "v" } },
  { "<s-a-k>", ":copy.-1<cr>" },
  { "<s-a-k>", ":copy.+v:count<cr>gv", mode = { "v" } },

  -- better ^, move cursor to start of line
  { "<c-h>", "^", mode = { "n", "v" } },
  { "<c-h>", "<esc>^i", mode = { "i" } },
  { "<c-s-h>", "<home>", mode = { "n", "i", "v" } },

  -- better $
  { "<c-l>", "<end>", mode = { "n", "i" } },
  { "<c-l>", "<end><left>", mode = { "v" } },

  -- new file
  { "<leader>fn", ":tabnew<cr>", desc = "New File" },
}

---@type LazyPluginSpec[]
M.plugins = {
  {
    "which-key.nvim",
    lazy = false,
    opts = {
      defaults = {
        ["<leader>gd"] = { name = "+diffview" },
        ["<leader>v"] = { name = "+visual" },
      },
    },
  },
  {
    "nvim-lspconfig",
    init = function()
      disable_lsp_keymaps({ "gK" })
    end,
    keys = {
      { "<c-k>", vim.lsp.buf.signature_help, desc = "Signature help" },
      { "<c-j>", "]d", remap = true },
      { "J", "[d", remap = true },
    },
  },
  {
    "lspsaga.nvim",
    keys = {
      { "K", ":Lspsaga hover_doc ++quiet<cr>", desc = "Hover" },
      { "gh", ":Lspsaga lsp_finder<cr>", desc = "LSP finder" },
      -- { "gd", ":Lspsaga goto_definition<cr>", desc = "Goto definition" },
      { "gD", ":Lspsaga goto_type_definition<cr>", desc = "Goto type definition" },
      { "gp", ":Lspsaga peek_definition<cr>", desc = "Peek definition" },
      { "gP", ":Lspsaga peek_type_definition<cr>", desc = "Peek type definition" },
      { "<leader>cd", ":Lspsaga show_line_diagnostics<cr>", desc = "Line diagnostics" },
      { "<leader>co", ":Lspsaga outline<cr>", desc = "Code outline" },
    },
    init = function(plugin)
      for _, value in ipairs(plugin.keys or {}) do
        local key = value[1]
        disable_lsp_keymaps({ key })
      end
    end,
  },
  {
    "toggleterm.nvim",
    keys = {
      {
        "<leader>gg",
        function()
          require("util.git").lazygit({ dir = require("lazyvim.util").get_root() })
        end,
        desc = "Lazygit (root dir)",
      },
      { "<leader>gG", require("util.git").lazygit, desc = "Lazygit" },
    },
  },
  {
    "neo-tree.nvim",
    keys = {
      {
        "<leader>fd",
        function()
          require("neo-tree.command").execute({ reveal = true })
        end,
        desc = "Explorer NeoTree reveal",
      },
    },
  },
  {
    "ggandor/leap.nvim",
    keys = function()
      local mode = { "n", "x", "o" }
      return {
        { "f", mode = mode, "<Plug>(leap-forward-to)", desc = "Leap forward to" },
        { "F", mode = mode, "<Plug>(leap-backward-to)", desc = "Leap backward to" },
        { "gf", mode = mode, "<Plug>(leap-from-window)", desc = "Leap from windows" },
      }
    end,
  },
  {
    "alpha-nvim",
    keys = {
      { "<leader>;", ":Alpha<cr>", desc = "Alpha" },
      { "<leader><tab>n", ":tabnew<cr>:Alpha<cr>", desc = "New Tab (Alpha)" },
    },
  },
  {
    "diffview.nvim",
    keys = {
      { "<leader>gdo", ":DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gdc", ":DiffviewClose<cr>", desc = "Diffview Close" },
      { "<leader>gdf", ":DiffviewFocusFiles<cr>", desc = "Diffview Focus files" },
      { "<leader>gdh", ":DiffviewFileHistory<cr>", desc = "Diffview File history" },
      { "<leader>gdt", ":DiffviewToggleFiles<cr>", desc = "Diffview Toggle files" },
      { "<leader>gdr", ":DiffviewRefresh<cr>", desc = "Diffview Refresh" },
    },
  },
  {
    "vim-visual-multi",
    keys = {
      { "<leader>vd", "<Plug>(VM-Find-Under)", desc = "select multi word, `n` next" },
      { "<leader>vc", "<Plug>(VM-Add-Cursor-At-Pos)", desc = "add cursor" },
      { "<leader>vj", "<Plug>(VM-Add-Cursor-Down)", desc = "add cursor down" },
      { "<leader>vk", "<Plug>(VM-Add-Cursor-Up)", desc = "add cursor up" },
    },
  },
  {
    "bufferline.nvim",
    keys = {
      { "gt", "<nop>" },
      { "gT", "<nop>" },
    },
  },
}

return M
