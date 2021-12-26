if !executable("volar-server")
  echo "volar: npm i -g @volar/server"
  finish
endif

lua << EOF
local lsp = require'lspconfig'

lsp.volar.setup{}
EOF
