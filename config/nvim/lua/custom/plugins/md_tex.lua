return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    keys = {
      { 'n', '<Leader>mp', ':MarkdownPreview<CR>' },
      { 'n', '<Leader>mc', ':MarkdownPreviewClose<CR>' },
      { 'n', '<Leader>mr', ':MarkdownPreviewRefresh<CR>' },
      { 'n', '<Leader>mt', ':MarkdownPreviewToggle<CR>' },
    },
  },
  --latex
  'lervag/vimtex',
  'evesdropper/luasnip-latex-snippets.nvim',
}
