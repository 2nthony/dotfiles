local status_autotag_ok, autotag = pcall(require, "nvim-ts-autotag")
if not status_autotag_ok then
  return
end

autotag.setup {}
