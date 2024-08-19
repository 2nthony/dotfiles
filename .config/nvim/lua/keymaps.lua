---@diagnostic disable: assign-type-mismatch

local function lsp_keymaps(keymaps)
  local keys = require("lazyvim.plugins.lsp.keymaps").get()
  vim.list_extend(keys, keymaps)
end

local M = {}

---@type LazyKeysSpec[]
M.generals = {
  -- reset
  { "q", "<nop>" },
  { "gt", "<nop>" },
  { "gT", "<nop>" },

  -- reset window navigation
  { "<c-h>", nil, mode = { "n", "t" } },
  { "<c-j>", nil, mode = { "n", "t" } },
  { "<c-k>", nil, mode = { "n", "t" } },
  { "<c-l>", nil, mode = { "n", "t" } },

  -- reset terminal navigation
  { "<c-w>", "<c-w>", mode = { "t" } },

  -- reset lazyvim lazygit
  {
    "<leader>gg",
    function()
      LazyVim.terminal.open("lazygit", {
        esc_esc = false,
        border = "none",
        size = { width = 1, height = 1 },
      })
    end,
    desc = "Lazygit",
  },
  { "<leader>gG", nil },

  -- reset lazyvim float term
  { "<leader>ft", nil },
  { "<leader>fT", nil },
  { "<c-/>", nil, mode = { "n", "t" } },
  {
    "<c-\\>",
    function()
      LazyVim.terminal(nil)
    end,
  },
  {
    "<c-\\>",
    function()
      LazyVim.terminal(nil)
    end,
    mode = { "t" },
  },

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
    desc = "Better ^",
  },
  { "<c-s-h>", "<home>", mode = { "n", "i", "v" } },

  -- better $
  { "<c-l>", "g_", mode = { "n", "v" }, desc = "Better $" },
  { "<c-l>", "<end>", mode = { "i" }, desc = "Better $" },

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
      spec = {
        { "<leader>gd", group = "+diffview" },
      },
    },
  },
  {
    "nvim-lspconfig",
    opts = function()
      lsp_keymaps({
        { "gK", false },
        { "<c-k>", vim.lsp.buf.signature_help, desc = "Signature help" },
        { "gD", false },
        { "gi", "gI", remap = true, desc = "Goto Implementation" },
      })
    end,
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
    "dashboard-nvim",
    keys = {
      { "<leader>;", ":Dashboard<cr>", desc = "Dashboard" },
      { "<leader><tab>n", ":tabnew<cr>:Dashboard<cr>", desc = "New Tab (Dashboard)" },
    },
  },
  {
    "grug-far.nvim",
    keys = {
      {
        "<leader>sf",
        ':lua require("grug-far").grug_far({ prefills = { flags = vim.fn.expand("%") } })<CR>',
        desc = "Search on current file",
      },
      {
        "<leader>sf",
        ':<C-u>lua require("grug-far").with_visual_selection({ prefills = { flags = vim.fn.expand("%") } })<CR>',
        desc = "Search on current file",
        mode = { "v" },
      },
    },
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
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>wo", ":ZenMode<cr>", desc = "Zen Mode" },
    },
  },
  {
    "abecodes/tabout.nvim",
    keys = {
      { "<m-l>", "<Plug>(TaboutMulti)", desc = "Goto end of pair", mode = { "i" } },
      { "<m-h>", "<Plug>(TaboutBackMulti)", desc = "Goto start of pair", mode = { "i" } },
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
        { "gW", search.current_word_strict, mode = { "n", "x" }, desc = "Search current word (strict)" },
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
