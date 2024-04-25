-- Rerun tests only if their modification time changed.
cache = true

-- Global objects defined by the C code
read_globals = {
  "vim",
}

ignore = {
  "631",  -- max_line_length
  "121", -- setting read-only global variable 'vim'
  "122", -- setting read-only field of global variable 'vim'
  "581", -- negation of a relational operator- operator can be flipped (not for tables)
}
