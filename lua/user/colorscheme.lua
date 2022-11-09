vim.cmd [[
try
    if (has("termguicolors"))
        set termguicolors
    endif
    colorscheme OceanicNext
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
endtry
]]

