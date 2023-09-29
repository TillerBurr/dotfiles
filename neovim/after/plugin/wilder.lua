if not vim.g.vscode then
local wilder = require('wilder')
wilder.setup({ modes = { ':', '/', '?' } })

wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
      fuzzy = 1,
      set_pcre2_pattern = 1,
    }),
    wilder.python_search_pipeline({
      pattern = 'fuzzy',
    })
  ),
})

local highlighters = {
  wilder.lua_fzy_highlighter(),
}

local accent_hl = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#f4468f'}})
wilder.set_option('renderer', wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
        highlights = {
            border = 'Normal', -- highlight to use for the border
            accent = accent_hl
        },
        -- 'single', 'double', 'rounded' or 'solid'
        -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
        border = 'rounded',
        highlighter =highlighters,
        left = { ' ', wilder.popupmenu_devicons() },
        right = { ' ', wilder.popupmenu_scrollbar() }
    })))

end
