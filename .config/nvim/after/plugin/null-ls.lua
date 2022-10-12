local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
  return
end

null_ls.setup{}
