local status_goto_preview_ok, goto_preview = pcall(require, 'goto-preview')
if not status_goto_preview_ok then
  return
end

goto_preview.setup{}
