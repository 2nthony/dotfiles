-- https://www.lazyvim.org/plugins/lsp#nvim-lspconfig

local float = require("util.opts").float
local icons = require("config.icons")
local icons_ui = icons.get("ui")
local icons_kinds_space = icons.get("kinds", { "space" })
local timeout = require("util.lsp").timeout
local get_setting = require("util.vscode").get_setting

vim.lsp.set_log_level(vim.log.levels.ERROR)

return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.linting.eslint" },
  { import = "plugins.extras.lang.vue" },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    opts = {
      autoformat = get_setting("editor.formatOnSave"),
      diagnostics = {
        virtual_text = {
          prefix = icons_ui.CircleFilled,
        },
        severity_sort = true,
      },
      format = {
        timeout_ms = timeout,
      },
      servers = {
        unocss = {},
      },
    },
  },

  -- lspsaga
  {
    "nvimdev/lspsaga.nvim",
    lazy = true,
    -- event = { "LspAttach" },
    cmd = { "Lspsaga" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      request_timeout = timeout,
      ui = {
        title = false,
        border = float.border,
        colors = {
          normal_bg = "none",
          title_bg = "none",
        },
        expand = icons_ui.ChevronRight,
        collapse = icons_ui.ChevronDown,
        kind = {
          ["Array"] = { icons_kinds_space.Array, "Type" },
          ["Function"] = { icons_kinds_space.Function, "Function" },
          ["Interface"] = { icons_kinds_space.Interface, "Interface" },
          ["Object"] = { icons_kinds_space.Object, "Type" },
          ["Folder"] = { icons_ui.FolderOpened .. " ", "Folder" },
          ["String"] = { icons_kinds_space.String, "String" },
        },
      },
      outline = {
        keys = {
          jump = "<cr>",
        },
      },
      finder = {
        keys = {
          vsplit = "v",
          split = "s",
          quit = { "q", "<esc>" },
          edit = { "<cr>" },
          close_in_preview = "q",
        },
      },
      definition = {
        edit = "<cr>",
        vsplit = "<C-v>",
        split = "<C-s>",
        tabe = "<C-t>",
      },
      lightbulb = {
        enable = false,
        enable_in_insert = false,
      },
      -- breadcrumbs
      -- https://github.com/glepnir/lspsaga.nvim#lspsaga-symbols-in-winbar
      symbol_in_winbar = {
        enable = false,
        separator = " " .. icons_ui.ChevronRight .. " ",
        color_mode = false,
      },
      beacon = {
        enable = false,
      },
    },
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      log_level = vim.log.levels.ERROR,
      ensure_installed = {
        "stylua",
      },
    },
  },

  -- lsp settings
  {
    "tamago324/nlsp-settings.nvim",
    cmd = "LspSettings",
    opts = {},
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    opts = function(_, opts)
      local nls = require("null-ls")

      return vim.tbl_extend("force", opts, {
        log_level = "error",
        sources = vim.list_extend(opts.sources, {
          nls.builtins.formatting.prettier.with({
            condition = function(utils)
              return utils.root_has_file_matches(".prettier*")
            end,
          }),
        }),
      })
    end,
  },
}
