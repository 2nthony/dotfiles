return {
  {
    "stevearc/overseer.nvim",
    lazy = true,
    cmd = {
      "overseeropen",
      "overseerclose",
      "overseertoggle",
      "overseersavebundle",
      "overseerloadbundle",
      "overseerdeletebundle",
      "overseerruncmd",
      "overseerrun",
      "overseerinfo",
      "overseerbuild",
      "overseerquickaction",
      "overseertaskaction",
      "overseerclearaction",
    },
    opts = {
      task_list = {
        direction = "bottom",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "debugging support. requires language specific adapters to be configured. (see lang extras)",

    dependencies = {
      "rcarriga/nvim-dap-ui",
      -- virtual text for the debugger
      {
        "thehamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },

  -- stylua: ignore
  keys = {
    { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
    { "<leader>db", function() require("dap").set_breakpoint(vim.fn.input('breakpoint condition: ')) end, desc = "breakpoint condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "toggle breakpoint" },
    { "<f5>", function() require("dap").continue() end, desc = "continue" },
    { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "run with args" },
    { "<leader>dc", function() require("dap").run_to_cursor() end, desc = "run to cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "go to line (no execute)" },
    { "<f8>", function() require("dap").step_into() end, desc = "step into" },
    { "<leader>dj", function() require("dap").down() end, desc = "down" },
    { "<leader>dk", function() require("dap").up() end, desc = "up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "run last" },
    { "<f9>", function() require("dap").step_out() end, desc = "step out" },
    { "<f7>", function() require("dap").step_over() end, desc = "step over" },
    { "<leader>dp", function() require("dap").pause() end, desc = "pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "toggle repl" },
    { "<leader>ds", function() require("dap").session() end, desc = "session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "widgets" },
  },

    config = function()
      -- load mason-nvim-dap here, after all adapters have been setup
      if lazyvim.has("mason-nvim-dap.nvim") then
        require("mason-nvim-dap").setup(lazyvim.opts("mason-nvim-dap.nvim"))
      end

      vim.api.nvim_set_hl(0, "dapstoppedline", { default = true, link = "visual" })

      for name, sign in pairs(lazyvim.config.icons.dap) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "dap" .. name,
          { text = sign[1], texthl = sign[2] or "diagnosticinfo", linehl = sign[3], numhl = sign[3] }
        )
      end

      -- setup dap config by vscode launch.json file
      local vscode = require("dap.ext.vscode")
      local json = require("plenary.json")
      vscode.json_decode = function(str)
        return vim.json.decode(json.json_strip_comments(str))
      end

      -- extends dap.configurations with entries read from .vscode/launch.json
      if vim.fn.filereadable(".vscode/launch.json") then
        vscode.load_launchjs()
      end
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
  -- stylua: ignore
  keys = {
    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "dap ui" },
    { "<leader>de", function() require("dapui").eval() end, desc = "eval", mode = {"n", "v"} },
  },
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "mason.nvim",
    cmd = { "dapinstall", "dapuninstall" },
    opts = {
      -- makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- you can provide additional configuration to the handlers,
      -- see mason-nvim-dap readme for more information
      handlers = {},

      -- you'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- update this to ensure that you have the debuggers for the langs you want
      },
    },
    -- mason-nvim-dap is loaded when nvim-dap loads
    config = function() end,
  },
}
