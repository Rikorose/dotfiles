local wk = require("which-key")
local util = require("util")

wk.setup({
  show_help = false,
  triggers = "auto",
  plugins = { spelling = true },
  key_labels = { ["<leader>"] = "SPC" },
})

-- Quickly leave insert mode
util.inoremap("jj", "<Esc>")
util.inoremap("jk", "<Esc>")
util.inoremap("kj", "<Esc>")

-- Make j/k move screen visible lines, not file lines
util.nnoremap("j", "gj")
util.nnoremap("k", "gk")

-- window navigation
util.nnoremap("<C-j>", "<C-w>j")
util.nnoremap("<C-k>", "<C-w>k")
util.nnoremap("<C-l>", "<C-w>l")
util.nnoremap("<C-h>", "<C-w>h")

-- Easier pasting
util.nnoremap("[p", ":pu!<cr>")
util.nnoremap("]p", ":pu<cr>")

-- better indenting
util.vnoremap("<", "<gv")
util.vnoremap(">", ">gv")

local leader = {
  ["w"] = {
    name = "+windows",
    ["w"] = { "<C-W>p", "other-window" },
    ["d"] = { "<C-W>c", "delete-window" },
    ["-"] = { "<C-W>s", "split-window-below" },
    ["|"] = { "<C-W>v", "split-window-right" },
    ["2"] = { "<C-W>v", "layout-double-columns" },
    ["h"] = { "<C-W>h", "split-window-below" },
    ["v"] = { "<C-W>v", "split-window-right" },
    ["="] = { "<C-W>=", "balance-window" },
  },
  s = {
    name = "+search",
    g = { "<cmd>FzfLua grep_project<cr>", "Grep" },
    b = { "<cmd>FzfLua grep_curbuf<cr>", "Buffer" },
    s = { "<cmd>FzfLua lsp_live_workspace_symbols<cr>", "Goto Symbol" },
    h = { "<cmd>FzfLua command_history<cr>", "Command History" },
    -- / = { "<cmd>FzfLua search_history<cr>", "Search History" },
    m = { "<cmd>FzfLua marks<cr>", "Jump to Mark" },
    r = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Replace word below cursor (Spectre)" },
    R = { "<cmd>lua require('spectre').open()<CR>", "Replace (Spectre)" },
  },
  ["f"] = { "<cmd>FzfLua files<cr>", "Find File" },
  ["h"] = {
    name = "+help",
    t = { "<cmd>:FzfLua builtin<cr>", "Telescope" },
    c = { "<cmd>:FzfLua commands<cr>", "Commands" },
    h = { "<cmd>:FzfLua help_tags<cr>", "Help Pages" },
    m = { "<cmd>:FzfLua man_pages<cr>", "Man Pages" },
    k = { "<cmd>:FzfLua keymaps<cr>", "Key Maps" },
    l = { [[<cmd>TSHighlightCapturesUnderCursor<cr>]], "Highlight Groups at cursor" },
    -- o = { "<cmd>:Telescope vim_options<cr>", "Options" },
    -- a = { "<cmd>:Telescope autocommands<cr>", "Auto Commands" },
    p = {
      name = "+packer",
      p = { "<cmd>PackerSync<cr>", "Sync" },
      s = { "<cmd>PackerStatus<cr>", "Status" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      c = { "<cmd>PackerCompile<cr>", "Compile" },
    },
  },
  b = {
    name = "+buffer",
    ["b"] = { "<cmd>FzfLua buffers<cr>", "Find File" },
    ["p"] = { "<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
    ["["] = { "<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
    ["n"] = { "<cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
    ["]"] = { "<cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
    ["d"] = { "<cmd>:bd<CR>", "Delete Buffer" },
    ["g"] = { "<cmd>:BufferLinePick<CR>", "Goto Buffer" },
  },
  p = {
    name = "+project",
    p = "Open Project",
    b = {
      function()
        require("fzf-lua").files({ cwd = "~/projects", fd_opts = "-d 1 -t d", previewer = "files" })
      end,
      "Browse ~/projects",
    },
    t = { ":Telescope file_browser cwd=~/projects<CR>", "Browse ~/projects" },
  },
  t = {
    name = "toggle",
    f = {
      require("config.lsp.formatting").toggle,
      "Format on Save",
    },
    s = {
      function()
        util.toggle("spell")
      end,
      "Spelling",
    },
    w = {
      function()
        util.toggle("wrap")
      end,
      "Word Wrap",
    },
    n = {
      function()
        util.toggle("relativenumber", true)
        util.toggle("number")
      end,
      "Line Numbers",
    },
  },
  x = {
    name = "+errors",
    x = { "<cmd>TroubleToggle<cr>", "Trouble" },
    w = { "<cmd>TroubleWorkspaceToggle<cr>", "Workspace Trouble" },
    d = { "<cmd>TroubleDocumentToggle<cr>", "Document Trouble" },
    l = { "<cmd>lopen<cr>", "Open Location List" },
    q = { "<cmd>copen<cr>", "Open Quickfix List" },
  },
}
local visual_leader = {
  s = {
    name = "+search",
    r = { "<cmd>lua require('spectre').open_visual()<CR>", "Replace visual selection (Spectre)" },
  },
}
wk.register(leader, { prefix = "<leader>" })
wk.register(visual_leader, { prefix = "<leader>", mode = "v" })

wk.register({ g = { name = "+goto", h = "Hop Word" }, s = "Hop Word1" })
