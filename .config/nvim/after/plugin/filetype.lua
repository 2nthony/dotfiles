local status_filetype_ok, filetype = pcall(require, 'filetype')
if not status_filetype_ok then
  return
end

filetype.setup{
  overrides = {
    extensions = {
      tsx = 'typescriptreact'
    },
    complex = {
      -- Set the filetype of any full filename matching the regex to gitconfig
      [".*git/config"] = "gitconfig", -- Included in the plugin
    },
  }
}
