-- https://github.com/jackMort/ChatGPT.nvim

local api = os.getenv("OPENAI_API_KEY")
local enabled = (api and true) or false

if not enabled then
  vim.notify("[chatgpt.nvim]: `OPENAI_API_KEY` not found in env", vim.log.levels.ERROR)
end

return {
  "jackmort/chatgpt.nvim",
  enabled = enabled,
  cmd = {
    "ChatGPT",
    "ChatGPTRun",
    "ChatGPTActAs",
    "ChatGPTCompletecode",
    "ChatGPTEditwithInstructions",
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {},
}
