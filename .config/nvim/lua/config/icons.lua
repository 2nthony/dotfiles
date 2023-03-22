-- module for `require('lazyvim.config').icons`
local icons = {}

icons.diagnostics = {
  Error = "",
  Warn = "",
  Info = "",
  Question = "",
  Hint = "",
  Debug = "",
  Trace = "✎",
}

icons.git = {
  Added = "",
  Modified = "",
  Removed = "",
  FileDeleted = "",
  FileIgnored = "",
  FileRenamed = "",
  FileStaged = "S",
  FileUnmerged = "",
  FileUnstaged = "",
  FileUntracked = "U",
  Branch = "",
  Diff = "",
  Repo = "",
}

icons.misc = {
  Lazy = "󰒲",
}

icons.ui = {
  ArrowDown = "",
  ArrowLeft = "",
  ArrowRight = "",
  ArrowUp = "",
  ArrowCircleDown = "󰳜",
  ArrowCircleLeft = "󰳞",
  ArrowCircleRight = "󰳠",
  ArrowCircleUp = "󰳢",
  BookMark = "",
  BoxChecked = "",
  Bug = "",
  Stacks = "",
  DebugConsole = "",
  Calendar = "",
  Check = "",
  ChevronDown = "",
  ChevronLeft = "",
  ChevronRight = "",
  ChevronUp = "",
  Circle = "",
  CircleFilled = "",
  CircleLarge = "",
  CircleLargeFilled = "",
  CircleSmallFilled = "",
  Close = "",
  CloseAll = "",
  CloudDownload = "",
  Code = "",
  Comment = "",
  Dashboard = "",
  DividerLeft = "",
  DividerRight = "",
  Ellipsis = "…",
  File = "",
  FileSymlink = "",
  Files = "",
  FileTree = "󱏒",
  FindFile = "󰮗",
  FindText = "",
  Fire = "",
  Folder = "󰉋",
  FolderLine = "󰉖",
  FolderOpen = "󰝰",
  FolderOpenLine = "󰷏",
  FolderSymlink = "󰉒",
  Gear = "",
  History = "",
  Lightbulb = "",
  LineLeft = "▏",
  LineMiddle = "│",
  List = "",
  ListTree = "",
  Lock = "",
  NewFile = "",
  Note = "",
  Package = "󰏗",
  Edit = "",
  Plus = "",
  Project = "",
  Search = "",
  SignIn = "",
  SignOut = "",
  Tab = "",
  Table = "",
  Target = "󰀘",
  Telescope = "",
  Text = "",
  Tree = "󰐅",
  Triangle = "契",
  TriangleShortArrowDown = "",
  TriangleShortArrowLeft = "",
  TriangleShortArrowRight = "",
  TriangleShortArrowUp = "",
  Palette = "󰏘",
  PaletteLine = "󰸌",
  Heart = "󰣐",
  HeartLine = "󱢠",
  PrimitiveSquare = "",
  PrimitiveSquareLine = "",
  PrimitiveDot = "",
}

icons.kinds = {
  Codeium = "",
  Color = icons.ui.Palette,
}

--- @param category 'diagnostics'|'git'|'misc'|'ui'|'kinds'
--- @return table<string, string>
local function add_space(category)
  local tbl = vim.deepcopy(icons[category])

  for key, value in pairs(tbl) do
    tbl[key] = value .. " "
  end

  return tbl
end

icons.diagnostics = add_space("diagnostics")
icons.kinds = add_space("kinds")

return icons
