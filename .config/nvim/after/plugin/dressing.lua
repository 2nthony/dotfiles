local status_dressing_ok, dressing = pcall(require, 'dressing')
if not status_dressing_ok then
  return
end

dressing.setup{}
