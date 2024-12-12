return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    keys = {
      { '<Leader>mp', ':MarkdownPreview<CR>' },
      { '<Leader>mc', ':MarkdownPreviewClose<CR>' },
      { '<Leader>mr', ':MarkdownPreviewRefresh<CR>' },
      { '<Leader>mt', ':MarkdownPreviewToggle<CR>' },
    },
  },
  --latex
  'lervag/vimtex',
  'evesdropper/luasnip-latex-snippets.nvim',
}
