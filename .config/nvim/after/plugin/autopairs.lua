local status_autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
if (not status_autopairs_ok) then return end

autopairs.setup{
  disable_filetype = { "TelescopePrompt" , "vim" },
}

local status_cmp_ok, cmp = pcall(require, "cmp")
if status_cmp_ok then
  local cmp_autopairs = require'nvim-autopairs.completion.cmp'
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({
    map_char = { tex = '' }
  }))
end
