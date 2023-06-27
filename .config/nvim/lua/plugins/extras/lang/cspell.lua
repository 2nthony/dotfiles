return {
  {
    "mason.nvim",
    opts = {
      ensure_installed = {
        "cspell",
      },
    },
  },

  -- hide cspell virtual text
  {
    "nvim-lspconfig",
    opts = function(_, opts)
      -- do not know why only works when `source == false`
      if opts.diagnostics.virtual_text.source == false then
        local format = opts.diagnostics.virtual_text.format

        opts.diagnostics.virtual_text.format = function(diagnostics)
          if diagnostics.source ~= "cspell" then
            if format then
              return format(diagnostics)
            else
              return diagnostics.message
            end
          end
        end
      end
    end,
  },

  {
    "null-ls.nvim",
    opts = function(_, opts)
      local cspell = require("cspell")
      local path = require("null-ls.utils").path

      local config_file_name = ".cspell.json"
      local config = {
        config_file_preferred_name = config_file_name,
        find_json = function(cwd)
          local workspace_cspell_json_file_path = path.join(cwd, config_file_name)
          local global_cspell_json_file_path = path.join(vim.loop.os_homedir(), config_file_name)

          if vim.fn.filereadable(workspace_cspell_json_file_path) == 1 then
            return workspace_cspell_json_file_path
          elseif vim.fn.filereadable(global_cspell_json_file_path) == 1 then
            return global_cspell_json_file_path
          end
        end,
      }

      table.insert(
        opts.sources,
        cspell.diagnostics.with({
          config = config,
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity.INFO
          end,
        })
      )
      table.insert(
        opts.sources,
        cspell.code_actions.with({
          config = config,
        })
      )
    end,
    dependencies = {
      "davidmh/cspell.nvim",
      config = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "gitcommit", "markdown" },
          callback = function()
            vim.opt_local.spell = false
          end,
        })
      end,
    },
  },
}
