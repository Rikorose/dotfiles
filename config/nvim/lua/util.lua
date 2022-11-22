local M = {}
M.functions = {}

function M.has_neovim_v05()
  return (vim.fn.has "nvim-0.5" == 1)
end

function M.is_root()
  return (vim.loop.getuid() == 0)
end

function M.execute(id)
  local func = M.functions[id]
  if not func then
    error("Function doest not exist: " .. id)
  end
  return func()
end

function M.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function M.log(msg, hl, name)
  name = name or "Neovim"
  hl = hl or "Todo"
  vim.api.nvim_echo({ { name .. ": ", hl }, { msg } }, true, {})
end

function M.warn(msg, name)
  M.log(msg, "DiagnosticWarn", name)
end

function M.error(msg, name)
  M.log(msg, "DiagnosticError", name)
end

function M.info(msg, name)
  M.log(msg, "DiagnosticInfo", name)
end

function M.toggle(option, silent)
  local info = vim.api.nvim_get_option_info(option)
  local scopes = { buf = "bo", win = "wo", global = "o" }
  local scope = scopes[info.scope]
  local options = vim[scope]
  options[option] = not options[option]
  if silent ~= true then
    if options[option] then
      M.info("enabled vim." .. scope .. "." .. option, "Toggle")
    else
      M.warn("disabled vim." .. scope .. "." .. option, "Toggle")
    end
  end
end

local map = function(mode, key, cmd, opts, defaults)
  opts = vim.tbl_deep_extend("force", { silent = true }, defaults or {}, opts or {})

  if type(cmd) == "function" then
    table.insert(M.functions, cmd)
    if opts.expr then
      cmd = ([[luaeval('require("util").execute(%d)')]]):format(#M.functions)
    else
      cmd = ("<cmd>lua require('util').execute(%d)<cr>"):format(#M.functions)
    end
  end
  if opts.buffer ~= nil then
    local buffer = opts.buffer
    opts.buffer = nil
    return vim.api.nvim_buf_set_keymap(buffer, mode, key, cmd, opts)
  else
    return vim.api.nvim_set_keymap(mode, key, cmd, opts)
  end
end

function M.map(mode, key, cmd, opt, defaults)
  return map(mode, key, cmd, opt, defaults)
end

function M.nmap(key, cmd, opts)
  return map("n", key, cmd, opts)
end
function M.vmap(key, cmd, opts)
  return map("v", key, cmd, opts)
end
function M.xmap(key, cmd, opts)
  return map("x", key, cmd, opts)
end
function M.imap(key, cmd, opts)
  return map("i", key, cmd, opts)
end
function M.omap(key, cmd, opts)
  return map("o", key, cmd, opts)
end
function M.smap(key, cmd, opts)
  return map("s", key, cmd, opts)
end

function M.nnoremap(key, cmd, opts)
  return map("n", key, cmd, opts, { noremap = true })
end
function M.vnoremap(key, cmd, opts)
  return map("v", key, cmd, opts, { noremap = true })
end
function M.xnoremap(key, cmd, opts)
  return map("x", key, cmd, opts, { noremap = true })
end
function M.inoremap(key, cmd, opts)
  return map("i", key, cmd, opts, { noremap = true })
end
function M.onoremap(key, cmd, opts)
  return map("o", key, cmd, opts, { noremap = true })
end
function M.snoremap(key, cmd, opts)
  return map("s", key, cmd, opts, { noremap = true })
end

return M
