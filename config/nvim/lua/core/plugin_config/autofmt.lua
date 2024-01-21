local autoformat_settings = {
    bzl = "buildifier",
    c = "clang-format",
    cpp = "clang-format",
    proto = "clang-format",
    javascript = "clang-format",
    arduino = "clang-format",
    dart = "dartfmt",
    go = "gofmt",
    gn = "gn",
    html = "js-beautify",
    css = "js-beautify",
    sass = "js-beautify",
    scss = "js-beautify",
    less = "js-beautify",
    json = "js-beautify",
    java = "google-java-format",
    python = "yapf", -- or "autopep8"
    rust = "rustfmt",
    vue = "prettier",
    swift = "swift-format"
}

vim.api.nvim_create_augroup("AutoFormatSettings", { clear = true })

for filetype, formatter in pairs(autoformat_settings) do
    vim.api.nvim_create_autocmd("FileType", {
        group = "AutoFormatSettings",
        pattern = filetype,
        command = "AutoFormatBuffer " .. formatter
    })
end

-- Mapping <Leader>= to prefix a command
vim.api.nvim_set_keymap('n', '<Leader>=', ':FormatCode ', { noremap = true, silent = false })

-- Create an autocmd group for auto formatting
vim.api.nvim_create_augroup("AutoFormatOnSave", { clear = true })

-- Set up autocmd to auto format on buffer save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "AutoFormatOnSave",
    pattern = "*",
    command = "FormatCode"
})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local saved_view = vim.fn.winsaveview()
        vim.cmd("%s/\\s\\+$//e")
        vim.fn.winrestview(saved_view)
    end
})

