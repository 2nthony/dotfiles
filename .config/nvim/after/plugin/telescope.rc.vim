if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
    -- https://github.com/nvim-telescope/telescope.nvim/issues/522#issuecomment-777384452
    file_ignore_patterns = {
      "node_modules/",
      ".git/",
      -- rust
      "**/debug/",
      "target/release/",
    },
  },
  pickers = {
    find_files = {
      hidden = true
    },
  }
}
EOF

