vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.clipboard =  'unnamedplus'

vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*",
    callback = function()
        if vim.fn.exists("b:changedtick") == 1 and vim.fn.filereadable(vim.fn.expand("%")) == 1 then
            vim.cmd("silent! w")
        end
    end
})


--  set opacity 
vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]

vim.g.rustfmt_autosave = 1
vim.g.rustfmt_emit_files = 1
vim.g.rustfmt_fail_silently = 0
vim.g.rust_clip_command = "xclip -selection clipboard"

-- relevate line
vim.wo.number = true
vim.wo.relativenumber = true

-- undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/vimdid"
vim.opt.undofile = true

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.autochdir = true
-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.scrolloff= 8

vim.cmd [[ set noswapfile ]]

--Line numbers
vim.wo.number = true
