lua << EOF
  local status, vgit = pcall(require, 'vgit')
  if (not status) then return end

  local utils = require('vgit.utils')

  vgit.setup({
      debug = false, -- Only enable this to trace issues related to the app,
      keymaps = {
          ['n gk'] = 'hunk_up',
          ['n gj'] = 'hunk_down',
          ['n <leader>g'] = 'actions',
          ['n <leader>gs'] = 'buffer_hunk_stage',
          ['n <leader>gr'] = 'buffer_hunk_reset',
          ['n <leader>gp'] = 'buffer_hunk_preview',
          ['n <leader>gb'] = 'buffer_blame_preview',
          ['n <leader>gf'] = 'buffer_diff_preview',
          ['n <leader>gh'] = 'buffer_history_preview',
          ['n <leader>gu'] = 'buffer_reset',
          ['n <leader>gg'] = 'buffer_gutter_blame_preview',
          ['n <leader>gd'] = 'project_diff_preview',
          ['n <leader>gq'] = 'project',
          ['n <leader>gx'] = 'toggle_diff_preference',
      },
      controller = {
          hunks_enabled = true,
          blames_enabled = true,
          diff_strategy = 'index',
          diff_preference = 'horizontal',
          predict_hunk_signs = true,
          predict_hunk_throttle_ms = 300,
          predict_hunk_max_lines = 50000,
          blame_line_throttle_ms = 150,
          action_delay_ms = 300,
      },
      hls = vgit.themes.tokyonight,
      sign = {
          VGitViewSignAdd = {
              name = 'DiffAdd',
              line_hl = 'DiffAdd',
              text_hl = nil,
              num_hl = nil,
              icon = nil,
              text = '',
          },
          VGitViewSignRemove = {
              name = 'DiffDelete',
              line_hl = 'DiffDelete',
              text_hl = nil,
              num_hl = nil,
              icon = nil,
              text = '',
          },
          VGitSignAdd = {
              name = 'VGitSignAdd',
              text_hl = 'VGitSignAdd',
              num_hl = nil,
              icon = nil,
              line_hl = nil,
              text = '?',
          },
          VGitSignRemove = {
              name = 'VGitSignRemove',
              text_hl = 'VGitSignRemove',
              num_hl = nil,
              icon = nil,
              line_hl = nil,
              text = '?',
          },
          VGitSignChange = {
              name = 'VGitSignChange',
              text_hl = 'VGitSignChange',
              num_hl = nil,
              icon = nil,
              line_hl = nil,
              text = '?',
          },
      },
      render = {
          layout = vgit.layouts.default,
          sign = {
              priority = 10,
              hls = {
                  add = 'VGitSignAdd',
                  remove = 'VGitSignRemove',
                  change = 'VGitSignChange',
              },
          },
          line_blame = {
              hl = 'Comment',
              format = function(blame, git_config)
                  local config_author = git_config['user.name']
                  local author = blame.author
                  if config_author == author then
                      author = 'You'
                  end
                  local time = os.difftime(os.time(), blame.author_time) / (24 * 60 * 60)
                  local time_format = string.format('%s days ago', utils.round(time))
                  local time_divisions = { { 24, 'hours' }, { 60, 'minutes' }, { 60, 'seconds' } }
                  local division_counter = 1
                  while time < 1 and division_counter ~= #time_divisions do
                      local division = time_divisions[division_counter]
                      time = time * division[1]
                      time_format = string.format('%s %s ago', utils.round(time), division[2])
                      division_counter = division_counter + 1
                  end
                  local commit_message = blame.commit_message
                  if not blame.committed then
                      author = 'You'
                      commit_message = 'Uncommitted changes'
                      local info = string.format('%s ¥ %s', author, commit_message)
                      return string.format(' %s', info)
                  end
                  local max_commit_message_length = 255
                  if #commit_message > max_commit_message_length then
                      commit_message = commit_message:sub(1, max_commit_message_length) .. '...'
                  end
                  local info = string.format('%s, %s ¥ %s', author, time_format, commit_message)
                  return string.format(' %s', info)
              end,
          },
      },
  })
EOF
