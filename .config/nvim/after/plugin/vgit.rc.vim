lua << EOF
  local status, vgit = pcall(require, 'vgit')
  if (not status) then return end

  local utils = require('vgit.utils')

  vgit.setup({
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
    settings = {
      hls = {
        GitBackgroundPrimary = 'NormalFloat',
        GitBackgroundSecondary = {
          gui = nil,
          fg = nil,
          bg = nil,
          sp = nil,
          override = false,
        },
        GitBorder = 'LineNr',
        GitLineNr = 'LineNr',
        GitComment = 'Comment',
        GitSignsAdd = {
          gui = nil,
          fg = '#d7ffaf',
          bg = nil,
          sp = nil,
          override = false,
        },
        GitSignsChange = {
          gui = nil,
          fg = '#7AA6DA',
          bg = nil,
          sp = nil,
          override = false,
        },
        GitSignsDelete = {
          gui = nil,
          fg = '#e95678',
          bg = nil,
          sp = nil,
          override = false,
        },
        GitSignsAddLn = 'DiffAdd',
        GitSignsDeleteLn = 'DiffDelete',
        GitWordAdd = {
          gui = nil,
          fg = nil,
          bg = '#5d7a22',
          sp = nil,
          override = false,
        },
        GitWordDelete = {
          gui = nil,
          fg = nil,
          bg = '#960f3d',
          sp = nil,
          override = false,
        },
      },
      live_blame = {
        enabled = true,
        debounce_ms = 300,
        format = function(blame, git_config)
          local config_author = git_config['user.name']
          local author = blame.author
          if config_author == author then
            author = 'You'
          end
          local function round(x)
            return x >= 0 and math.floor(x + 0.5) or math.ceil(x - 0.5)
          end
          local time = os.difftime(os.time(), blame.author_time) / (24 * 60 * 60)
          local time_format = string.format('%s days ago', round(time))
          local time_divisions = {
            { 24, 'hours' },
            { 60, 'minutes' },
            { 60, 'seconds' },
          }
          local division_counter = 1
          while time < 1 and division_counter ~= #time_divisions do
            local division = time_divisions[division_counter]
            time = time * division[1]
            time_format = string.format('%s %s ago', round(time), division[2])
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
          local info = string.format(
            '%s, %s ¥ %s',
            author,
            time_format,
            commit_message
          )
          return string.format(' %s', info)
        end,
      },
      live_gutter = {
        enabled = true,
        debounce_ms = 50,
      },
      scene = {
        diff_preference = 'unified',
      },
      signs = {
        priority = 10,
        definitions = {
          GitSignsAddLn = {
            linehl = 'GitSignsAddLn',
            texthl = nil,
            numhl = nil,
            icon = nil,
            text = '',
          },
          GitSignsDeleteLn = {
            linehl = 'GitSignsDeleteLn',
            texthl = nil,
            numhl = nil,
            icon = nil,
            text = '',
          },
          GitSignsAdd = {
            texthl = 'GitSignsAdd',
            numhl = nil,
            icon = nil,
            linehl = nil,
            text = '?',
          },
          GitSignsDelete = {
            texthl = 'GitSignsDelete',
            numhl = nil,
            icon = nil,
            linehl = nil,
            text = '?',
          },
          GitSignsChange = {
            texthl = 'GitSignsChange',
            numhl = nil,
            icon = nil,
            linehl = nil,
            text = '?',
          },
        },
        usage = {
          scene = {
            add = 'GitSignsAddLn',
            remove = 'GitSignsDeleteLn',
          },
          main = {
            add = 'GitSignsAdd',
            remove = 'GitSignsDelete',
            change = 'GitSignsChange',
          },
        },
      },
      symbols = {
        void = '?',
      },
    }
  })
EOF
