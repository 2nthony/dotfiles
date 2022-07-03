if vim.g.accelerated_jk_enable_deceleration then
  vim.cmd([[
    nmap j <Plug>(accelerated_jk_gj)
    nmap k <Plug>(accelerated_jk_gk)
  ]])
end

