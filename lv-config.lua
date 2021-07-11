-- O is the global options object

-- general
O.auto_complete = true
O.colorscheme = 'spacegray'
O.timeoutlen = 100
O.leader_key = ' '
O.hl_search = true
-- This approach to formatting on save is very slow and cringe
-- However, neovim loads slowly if we disable format_on_save
-- Hopefully, a faster format_on_save approach will be merged upstream
-- O.format_on_save = false

-- After changing plugin config it is recommended to run :PackerCompile
O.plugin.colorizer.active = true
O.plugin.trouble.active = true
O.plugin.floatterm.active = true
-- O.plugin.markdown_preview.active = true

-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = "all"
O.treesitter.highlight.enabled = true

-- lua
O.lang.lua.autoformat = false
O.lang.lua.formatter = 'lua-format'

-- javascript
O.lang.tsserver.formatter = 'eslint_d'
O.lang.tsserver.linter = 'eslint_d'
O.lang.tsserver.autoformat = true

-- json
O.lang.json.autoformat = true
