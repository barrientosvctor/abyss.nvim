let s:statusline_bg = "#406385"
let s:darkgreen = "#005d55"
let s:white = "#A3D7DA"
let s:fg = "#8c63c9"
let s:shinyblue = "#2277ff"
let s:red = "#ff002f"
let s:black_inactive = "#202020"

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:white, s:statusline_bg, 255, 17, "bold" ] ]
let s:p.normal.right = [ [ s:fg, s:statusline_bg, 245, 17 ] ]
let s:p.normal.middle = [ [ s:fg, s:statusline_bg, 245, 17 ] ]

let s:p.inactive.left = [ [ s:fg, s:black_inactive, 245, 0, "bold" ] ]
let s:p.inactive.right = [ [ s:fg, s:black_inactive, 245, 0 ] ]
let s:p.inactive.middle = [ [ s:fg, s:black_inactive, 245, 0 ] ]

let s:p.insert.left = [ [ s:darkgreen, s:statusline_bg, 2, 17, "bold" ] ]
let s:p.insert.right = [ [ s:fg, s:statusline_bg, 245, 17 ] ]
let s:p.insert.middle = [ [ s:fg, s:statusline_bg, 245, 17 ] ]

let s:p.replace.left = [ [ s:red, s:statusline_bg, 9, 17, "bold" ] ]
let s:p.replace.right = [ [ s:fg, s:statusline_bg, 245, 17 ] ]
let s:p.replace.middle = [ [ s:fg, s:statusline_bg, 245, 17 ] ]

let s:p.visual.left = [ [ s:shinyblue, s:statusline_bg, 105, 17, "bold" ] ]
let s:p.visual.right = [ [ s:fg, s:statusline_bg, 245, 17 ] ]
let s:p.visual.middle = [ [ s:fg, s:statusline_bg, 245, 17 ] ]

let s:p.tabline.left = [ [ s:white, s:statusline_bg, 255, 17, "bold" ] ]
let s:p.tabline.right = [ [ s:red, s:statusline_bg, 9, 17 ] ]
let s:p.tabline.middle = [ [ s:white, s:statusline_bg, 255, 17 ] ]
let s:p.tabline.tabsel = [ [ s:statusline_bg, s:white, 17, 255 ] ]

let g:lightline#colorscheme#abyss_boreal#palette = lightline#colorscheme#fill(s:p)
