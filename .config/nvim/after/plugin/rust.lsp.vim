" https://sharksforarms.dev/posts/neovim-rust/

if !executable("rust-analyzer")
  echo "[rust-analyzer] brew install rust-analyzer"
  finish
endif

lua << EOF
local lsp = require('lspconfig')
local cmp_lsp = require'cmp_nvim_lsp'
local capabilities = require'helpers.capabilities'
local on_attach = require'helpers.on_attach'

require'rust-tools'.setup{
  tools = {
    autoSetHints = true,
      hover_with_actions = true,
      inlay_hints = {
        show_parameter_hints = false,
        parameter_hints_prefix = "",
        other_hints_prefix = "",
      },
  },

  server = {
    on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
            command = "clippy"
        },
      }
    }
  },
}

EOF
