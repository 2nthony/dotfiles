-- module for `require('lazyvim.config').icons`
local icons = {}

icons.ui = {
  ArrowDown = "",
  ArrowLeft = "",
  ArrowRight = "",
  ArrowUp = "",
  ArrowCircleDown = "󰳜",
  ArrowCircleLeft = "󰳞",
  ArrowCircleRight = "󰳠",
  ArrowCircleUp = "󰳢",
  Beaker = "",
  BookMark = "",
  BoxChecked = "",
  Bug = " ",
  Stacks = " ",
  DebugConsole = " ",
  DebugStop = " ",
  Calendar = " ",
  Check = "",
  ChevronDown = "",
  ChevronLeft = "",
  ChevronRight = "",
  ChevronUp = "",
  ChromeMaximize = "",
  Circle = "",
  CircleFilled = "",
  CircleLarge = " ",
  CircleLargeFilled = " ",
  CircleSmallFilled = "",
  Close = "",
  CloseAll = " ",
  CloudDownload = "",
  Code = " ",
  Comment = " ",
  Dashboard = " ",
  DividerLeft = "",
  DividerRight = "",
  Ellipsis = "…",
  Error = " ",
  File = " ",
  FileSymlink = " ",
  Files = " ",
  FileTree = "󱏒 ",
  FindFile = "󰮗 ",
  FindText = "",
  Fire = "",
  Folder = "",
  FolderOpened = "",
  FolderSymlink = "",
  Gear = " ",
  History = " ",
  Info = " ",
  Lightbulb = " ",
  LightbulbAutofix = " ",
  LineLeft = "▏",
  LineMiddle = "│",
  List = " ",
  ListTree = " ",
  Lock = " ",
  NewFile = " ",
  Note = " ",
  Package = "󰏗 ",
  Edit = " ",
  Plus = " ",
  Project = " ",
  Pencil = "✎",
  Search = " ",
  Skull = "󰯈 ",
  SignIn = " ",
  SignOut = " ",
  Tab = " ",
  Table = " ",
  Target = "󰀘 ",
  Telescope = " ",
  Text = "",
  Tree = "󰐅",
  Triangle = "契",
  TriangleShortArrowDown = "",
  TriangleShortArrowLeft = "",
  TriangleShortArrowRight = "",
  TriangleShortArrowUp = "",
  Warning = " ",
  Palette = "󰏘 ",
  PaletteLine = "󰸌 ",
  Question = " ",
  Heart = "󰣐 ",
  HeartLine = "󱢠 ",
  PrimitiveSquare = "",
  PrimitiveSquareLine = "",
  PrimitiveDot = "",
}

icons.diagnostics = {
  Error = icons.ui.Error,
  Warn = icons.ui.Warning,
  Info = icons.ui.Info,
  Hint = icons.ui.Lightbulb,
}

icons.misc = {
  Lazy = "󰒲 ",
}

icons.kinds = {
  Codeium = " ",
  Color = icons.ui.Palette,
}

icons.git = {
  Added = " ",
  Modified = " ",
  Deleted = " ",
  Ignored = " ",
  Renamed = " ",
  Staged = "",
  Unstaged = "",
  Untracked = icons.ui.DebugStop,
  Unmerged = " ",
  Conflict = " ",
  Branch = "",
  Diff = " ",
  Repo = " ",
}
icons.git_text = vim.tbl_extend("force", icons.git, {
  Added = "A",
  Modified = "M",
  Deleted = "D",
  Ignored = "I",
  Renamed = "R",
  Staged = "S",
  Unstaged = "U",
  Untracked = "?",
})

-- alias
icons.ui.Test = icons.ui.Beaker

--- @param category 'diagnostics'|'git'|'git_text'|'misc'|'ui'|'kinds'
--- @return table<string, string>
local function add_lower_case(category)
  local tbl = vim.deepcopy(icons[category])

  for key, value in pairs(tbl) do
    tbl[string.lower(key)] = value
  end

  return tbl
end

icons.diagnostics = add_lower_case("diagnostics")
icons.git = add_lower_case("git")
icons.git_text = add_lower_case("git_text")

return icons
