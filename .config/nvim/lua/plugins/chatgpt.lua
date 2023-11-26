local api = os.getenv("OPENAI_API_KEY")
local chatgpt_enabled = (api and true) or false

if not chatgpt_enabled then
  vim.notify("[chatgpt.nvim]: `OPENAI_API_KEY` not found in env", vim.log.levels.ERROR)
end

return {
  "jackmort/chatgpt.nvim",
  cond = chatgpt_enabled,
  cmd = {
    "ChatGPT",
    "ChatGPTRun",
    "ChatGPTActAs",
    "ChatGPTCompleteCode",
    "ChatGPTEditWithInstructions",
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {},
}
