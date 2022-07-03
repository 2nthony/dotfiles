local status_nvim_web_devicons_ok, nvim_web_devicons = pcall(require, "nvim-treesitter.configs")
if not status_nvim_web_devicons_ok then
  return
end

nvim_web_devicons.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
