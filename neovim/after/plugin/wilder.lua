local wilder = require('wilder')
wilder.setup({ modes = { ':', '/', '?' } })
wilder.set_option('renderer', wilder.wildmenu_renderer({
    highlighter = wilder.basic_highlighter(),
    separator = ' · ',
    left = { ' ', wilder.wildmenu_spinner(), ' ' },
    right = { ' ', wilder.wildmenu_index() },
}))
wilder.set_option('renderer', wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
        highlights = {
            border = 'Normal', -- highlight to use for the border
        },
        -- 'single', 'double', 'rounded' or 'solid'
        -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
        border = 'rounded',
    })
))
