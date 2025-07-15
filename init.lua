-- Sanity
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.g.mapleader = "<Space>"
vim.g.rustfmt_autosave = 1
local opt = vim.opt
opt.foldmethod = "marker"       -- use marker folds
opt.number = true
require("config.lazy")
