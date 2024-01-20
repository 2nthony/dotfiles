---@diagnostic disable: assign-type-mismatch

local Util = require("lazyvim.util")

local function override_lsp_keymaps(keymaps)
  local keys = require("lazyvim.plugins.lsp.keymaps").get()
  for _, keymap in ipairs(keymaps or {}) do
    keys[#keys + 1] = keymap
  end
end

local M = {}

---@type LazyKeysSpec[]
M.generals = {
  -- reset
  { "q", "<nop>" },
  { "gt", "<nop>" },
  { "gT", "<nop>" },

  -- reset window navigation
  { "<c-h>", "<nop>", mode = { "n", "t" } },
  { "<c-j>", "<nop>", mode = { "n", "t" } },
  { "<c-k>", "<nop>", mode = { "n", "t" } },
  { "<c-l>", "<nop>", mode = { "n", "t" } },

  -- reset terminal navigation
  { "<c-w>", "<c-w>", mode = { "t" } },

  -- reset lazyvim lazygit
  {
    "<leader>gg",
    function()
      Util.terminal.open("lazygit", {
        esc_esc = false,
        border = "none",
        size = { width = 1, height = 1 },
      })
    end,
    desc = "Lazygit",
  },
  { "<leader>gG", false },

  -- reset lazyvim float term
  { "<leader>ft", false },
  { "<leader>fT", false },
  { "<c-/>", false, mode = { "n", "t" } },
  {
    "<c-\\>",
    function()
      Util.terminal.open(nil)
    end,
  },
  { "<c-\\>", "<cmd>close<cr>", mode = { "t" } },

  -- remap macrp record key
  { "Q", "q" },

  -- delete is not cut
  -- https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim/30423919#30423919
  -- Delete, d
  { "d", '"_d', mode = { "n", "x" } },
  { "D", '"_D', mode = { "n", "x" } },
  { "x", '"_x', mode = { "n", "x" } },
  { "X", '"_X', mode = { "n", "x" } },
  -- Cut, x
  { "x", "d", mode = { "n", "x" } },
  { "xx", "dd" },
  { "X", "D", mode = { "n", "x" } },

  -- move window
  { "sh", "<c-w>h", desc = "Go to left window" },
  { "sj", "<c-w>j", desc = "Go to below window" },
  { "sk", "<c-w>k", desc = "Go to above window" },
  { "sl", "<c-w>l", desc = "Go to right window" },

  -- split window
  { "ss", "<c-W>s", desc = "Split window below" },
  { "sv", "<c-W>v", desc = "Split window right" },

  -- Delete a word backwards
  { "db", 'vb"_d', desc = "Delete a word backwards" },

  -- Visual paste, don't yank
  -- changed to `x(visual)` only, see https://github.com/L3MON4D3/LuaSnip/issues/748#issuecomment-1407325131
  { "p", '"_dP', mode = "x" },

  -- Select all
  { "<c-a>", "gg<s-v>G", desc = "Select all" },

  -- buffer
  { "[b", ":bprevious<cr>", desc = "Back buffer" },
  { "]b", ":bnext<cr>", desc = "Forward buffer" },

  -- enhance enter
  {
    "<c-enter>",
    function()
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      vim.api.nvim_put({ "" }, "l", true, true)
      vim.api.nvim_win_set_cursor(0, { row + 1, col })
    end,
    mode = { "n", "i" },
  },
  {
    "<s-c-enter>",
    function()
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      vim.api.nvim_put({ "" }, "l", false, true)
      vim.api.nvim_win_set_cursor(0, { row, col })
    end,
    mode = { "n", "i" },
  },

  -- better ^, move cursor to start of line
  {
    "<c-h>",
    function()
      vim.cmd("normal! ^")
    end,
    mode = { "n", "i", "v" },
  },
  { "<c-s-h>", "<home>", mode = { "n", "i", "v" } },

  -- better $
  { "<c-l>", "g_", mode = { "n", "v" } },
  { "<c-l>", "<end>", mode = { "i" } },

  -- new file
  { "<leader>fn", ":tabnew<cr>", desc = "New File" },

  -- scroll window one line up/down
  -- https://stackoverflow.com/a/14308057
  { "<c-e>", "<c-x><c-e>", mode = "i" },
  { "<c-y>", "<c-x><c-y>", mode = "i" },

  {
    "<c-z>",
    function()
      vim.cmd("undo")
    end,
    desc = "Undo",
  },
}

---@type LazyPluginSpec[]
M.plugins = {
  { import = "plugins.extras.keymap.copy-lines-action" },
  { import = "plugins.extras.keymap.superkey" },

  {
    "which-key.nvim",
    lazy = false,
    opts = {
      defaults = {
        ["<leader>gd"] = { name = "+diffview" },
        ["<leader>v"] = { name = "+visual" },
        ["<leader>j"] = { name = "+job (Overseer)" },
      },
    },
  },
  {
    "nvim-lspconfig",
    init = function(self)
      override_lsp_keymaps(self.keys)
    end,
    keys = {
      { "gK", false },
      { "gi", "gI", remap = true, desc = "Goto Implement" },
      { "<c-k>", vim.lsp.buf.signature_help, desc = "Signature help" },
      { "<c-j>", "]d", remap = true },
      { "J", "[d", remap = true },
    },
  },
  {
    "neo-tree.nvim",
    keys = {
      { "<leader>fE", false },
      { "<leader>E", false },
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "File Explorer",
      },
      { "<leader>e", "<leader>fe", remap = true, desc = "File Explorer" },
      {
        "<leader>fd",
        function()
          require("neo-tree.command").execute({ reveal = true, dir = vim.loop.cwd() })
        end,
        desc = "File Explorer reveal",
      },
    },
  },
  {
    "telescope.nvim",
    keys = {
      { "<leader>ff", ":Telescope find_files<cr>", desc = "Find Files" },
      { "<leader><space>", "<leader>ff", remap = true, desc = "Find Files" },
      { "<leader>fF", false },
      { "<leader>gf", Util.telescope("files", { cwd = false }), desc = "Git Files" },
      { "<leader>sg", Util.telescope("live_grep", { cwd = false }), desc = "Grep" },
      { "<leader>/", "<leader>sg", remap = true, desc = "Grep" },
      { "<leader>sG", false },
      { "<leader>sw", Util.telescope("grep_string", { cwd = false }), desc = "Word" },
      { "<leader>sW", false },
      { "<leader>fR", false },
      { "<leader><space>", ":Telescope commands<cr>", desc = "Commad palette" },
    },
  },
  {
    "dashboard-nvim",
    keys = {
      { "<leader>;", ":Dashboard<cr>", desc = "Dashboard" },
      { "<leader><tab>n", ":tabnew<cr>:Dashboard<cr>", desc = "New Tab (Dashboard)" },
    },
  },
  {
    "nvim-spectre",
    keys = {
      {
        "<leader>sr",
        ':lua require("spectre").open_visual({select_word = true})<CR>',
        desc = "Replace in files (Spectre)",
        mode = { "v" },
      },
      {
        "<leader>sf",
        ':lua require("spectre").open_file_search()<CR>',
        desc = "Search on current file (Spectre)",
      },
      {
        "<leader>sf",
        ':lua require("spectre").open_file_search({select_word = true})<CR>',
        desc = "Search on current file (Spectre)",
        mode = { "v" },
      },
    },
  },

  -- extra plugins
  {
    "nvimdev/lspsaga.nvim",
    vscode = false,
    keys = {
      -- { "K", ":Lspsaga hover_doc ++quiet<cr>", desc = "Hover" },
      { "gh", ":Lspsaga finder<cr>", desc = "LSP finder" },
      -- { "gd", ":Lspsaga goto_definition<cr>", desc = "Goto definition" },
      { "gD", ":Lspsaga goto_type_definition<cr>", desc = "Goto type definition" },
      { "gp", ":Lspsaga peek_definition<cr>", desc = "Peek definition" },
      { "gP", ":Lspsaga peek_type_definition<cr>", desc = "Peek type definition" },
      -- { "<c-j>", ":Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" },
      -- { "J", ":Lspsaga diagnostic_jump_prev<cr>", desc = "Prev Diagnostic" },
      { "<leader>cd", ":Lspsaga show_line_diagnostics<cr>", desc = "Line diagnostics" },
      { "<leader>cs", ":Lspsaga outline<cr>", desc = "Code outline" },
      { "<leader>ci", ":Lspsaga incoming_calls<cr>", desc = "Incoming calls" },
      { "<leader>co", ":Lspsaga outgoing_calls<cr>", desc = "Outgoing calls" },
      { "<leader>ca", ":Lspsaga code_action<cr>", desc = "Code action", mode = { "n", "v" } },
    },
    init = function(self)
      override_lsp_keymaps(self.keys)
    end,
  },
  {
    "folke/flash.nvim",
    keys = {
      {
        "f",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { forward = true, wrap = false, multi_window = false },
          })
        end,
        desc = "Flash forward",
      },
      {
        "F",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { forward = false, wrap = false, multi_window = false },
          })
        end,
        desc = "Flash backward",
      },
      {
        "gf",
        function()
          require("flash").jump({
            search = { multi_window = true },
          })
        end,
        desc = "Flash window",
      },
    },
  },
  {
    "sindrets/diffview.nvim",
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
    "mg979/vim-visual-multi",
    keys = {
      { "<leader>vd", "<Plug>(VM-Find-Under)", desc = "select multi word, `n` next" },
      { "<leader>vc", "<Plug>(VM-Add-Cursor-At-Pos)", desc = "add cursor" },
      { "<leader>vj", "<Plug>(VM-Add-Cursor-Down)", desc = "add cursor down" },
      { "<leader>vk", "<Plug>(VM-Add-Cursor-Up)", desc = "add cursor up" },
    },
  },
  {
    "stevearc/overseer.nvim",
    keys = {
      { "<leader>jl", ":OverseerToggle<cr>", desc = "Overseer List Toggle" },
      { "<leader>jr", ":OverseerRun<cr>", desc = "Overseer Run" },
      { "<leader>jc", ":OverseerRunCmd<cr>", desc = "Overseer Run Cmd" },
      { "<leader>ji", ":OverseerInfo<cr>", desc = "Overseer Info" },
    },
  },
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>wo", ":ZenMode<cr>", desc = "Zen Mode" },
    },
  },
  {
    "abecodes/tabout.nvim",
    keys = {
      { "<a-l>", "<Plug>(TaboutMulti)", desc = "Goto end of pair", mode = { "i" } },
      { "<a-h>", "<Plug>(TaboutBackMulti)", desc = "Goto start of pair", mode = { "i" } },
    },
  },
  {
    "backdround/improved-search.nvim",
    lazy = false,
    vscode = true,
    enabled = true,
    keys = function()
      local search = require("improved-search")

      return {
        { "n", search.stable_next, mode = { "n", "x", "o" }, desc = "Search next" },
        { "N", search.stable_previous, mode = { "n", "x", "o" }, desc = "Search previous" },
        -- https://github.com/LazyVim/LazyVim/commit/23e2b073e6fa75dacaa58dc1fe63392af7f54598
        { "gw", search.current_word, mode = { "n", "x" }, desc = "Search current word" },
        { "!", search.in_place, mode = { "x" }, desc = "Search selection without moving" },
        { "*", search.forward, mode = { "x" }, desc = "Search selection forward" },
        { "#", search.forward, mode = { "x" }, desc = "Search selection backward" },
      }
    end,
    config = function() end,
  },
  {
    "NeogitOrg/neogit",
    optional = true,
    keys = {
      { "<leader>gn", ":Neogit<cr>", desc = "Neogit" },
    },
  },
}

return M
