-- module for `require('lazyvim.config').icons`
local icons = {}

icons.diagnostics = {
  Error = " ",
  Warn = " ",
  Info = " ",
  Question = " ",
  Hint = " ",
  Debug = " ",
  Trace = "✎ ",
}

icons.git = {
  Added = " ",
  Modified = " ",
  Removed = " ",
  FileDeleted = " ",
  FileIgnored = " ",
  FileRenamed = " ",
  FileStaged = "S",
  FileUnmerged = "",
  FileUnstaged = "",
  FileUntracked = "U",
  Branch = "",
  Diff = " ",
  Repo = " ",
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
  Codeium = " ",
  Color = icons.ui.Palette .. " ",
}

--- @type fun(p1: table): table
local function compat_case(icons_tbl)
  local tbl = vim.deepcopy(icons_tbl)

  for key, val in pairs(icons_tbl) do
    tbl[key] = val
    tbl[string.lower(key)] = val
  end

  return tbl
end

icons.diagnostics = compat_case(icons.diagnostics)
icons.git = compat_case(icons.git)

return icons
