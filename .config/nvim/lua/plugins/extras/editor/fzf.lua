return {
  { import = "lazyvim.plugins.extras.editor.fzf" },
  {
    "fzf-lua",
    opts = {
      file_ignore_patterns = {
        ".git/",
        -- node
        "node_modules/",
        -- rust
        "**/debug/",
        "target/release/",
        -- yarn
        ".yarn/*",
      },
      oldfiles = {
        cwd_only = true,
      },
      buffer = {
        cwd_only = true,
      },
      grep = {
        multiline = 1,
      },
    },
  },
}
