require("luasnip.loaders.from_vscode").lazy_load()
local luasnip = require "luasnip"
local types = require "luasnip.util.types"
luasnip.setup({
    region_check_events = "CursorHold,InsertLeave",
    -- those are for removing deleted snippets, also a common problem
    delete_check_events = "TextChanged,InsertEnter",
})
