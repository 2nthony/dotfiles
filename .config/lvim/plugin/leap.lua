local ok, leap = pcall(require, "leap")
if not ok then
  return
end

leap.opts.highlight_unlabeled_phase_one_targets = true
