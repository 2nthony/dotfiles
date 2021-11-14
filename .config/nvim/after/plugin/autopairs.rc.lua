local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})

local cmp = require'cmp'
if (cmp) then
  local cmp_autopairs = require'nvim-autopairs.completion.cmp'
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({
    map_char = {
      tex = ''
    }
  }))
end
