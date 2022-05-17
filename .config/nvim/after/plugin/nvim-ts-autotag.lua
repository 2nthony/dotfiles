local status_nvim_ts_autotag_ok, autotag = pcall(require, "nvim-ts-autotag")
if not status_nvim_ts_autotag_ok then
  return
end

autotag.setup{}

