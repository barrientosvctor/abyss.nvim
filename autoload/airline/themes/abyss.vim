" TODO: Add colors for:
" Terminal mode
" Airline Tabline
" N/I/T/modified warnings

let g:airline#themes#abyss#palette = {}

let s:statusline_bg = "#000C38"
let s:darkgreen = "#22aa44"
let s:white = "#ffffff"
let s:fg = "#6688cc"
let s:shinyblue = "#2277ff"
let s:red = "#cb4444"

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

let g:airline#themes#abyss#palette.normal = airline#themes#generate_color_map(s:Normal_a, s:Normal_b, s:Normal_c)
let g:airline#themes#abyss#palette.insert = airline#themes#generate_color_map(s:Insert_a, s:Insert_b, s:Insert_c)
let g:airline#themes#abyss#palette.visual = airline#themes#generate_color_map(s:Visual_a, s:Visual_b, s:Visual_c)
let g:airline#themes#abyss#palette.replace = airline#themes#generate_color_map(s:Replace_a, s:Replace_b, s:Replace_c)
