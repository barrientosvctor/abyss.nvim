let g:airline#themes#abyss#palette = {}

let s:statusline_bg = "#000C38"
let s:darkgreen = "#22aa44"
let s:white = "#ffffff"
let s:fg = "#6688cc"
let s:shinyblue = "#2277ff"
let s:red = "#cb4444"
let s:black_inactive = "#000000"
let s:yellow = "#ddbb88"
let s:darkyellow = "#808000"
let s:red = "#cb4444"
let s:darkred = "#800000"

let s:Normal_a = [s:white, s:statusline_bg, 255, 17] " guifg, guibg, ctermfg, ctermbg
let s:Normal_b = [s:fg, s:statusline_bg, 245, 17] " guifg, guibg, ctermfg, ctermbg
let s:Normal_c = [s:fg, s:statusline_bg, 245, 17] " guifg, guibg, ctermfg, ctermbg

let s:Visual_a = [s:shinyblue, s:statusline_bg, 105, 17] " guifg, guibg, ctermfg, ctermbg
let s:Visual_b = [s:fg, s:statusline_bg, 245, 17] " guifg, guibg, ctermfg, ctermbg
let s:Visual_c = [s:fg, s:statusline_bg, 245, 17] " guifg, guibg, ctermfg, ctermbg

let s:Replace_a = [s:red, s:statusline_bg, 9, 17] " guifg, guibg, ctermfg, ctermbg
let s:Replace_b = [s:fg, s:statusline_bg, 245, 17] " guifg, guibg, ctermfg, ctermbg
let s:Replace_c = [s:fg, s:statusline_bg, 245, 17] " guifg, guibg, ctermfg, ctermbg

let s:Insert_a = [s:darkgreen, s:statusline_bg, 2, 17] " guifg, guibg, ctermfg, ctermbg
let s:Insert_b = [s:fg, s:statusline_bg, 245, 17] " guifg, guibg, ctermfg, ctermbg
let s:Insert_c = [s:fg, s:statusline_bg, 245, 17] " guifg, guibg, ctermfg, ctermbg

let s:Inactive_a = [s:fg, s:black_inactive, 245, 0] " guifg, guibg, ctermfg, ctermbg
let s:Inactive_b = [s:fg, s:black_inactive, 245, 0] " guifg, guibg, ctermfg, ctermbg
let s:Inactive_c = [s:fg, s:black_inactive, 245, 0] " guifg, guibg, ctermfg, ctermbg

let s:Warning = [s:yellow, s:statusline_bg, 11, 17] " guifg, guibg, ctermfg, ctermbg
let s:Error = [s:red, s:statusline_bg, 9, 17] " guifg, guibg, ctermfg, ctermbg

let s:IWarning = [s:darkyellow, s:statusline_bg, 3, 17] " guifg, guibg, ctermfg, ctermbg
let s:IError = [s:darkred, s:statusline_bg, 1, 17] " guifg, guibg, ctermfg, ctermbg

let g:airline#themes#abyss#palette.normal = airline#themes#generate_color_map(s:Normal_a, s:Normal_b, s:Normal_c)
let g:airline#themes#abyss#palette.normal.airline_warning = s:Warning
let g:airline#themes#abyss#palette.normal.airline_error = s:Error

let g:airline#themes#abyss#palette.insert = airline#themes#generate_color_map(s:Insert_a, s:Insert_b, s:Insert_c)
let g:airline#themes#abyss#palette.insert.airline_warning = s:Warning
let g:airline#themes#abyss#palette.insert.airline_error = s:Error

let g:airline#themes#abyss#palette.visual = airline#themes#generate_color_map(s:Visual_a, s:Visual_b, s:Visual_c)
let g:airline#themes#abyss#palette.visual.airline_warning = s:Warning
let g:airline#themes#abyss#palette.visual.airline_error = s:Error

let g:airline#themes#abyss#palette.replace = airline#themes#generate_color_map(s:Replace_a, s:Replace_b, s:Replace_c)
let g:airline#themes#abyss#palette.replace.airline_warning = s:Warning
let g:airline#themes#abyss#palette.replace.airline_error = s:Error

let g:airline#themes#abyss#palette.inactive = airline#themes#generate_color_map(s:Inactive_a, s:Inactive_b, s:Inactive_c)
let g:airline#themes#abyss#palette.inactive.airline_warning = s:IWarning
let g:airline#themes#abyss#palette.inactive.airline_error = s:IError

let g:airline#themes#abyss#palette.normal.airline_term = s:Normal_c
let g:airline#themes#abyss#palette.insert.airline_term = s:Insert_c
let g:airline#themes#abyss#palette.replace.airline_term = s:Replace_c
let g:airline#themes#abyss#palette.visual.airline_term = s:Visual_c
let g:airline#themes#abyss#palette.inactive.airline_term = s:Inactive_c
