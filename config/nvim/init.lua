-- ========================================================================== --
-- ==                            DEPENDENCIES                              == --
-- ========================================================================== --

-- ripgrep    - https://github.com/BurntSushi/ripgrep
-- fd         - https://github.com/sharkdp/fd
-- git        - https://git-scm.com/
-- make       - https://www.gnu.org/software/make/
-- c compiler - gcc or tcc or zig

-- Basic editor options
require "user.settings"

-- Plugin management and config
require "plugins.install"

-- Keybindings
require "user.keymaps"

require "user.disable_builtin"
